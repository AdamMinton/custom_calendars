connection: "aminton-sandbox-ps"

include: "/views/**/*.view"

datagroup: daily {
  sql_trigger: SELECT CURRENT_DATE ;;
}

explore: order_items_parameter {
  from: order_items
  view_name: order_items

  conditionally_filter: {
    #This ensures no one filters the entire dataset
    filters: [arbitrary_period_analysis.first_period_filter: "7 days ago for 7 days"]
    #As noted above, there are 2 primary dte filters this will allow the user to remove the first one. If they remove this filter, the above filter will pop back in.
    unless: [fiscal_period_analysis_calendar.date_filter]
  }

  sql_always_where:
  ( {% condition arbitrary_period_analysis.first_period_filter %} ${order_items.created_date}  {% endcondition %} )
    {% if arbitrary_period_analysis.second_period_filter._in_query%}
      OR ( {% condition arbitrary_period_analysis.second_period_filter %} ${order_items.created_date} {% endcondition %} )
    {% endif %}
  {% if fiscal_period_analysis_calendar.date_filter._in_query %}
  {% assign parameter_selected = fiscal_period_analysis_calendar.date_filter._parameter_value %}
  AND ${order_items.created_date} IN ( @{fiscal_date_filter} )
  {% endif %};;

  join: fiscal_calendar {
    type: inner
    sql_on: ${order_items.created_date} = ${fiscal_calendar.calendar_date};;
    relationship: many_to_one
  }

  join: fiscal_period_analysis_calendar {
    type: inner
    sql_on: ${fiscal_calendar.calendar_date} = ${fiscal_period_analysis_calendar.calendar_raw} ;;
    relationship: one_to_one
    sql_where: ${fiscal_period_analysis_calendar.in_selected_time_period} IS TRUE AND
          {% if fiscal_period_analysis_calendar.is_to_period._in_query %}
            {% if fiscal_period_analysis_calendar.is_to_period._parameter_value == "true" %} ${fiscal_period_analysis_calendar.to_period} IS TRUE {% else %} 1=1 {% endif %}
          {% elsif fiscal_period_analysis_calendar.date_filter._in_query %}
            {% if fiscal_period_analysis_calendar.date_filter._parameter_value contains "compare" %} ${fiscal_period_analysis_calendar.to_period} IS TRUE {% else %} 1=1 {% endif %}
          {% else %} 1=1 {% endif %};;
  }

  join: fiscal_calendar_string {
    type: inner
    sql_on: ${order_items.created_date} = ${fiscal_calendar_string.calendar_date};;
    relationship: many_to_one
  }

  join: arbitrary_period_analysis {}


}

explore: fiscal_calendar {
  hidden: yes
}
explore: fiscal_calendar_string_52_weeks {
  sql_always_where: ((${calendar_date} >= ((DATE_ADD(DATE_TRUNC(CURRENT_DATE('{{_query._query_timezone}}'), WEEK(MONDAY)), INTERVAL -51 WEEK))) AND ${calendar_date} < ((DATE_ADD(DATE_ADD(DATE_TRUNC(CURRENT_DATE('{{_query._query_timezone}}'), WEEK(MONDAY)), INTERVAL -51 WEEK), INTERVAL 52 WEEK))))) ;;
  hidden: yes
}
explore: fiscal_period_analysis_dates {
  hidden: yes
  view_label: " Dates"
  join: current {
    view_label: "Current"
    from: fiscal_period_analysis_dates
    sql_on: ${fiscal_period_analysis_dates.current_date} = ${current.calendar_raw} ;;
    relationship: one_to_one
  }
  join: yesterday {
    view_label: "Yesterday"
    from: fiscal_period_analysis_dates
    sql_on: ${fiscal_period_analysis_dates.previous_date} = ${yesterday.calendar_raw} ;;
    relationship: one_to_one
  }
}
