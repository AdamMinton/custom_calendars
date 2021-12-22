# The arbitrary_period_analysis allows for comparisons to be done in an explore

# For a comparison to work, all 3 fields must be selected: date range, comparison date range, and compare
# The two date ranges are not allowed to overlap and "Compare" must be used as a pivot

view: arbitrary_period_analysis {
  view_label: "01. 📊 Date Selection"

  filter: first_period_filter {
    label: "1. Date Range"
    type: date
    datatype: date
    description: "Select a primary date range. To compare to another date range, select a Comparison Date Range, and pivot on the 'Compare' dimension."
  }

  filter: second_period_filter {
    label: "2. Comparison Date Range"
    type: date
    datatype: date
    description: "Select a secondary date range. Only use when making a comparison. Primary and secondary ranges cannot overlap. Pivot on the 'Compare' dimension."
  }

  dimension: period_selected {
    label: "Compare"
    type: string
    description: "Pivot Me! This will generate a comparison between the primary and secondary date ranges. Both filters must be selected for it to work."
    can_filter: no
    sql:
        CASE
          WHEN ${fiscal_calendar.calendar_date} >=  {% date_start first_period_filter %}
          AND ${fiscal_calendar.calendar_date} <= {% date_end first_period_filter %}
          THEN concat({% date_start first_period_filter %}, " - " ,{% date_end first_period_filter %})--'Date Range'
          WHEN ${fiscal_calendar.calendar_date} >=  {% date_start second_period_filter %}
          AND ${fiscal_calendar.calendar_date} <= {% date_end second_period_filter %}
          THEN concat({% date_start second_period_filter %}, " - " ,{% date_end second_period_filter %}) --'Comparison Date Range'
          END ;;
  }

  dimension: first_period_date_array {
    hidden: yes
    sql:  generate_date_array(
            {% date_start first_period_filter %},
            ifnull(
              date_sub(
                {% date_end first_period_filter %},
                interval 1 day
              ),
              current_date()
            )
          ) ;;
  }

  dimension: second_period_date_array {
    hidden: yes
    sql:  generate_date_array(
            {% date_start second_period_filter %},
            ifnull(
              date_sub(
                {% date_end second_period_filter %},
                interval 1 day
              ),
              current_date()
            )
          );;
  }

}
