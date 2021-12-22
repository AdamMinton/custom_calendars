connection: "aminton-sandbox-ps"

include: "/views/**/*.view"

datagroup: daily {
  sql_trigger: SELECT CURRENT_DATE ;;
}

explore: order_items_parameter {
  from: order_items
  view_name: order_items

  sql_always_where:
  {% if fiscal_period_analysis_calendar.date_filter._in_query %}
  {% assign parameter_selected = fiscal_period_analysis_calendar.date_filter._parameter_value %}
  ${order_items.created_date} IN ( @{fiscal_date_filter} )
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


}

explore: fiscal_calendar {
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
