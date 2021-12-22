view: fiscal_period_analysis_calendar {
  view_label: "02. 📊 Fiscal Period Comparison"
  #This view maintains all of the logic related to the the parameter that drives the filtering in orders_completed_final and transactions_final
  derived_table: {
    datagroup_trigger: daily
    explore_source: fiscal_period_analysis_dates {
      column: calendar_raw {}
      column: previous_date {}
      column: is_week_to_date {}
      column: is_period_to_date {}
      column: is_quarter_to_date {}
      column: is_year_to_date {}
      column: compare_by_yesterday {}
      column: compare_by_week {}
      column: compare_by_period {}
      column: compare_by_quarter {}
      column: compare_by_ytd {}
      column: compare_by_year {}
      column: fiscal_day {}
      column: fiscal_week {}
      column: fiscal_period {}
      column: fiscal_quarter {}
      column: fiscal_year {}
      derived_column: compare_by_yesterday_sort {
        sql: CASE WHEN compare_by_yesterday IS NOT NULL THEN RANK() OVER (ORDER BY calendar_raw DESC) ELSE NULL END ;;
      }
      derived_column: compare_by_week_sort {
        sql: CASE WHEN compare_by_week IS NOT NULL THEN RANK() OVER (ORDER BY fiscal_year || LPAD(CAST(fiscal_week AS STRING),2,'00') DESC) ELSE NULL END ;;
      }
      derived_column: compare_by_period_sort {
        sql: CASE WHEN compare_by_period IS NOT NULL THEN RANK() OVER (ORDER BY fiscal_year || LPAD(CAST(fiscal_period AS STRING),2,'00') DESC) ELSE NULL END ;;
      }
      derived_column: compare_by_quarter_sort {
        sql: CASE WHEN compare_by_quarter IS NOT NULL THEN RANK() OVER (ORDER BY fiscal_year || LPAD(CAST(fiscal_quarter AS STRING),2,'00') DESC) ELSE NULL END ;;
      }
      derived_column: compare_by_year_sort {
        sql: CASE WHEN compare_by_year IS NOT NULL THEN RANK() OVER (ORDER BY fiscal_year DESC) ELSE NULL END ;;
      }
    }
  }

  # Main interaction for users to filter orders_completed_final and transactions_final. The values of this parameter work with a specific function in BQ to allow filtering on partitions
  # fiscal.{{value}}_dates is the pattern used for calling them
  parameter: date_filter {
    label: "Default Comparisons"
    description: "Add 'Comparison Period' to your query when using Compare Period options. Set to 'All Time' when you want to compare a week across 3 or more years."
    type: unquoted
    allowed_value: {
      label: "Yesterday"
      value: "yesterday"
    }
    allowed_value: {
      label: "This Week"
      value: "this_week"
    }
    allowed_value: {
      label: "Last Week"
      value: "last_week"
    }
    allowed_value: {
      label: "This Period"
      value: "this_period"
    }
    allowed_value: {
      label: "Last Period"
      value: "last_period"
    }
    allowed_value: {
      label: "This Quarter"
      value: "this_quarter"
    }
    allowed_value: {
      label: "Last Quarter"
      value: "last_quarter"
    }
    allowed_value: {
      label: "This Year"
      value: "this_year"
    }
    allowed_value: {
      label: "Last Year"
      value: "last_year"
    }
    allowed_value: {
      label: "Two Years Ago"
      value: "two_years"
    }
    allowed_value: {
      label: "This Year to Date"
      value: "this_ytd"
    }
    allowed_value: {
      label: "Last Year to Date"
      value: "last_ytd"
    }
    allowed_value: {
      label: "Compare Yesterday YoY"
      value: "compare_yesterday"
    }
    allowed_value: {
      label: "Compare This Week YoY"
      value: "compare_this_week"
    }
    allowed_value: {
      label: "Compare Last Week YoY"
      value: "compare_last_week"
    }
    allowed_value: {
      label: "Compare This Period YoY"
      value: "compare_this_period"
    }
    allowed_value: {
      label: "Compare Last Period YoY"
      value: "compare_last_period"
    }
    allowed_value: {
      label: "Compare This Quarter YoY"
      value: "compare_this_quarter"
    }
    allowed_value: {
      label: "Compare Last Quarter YoY"
      value: "compare_last_quarter"
    }
    allowed_value: {
      label: "Compare This Year YoY"
      value: "compare_last_two_years"
    }
    allowed_value: {
      label: "Compare Last Year YoY"
      value: "compare_last_year"
    }


    allowed_value: {
      label: "Compare Yesterday 2 Years Ago"
      value: "compare_yesterday_two_years"
    }

    allowed_value: {
      label: "Compare This Week 2 Years Ago"
      value: "compare_this_week_two_years"
    }

    allowed_value: {
      label: "Compare Last Week 2 Years Ago"
      value: "compare_last_week_two_years"
    }

    allowed_value: {
      label: "Compare This Period 2 Years Ago"
      value: "compare_this_period_two_years"
    }

    allowed_value: {
      label: "Compare Last Period 2 Years Ago"
      value: "compare_last_period_two_years"
    }

    # Disabled for last_two_years. More consistent with using the to_date filter
    # allowed_value: {
    #   label: "Compare Year to Date YoY"
    #   value: "compare_ytd"
    # }

    allowed_value: {
      label: "Compare This Year 2 Years Ago"
      value: "compare_this_year_two_years"
    }

    allowed_value: {
      label: "Compare This Week to Last Week"
      value: "compare_this_week_to_last_week"
    }

    allowed_value: {
      label: "Compare Last Week to Preceding Week"
      value: "compare_last_week_to_preceding_week"
    }
    allowed_value: {
      label: "Compare This Period to Last Period"
      value: "compare_this_period_to_last_period"
    }
  }

  #Interaction that drives the use of the to_period and the corresponding children children
  parameter: is_to_period {
    label: "To Date Comparison?"
    type: yesno
  }

  # Hidden dimension that is used in sql_where clause of explore to only allow historicla periods to the same period as the current period
  dimension: to_period {
    hidden: yes
    type: yesno
    sql:
      {% if date_filter._parameter_value == 'yesterday' %}
           1=1
      {% elsif date_filter._parameter_value == 'this_week' %}
          ${is_week_to_date}
      {% elsif date_filter._parameter_value == 'last_week' %}
          ${is_week_to_date}
      {% elsif date_filter._parameter_value == 'preceding_week' %}
          1=1
      {% elsif date_filter._parameter_value == 'this_period' %}
          ${is_period_to_date}
      {% elsif date_filter._parameter_value == 'last_period' %}
          ${is_period_to_date}
      {% elsif date_filter._parameter_value == 'this_quarter' %}
          ${is_quarter_to_date}
      {% elsif date_filter._parameter_value == 'last_quarter' %}
          ${is_quarter_to_date}
      {% elsif date_filter._parameter_value == 'this_year' %}
          ${is_year_to_date}
      {% elsif date_filter._parameter_value == 'last_year' %}
          ${is_year_to_date}
      {% elsif date_filter._parameter_value == 'two_years' %}
          ${is_year_to_date}
      {% elsif date_filter._parameter_value == 'this_ytd' %}
          ${is_year_to_date}
      {% elsif date_filter._parameter_value == 'last_ytd' %}
          ${is_year_to_date}
      {% elsif date_filter._parameter_value == 'compare_yesterday' %}
          1=1
      {% elsif date_filter._parameter_value == 'compare_yesterday_two_years' %}
          1=1
      {% elsif date_filter._parameter_value == 'compare_this_week' %}
          ${is_week_to_date}
      {% elsif date_filter._parameter_value == 'compare_this_week_two_years' %}
          ${is_week_to_date}
      {% elsif date_filter._parameter_value == 'compare_last_week' %}
          1=1
      {% elsif date_filter._parameter_value == 'compare_last_week_two_years' %}
          1=1
      {% elsif date_filter._parameter_value == 'compare_this_period' %}
          ${is_period_to_date}
      {% elsif date_filter._parameter_value == 'compare_this_period_two_years' %}
          ${is_period_to_date}
      {% elsif date_filter._parameter_value == 'compare_last_period' %}
          1=1
      {% elsif date_filter._parameter_value == 'compare_last_period_two_years' %}
          1=1
      {% elsif date_filter._parameter_value == 'compare_this_quarter' %}
         ${is_quarter_to_date}
      {% elsif date_filter._parameter_value == 'compare_last_quarter' %}
         1=1
      {% elsif date_filter._parameter_value == 'compare_ytd' %}
          ${is_year_to_date}
      {% elsif date_filter._parameter_value == 'compare_last_two_years' %}
          ${is_year_to_date}
      {% elsif date_filter._parameter_value == 'compare_this_year_two_years' %}
          ${is_year_to_date}
      {% elsif date_filter._parameter_value == 'compare_this_week_to_last_week' %}
          ${is_week_to_date}
      {% elsif date_filter._parameter_value == 'compare_last_week_to_preceding_week' %}
          1=1
      {% elsif date_filter._parameter_value == 'compare_this_period_to_last_period' %}
          ${is_period_to_date}
      {% else %}
          1=1
      {% endif %}
    ;;
  }

  #Filters the calendar tables to only bring the dates that match was the user selected in the function, without this the calendar table would be returned in its entireity
  dimension: in_selected_time_period {
    hidden: yes
    type: yesno
    sql:
      {% if date_filter._parameter_value == 'yesterday' %}
         ${compare_by_yesterday} = 'Yesterday'
      {% elsif date_filter._parameter_value == 'this_week' %}
          ${compare_by_week} = 'This Week'
      {% elsif date_filter._parameter_value == 'last_week' %}
          ${compare_by_week} = 'Last Week'
      {% elsif date_filter._parameter_value == 'preceding_week' %}
          ${compare_by_week} = '2 Weeks Ago'
      {% elsif date_filter._parameter_value == 'this_period' %}
          ${compare_by_period} = 'This Period'
      {% elsif date_filter._parameter_value == 'last_period' %}
          ${compare_by_period} = 'Last Period'
       {% elsif date_filter._parameter_value == 'this_quarter' %}
          ${compare_by_quarter} = 'This Quarter'
      {% elsif date_filter._parameter_value == 'last_quarter' %}
          ${compare_by_quarter} = 'Last Quarter'
      {% elsif date_filter._parameter_value == 'this_year' %}
          ${compare_by_year} = 'This Year'
      {% elsif date_filter._parameter_value == 'last_year' %}
          ${compare_by_year} = 'Last Year'
      {% elsif date_filter._parameter_value == 'two_years' %}
          ${compare_by_year} = '2 Years Ago'
      {% elsif date_filter._parameter_value == 'this_ytd' %}
          ${compare_by_ytd} = 'YTD'
      {% elsif date_filter._parameter_value == 'last_ytd' %}
          ${compare_by_ytd} = 'YTD Last Year'
      {% elsif date_filter._parameter_value == 'compare_yesterday' %}
          ${compare_by_yesterday} IN ('Yesterday', 'Yesterday Last Year')
      {% elsif date_filter._parameter_value == 'compare_this_week' %}
          ${compare_by_week} IN ('This Week', 'This Week Last Year')
      {% elsif date_filter._parameter_value == 'compare_last_week' %}
          ${compare_by_week} IN ('Last Week', 'Last Week Last Year')
       {% elsif date_filter._parameter_value == 'compare_this_period' %}
          ${compare_by_period} IN ('This Period', 'This Period Last Year')
      {% elsif date_filter._parameter_value == 'compare_last_period' %}
          ${compare_by_period} IN ('Last Period', 'Last Period Last Year')
      {% elsif date_filter._parameter_value == 'compare_this_quarter' %}
          ${compare_by_quarter} IN ('This Quarter', 'This Quarter Last Year')
      {% elsif date_filter._parameter_value == 'compare_last_quarter' %}
          ${compare_by_quarter} IN ('Last Quarter', 'Last Quarter Last Year')
      {% elsif date_filter._parameter_value == 'compare_ytd' %}
          ${compare_by_ytd} IN ('YTD', 'YTD Last Year')
      {% elsif date_filter._parameter_value == 'compare_last_two_years' %}
          ${compare_by_year} IN ('This Year','Last Year')
      {% elsif date_filter._parameter_value == 'compare_yesterday_two_years' %}
          ${compare_by_yesterday} IN ('Yesterday', 'Yesterday 2 Years Ago')
      {% elsif date_filter._parameter_value == 'compare_this_week_two_years' %}
          ${compare_by_week} IN ('This Week', 'This Week 2 Years Ago')
      {% elsif date_filter._parameter_value == 'compare_last_week_two_years' %}
          ${compare_by_week} IN ('Last Week', 'Last Week 2 Years Ago')
       {% elsif date_filter._parameter_value == 'compare_this_period_two_years' %}
          ${compare_by_period} IN ('This Period', 'This Period 2 Years Ago')
      {% elsif date_filter._parameter_value == 'compare_last_period_two_years' %}
          ${compare_by_period} IN ('Last Period', 'Last Period 2 Years Ago')
      {% elsif date_filter._parameter_value == 'compare_this_year_two_years' %}
          ${compare_by_year} IN ('This Year','2 Years Ago')
      {% elsif date_filter._parameter_value == 'compare_this_week_to_last_week' %}
          ${compare_by_week} IN ('This Week','Last Week')
      {% elsif date_filter._parameter_value == 'compare_last_week_to_preceding_week' %}
          ${compare_by_week} IN ('Last Week','2 Weeks Ago')
      {% elsif date_filter._parameter_value == 'compare_this_period_to_last_period' %}
          ${compare_by_period} IN ('This Period','Last Period')
      {% else %}
          1=1
      {% endif %}
    ;;
  }

  #This dimension allows the user to split the results of the queries from orders_completed_final and transactions_final based on the descriptions created like This Period and Last Period.
  dimension: comparison_period {
    can_filter: no
    description: "Add this dimension when comparing time periods in the Fiscal Period Comparison Filter "
    label: "Compare"
    type: string
    sql:
      {% if date_filter._parameter_value == 'yesterday' %}
         ${compare_by_yesterday}
      {% elsif date_filter._parameter_value == 'this_week' %}
          ${compare_by_week}
      {% elsif date_filter._parameter_value == 'last_week' %}
          ${compare_by_week}
      {% elsif date_filter._parameter_value == 'preceding_week' %}
          ${compare_by_week}
      {% elsif date_filter._parameter_value == 'this_period' %}
          ${compare_by_period}
      {% elsif date_filter._parameter_value == 'last_period' %}
          ${compare_by_period}
      {% elsif date_filter._parameter_value == 'this_quarter' %}
          ${compare_by_quarter}
      {% elsif date_filter._parameter_value == 'last_quarter' %}
          ${compare_by_quarter}
      {% elsif date_filter._parameter_value == 'this_year' %}
          ${compare_by_year}
      {% elsif date_filter._parameter_value == 'last_year' %}
          ${compare_by_year}
      {% elsif date_filter._parameter_value == 'two_years' %}
          ${compare_by_year}
      {% elsif date_filter._parameter_value == 'this_ytd' %}
          ${compare_by_ytd}
      {% elsif date_filter._parameter_value == 'last_ytd' %}
          ${compare_by_ytd}
      {% elsif date_filter._parameter_value == 'compare_yesterday' %}
          ${compare_by_yesterday}
      {% elsif date_filter._parameter_value == 'compare_this_week' %}
          ${compare_by_week}
      {% elsif date_filter._parameter_value == 'compare_last_week' %}
          ${compare_by_week}
      {% elsif date_filter._parameter_value == 'compare_this_period' %}
          ${compare_by_period}
      {% elsif date_filter._parameter_value == 'compare_last_period' %}
          ${compare_by_period}
      {% elsif date_filter._parameter_value == 'compare_this_quarter' %}
          ${compare_by_quarter}
      {% elsif date_filter._parameter_value == 'compare_last_quarter' %}
          ${compare_by_quarter}
      {% elsif date_filter._parameter_value == 'compare_ytd' %}
          ${compare_by_ytd}
      {% elsif date_filter._parameter_value == 'compare_last_two_years' %}
          ${compare_by_year}
      {% elsif date_filter._parameter_value == 'compare_last_year' %}
         ${compare_by_year}
      {% elsif date_filter._parameter_value == 'compare_yesterday_two_years' %}
          ${compare_by_yesterday}
      {% elsif date_filter._parameter_value == 'compare_this_week_two_years' %}
          ${compare_by_week}
      {% elsif date_filter._parameter_value == 'compare_last_week_two_years' %}
          ${compare_by_week}
      {% elsif date_filter._parameter_value == 'compare_this_period_two_years' %}
          ${compare_by_period}
      {% elsif date_filter._parameter_value == 'compare_last_period_two_years' %}
          ${compare_by_period}
      {% elsif date_filter._parameter_value == 'compare_this_year_two_years' %}
         ${compare_by_year}
      {% elsif date_filter._parameter_value == 'compare_this_week_to_last_week' %}
          ${compare_by_week}
      {% elsif date_filter._parameter_value == 'compare_last_week_to_preceding_week' %}
          ${compare_by_week}
      {% elsif date_filter._parameter_value == 'compare_this_period_to_last_period' %}
          ${compare_by_period}
      {% else %}
          'No comparison Selected'
      {% endif %}
    ;;
    order_by_field: comparison_period_sort
  }

  dimension: comparison_period_sort {
    hidden: yes
    sql:
    {% if date_filter._parameter_value == 'compare_yesterday' %}
      ${compare_by_yesterday_sort}
    {% elsif date_filter._parameter_value == 'compare_yesterday_two_years' %}
      ${compare_by_week_sort}
    {% elsif date_filter._parameter_value == 'compare_this_week' %}
      ${compare_by_week_sort}
    {% elsif date_filter._parameter_value == 'compare_last_week' %}
      ${compare_by_week_sort}
    {% elsif date_filter._parameter_value == 'compare_this_week_two_years' %}
      ${compare_by_week_sort}
    {% elsif date_filter._parameter_value == 'compare_last_week_two_years' %}
      ${compare_by_week_sort}
    {% elsif date_filter._parameter_value == 'compare_this_period' %}
      ${compare_by_period_sort}
    {% elsif date_filter._parameter_value == 'compare_last_period' %}
      ${compare_by_period_sort}
    {% elsif date_filter._parameter_value == 'compare_this_period_two_years' %}
      ${compare_by_period_sort}
    {% elsif date_filter._parameter_value == 'compare_last_period_two_years' %}
      ${compare_by_period_sort}
    {% elsif date_filter._parameter_value == 'compare_this_quarter' %}
      ${compare_by_quarter_sort}
    {% elsif date_filter._parameter_value == 'compare_last_quarter' %}
      ${compare_by_quarter_sort}
    {% elsif date_filter._parameter_value == 'compare_ytd' %}
      ${compare_by_year_sort}
    {% elsif date_filter._parameter_value == 'compare_last_two_years' %}
      ${compare_by_year_sort}
    {% elsif date_filter._parameter_value == 'compare_last_year' %}
      ${compare_by_year_sort}
    {% elsif date_filter._parameter_value == 'compare_this_year_two_years' %}
      ${compare_by_year_sort}
    {% elsif date_filter._parameter_value == 'compare_this_week_to_last_week' %}
      ${compare_by_week_sort}
    {% elsif date_filter._parameter_value == 'compare_last_week_to_preceding_week' %}
      ${compare_by_week_sort}
    {% elsif date_filter._parameter_value == 'compare_this_period_to_last_period' %}
      ${compare_by_period_sort}
    {% else %}
      ${comparison_period}
    {% endif %};;
  }

  # Hidden dimensions that are called on by to_period dimension based on if the user only wants to see historical periods to the same unit of analysis as current period {

  dimension: is_week_to_date {
    hidden: yes
    group_label: "Period to Date"
    label: "Is Week to Date"
    type: yesno
    sql: ${TABLE}.is_week_to_date ;;
  }

  dimension: is_period_to_date {
    hidden: yes
    group_label: "Period to Date"
    label: "Is Period to Date"
    type: yesno
    sql: ${TABLE}.is_period_to_date ;;
  }

  dimension: is_quarter_to_date {
    hidden: yes
    group_label: "Period to Date"
    label: "Is Quarter to Date"
    type: yesno
    sql: ${TABLE}.is_quarter_to_date ;;
  }

  dimension: is_year_to_date {
    hidden: yes
    group_label: "Period to Date"
    label: "Is Year to Date"
    type: yesno
    sql: ${TABLE}.is_year_to_date ;;
  }

  #}

  # Hidden dimensions that are called on by by the comparison_period master dimension based on the analysis a user selected {

  dimension: compare_by_yesterday {
    hidden: yes
    group_label: "Comparisons"
    group_item_label: "1 – Yesterday"
    label: "Compare Yesterday"
    description: "Pivot Dataset by Yesterday: TY vs LY."
    sql: ${TABLE}.compare_by_yesterday ;;
  }

  dimension: compare_by_week {
    hidden: yes
    group_label: "Comparisons"
    group_item_label: "2 – Week"
    label: "Compare Week"
    description: "Pivot Dataset by Week: TW, LW, TWLY, LWLY, LWPW."
    sql: ${TABLE}.compare_by_week ;;
  }

  dimension: compare_by_period {
    hidden: yes
    group_label: "Comparisons"
    group_item_label: "3 – Period"
    label: "Compare Period"
    description: "Pivot Dataset by Period: TY, LY, LP, LPLY."
    sql: ${TABLE}.compare_by_period ;;
  }

  dimension: compare_by_quarter {
    hidden: yes
    group_label: "Comparisons"
    group_item_label: "3 – Quarter"
    label: "Compare Quarter"
    description: "Pivot Dataset by Quarter: TY, LY, LQ, LQLY."
    sql: ${TABLE}.compare_by_quarter ;;
  }

  dimension: compare_by_ytd {
    hidden: yes
    group_label: "Comparisons"
    group_item_label: "4 – YTD"
    label: "Compare YTD"
    description: "Pivot Dataset by Year: TYD vs LYTD."
    sql: ${TABLE}.compare_by_ytd ;;
  }

  dimension: compare_by_year {
    hidden: yes
    group_label: "Comparisons"
    group_item_label: "5 – Years"
    label: "Compare Last 2 Years"
    description: "Pivot Dataset by Year: TY vs LY."
    sql: ${TABLE}.compare_by_year ;;
  }

  dimension: compare_by_yesterday_sort {
    hidden: yes
    type: number
    sql: ${TABLE}.compare_by_yesterday_sort ;;
  }

  dimension: compare_by_week_sort {
    hidden: yes
    type: number
    sql: ${TABLE}.compare_by_week_sort ;;
  }

  dimension: compare_by_period_sort {
    hidden: yes
    type: number
    sql: ${TABLE}.compare_by_period_sort ;;
  }

  dimension: compare_by_quarter_sort {
    hidden: yes
    type: number
    sql: ${TABLE}.compare_by_quarter_sort ;;
  }

  dimension: compare_by_year_sort {
    hidden: yes
    type: number
    sql: ${TABLE}.compare_by_year_sort ;;
  }


  #}

  # Repeated dimensions of the fiscal_calendar {

  dimension_group: calendar {
    hidden: yes
    type: time
    datatype: date
    timeframes: [raw, date]
    sql: ${TABLE}.calendar_raw ;;
  }

  dimension: previous_date {
    hidden: yes
    type: date_time
    sql: ${TABLE}.previous_date ;;
  }

  dimension: fiscal_day {
    hidden: yes
    type: number
    sql: ${TABLE}.fiscal_day ;;
  }

  dimension: fiscal_week {
    hidden: yes
    type: number
    sql: ${TABLE}.fiscal_week ;;
  }

  dimension: fiscal_period {
    hidden: yes
    type: number
    sql: ${TABLE}.fiscal_period ;;
  }

  dimension: fiscal_quarter {
    hidden: yes
    sql: ${TABLE}.fiscal_quarter ;;
  }

  dimension: fiscal_year {
    hidden: yes
    type: number
    sql: ${TABLE}.fiscal_year ;;
  }

  #}

}
