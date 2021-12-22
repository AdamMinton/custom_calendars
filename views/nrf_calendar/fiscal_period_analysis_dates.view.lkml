view: fiscal_period_analysis_dates {
#This view reads from the fiscal_calendar to create additional matching criteria to describe each date (i.e. what makes This Period, Last Period, etc.)
  derived_table: {
    explore_source: fiscal_calendar {
      column: calendar_raw {}
      column: fiscal_day {}
      column: fiscal_week {}
      column: fiscal_year_week_start_raw {}
      column: fiscal_period {}
      column: fiscal_quarter {}
      column: fiscal_year {}
      derived_column: day_of_week {sql: RANK() OVER (PARTITION BY fiscal_year, fiscal_week order by calendar_raw asc) ;;}
      derived_column: day_of_period {sql: RANK() OVER (PARTITION BY fiscal_year, fiscal_period order by calendar_raw asc) ;;}
      derived_column: day_of_quarter {sql: RANK() OVER (PARTITION BY fiscal_year, fiscal_quarter order by calendar_raw asc) ;;}
      derived_column: day_of_year {sql: RANK() OVER (PARTITION BY fiscal_year order by calendar_raw asc) ;;}
    }
  }

  # Used for self-joining this table with itself on different dates of today and yesterday for use in comparisons {

  dimension_group: calendar {
    type: time
    datatype: date
    timeframes: [raw,date]
    sql: ${TABLE}.calendar_raw ;;
  }

  dimension: current_date {
    type: date
    sql: CURRENT_DATE() ;;
  }

  dimension: previous_date {
    type: date
    sql: DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY) ;;
  }

  #}

  # Dimensions for historical dates in how they are related to current dates {

  dimension: matches_today {
    group_label: "Matches Fields"
    type: yesno
    sql: ${fiscal_week} = ${current.fiscal_week} AND ${day_of_week} = ${current.day_of_week} ;;
  }

  dimension: matches_yesterday {
    group_label: "Matches Fields"
    type: yesno
    sql: ${fiscal_week} = ${yesterday.fiscal_week} AND ${day_of_week} = ${yesterday.day_of_week}  ;;
  }

  dimension: matches_this_week {
    group_label: "Matches Fields"
    type: yesno
    sql: ${fiscal_week} = ${current.fiscal_week} ;;
  }

  dimension: matches_previous_week {
    group_label: "Matches Fields"
    type: yesno
    sql: ${fiscal_week} = ${current.fiscal_week} - 1 OR (${fiscal_week} = 52 AND ${current.fiscal_week} = 1)  ;;
  }

  dimension: matches_two_weeks_ago {
    group_label: "Matches Fields"
    type: yesno
    sql: ${fiscal_week} = (${current.fiscal_week} - 2) OR (${fiscal_week} = 51 AND ${current.fiscal_week} = 1) OR (${fiscal_week} = 52 AND ${current.fiscal_week} = 2 )  ;;
  }

  dimension: matches_this_period {
    group_label: "Matches Fields"
    type: yesno
    sql: ${fiscal_period} = ${current.fiscal_period} ;;
  }

  dimension: matches_previous_period {
    group_label: "Matches Fields"
    type: yesno
    sql: ${fiscal_period} = ${current.fiscal_period} - 1 OR (${fiscal_period} = 12 AND ${current.fiscal_period} = 1)  ;;
  }

  dimension: matches_this_quarter {
    group_label: "Matches Fields"
    type: yesno
    sql: ${fiscal_quarter} = ${current.fiscal_quarter} ;;
  }

  dimension: matches_previous_quarter {
    group_label: "Matches Fields"
    type: yesno
    sql: ${fiscal_quarter} = ${current.fiscal_quarter} - 1 OR (${fiscal_quarter} = 4 AND ${current.fiscal_quarter} = 1)  ;;
  }

  #}

  # Dimensions for determining if a previous unit of analysis is to date as the current unit of analysis {

  dimension: is_week_to_date {
    group_label: "Filter Fields"
    sql: ${day_of_week} < ${current.day_of_week} ;;
  }

  dimension: is_period_to_date {
    group_label: "Filter Fields"
    sql: ${day_of_period} < ${current.day_of_period} ;;
  }

  dimension: is_quarter_to_date {
    group_label: "Filter Fields"
    sql: ${day_of_quarter} < ${current.day_of_quarter} ;;
  }

  dimension: is_year_to_date {
    group_label: "Filter Fields"
    sql: ${day_of_year} < ${current.day_of_year} ;;
  }

  #}

  # Dimensions for establishing how a date is related (current and yesterday are self joins of the current table) {

  dimension: is_yesterday {
    group_label: "Filter Fields"
    type: yesno
    sql: ${calendar_raw} = ${yesterday.calendar_raw} ;;
  }

  dimension: is_this_week {
    group_label: "Filter Fields"
    type: yesno
    sql: ${fiscal_week} = ${current.fiscal_week} AND ${is_this_year} ;;
  }

  dimension: is_previous_week {
    group_label: "Filter Fields"
    type: yesno
    sql: (${is_this_year} AND ${fiscal_week} = ${current.fiscal_week} - 1)
      OR (${is_last_year} AND ${fiscal_week} = 52 AND ${current.fiscal_week} = 1);;
  }

  dimension: is_two_weeks_ago {
    group_label: "Filter Fields"
    type: yesno
    sql: (${is_this_year} AND ${fiscal_week} = ${current.fiscal_week} - 2)
      OR (${is_last_year} AND ${fiscal_week} = 51 AND ${current.fiscal_week} = 1)
      OR (${is_last_year} AND ${fiscal_week} = 52 AND ${current.fiscal_week} = 2);;
  }

  dimension: is_this_period {
    group_label: "Filter Fields"
    type: yesno
    sql: ${fiscal_period} = ${current.fiscal_period} AND ${is_this_year} ;;
  }

  dimension: is_previous_period {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_previous_period} AND ${is_this_year}
      OR (${is_last_year} AND ${fiscal_period} = 12 AND ${current.fiscal_period} = 1);;
  }

  dimension: is_this_quarter {
    group_label: "Filter Fields"
    type: yesno
    sql: ${fiscal_quarter} = ${current.fiscal_quarter} AND ${is_this_year} ;;
  }

  dimension: is_previous_quarter {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_previous_quarter} AND ${is_this_year}
      OR (${is_last_year} AND ${fiscal_quarter} = 4 AND ${current.fiscal_quarter} = 1);;
  }

  dimension: is_this_year {
    group_label: "Filter Fields"
    type: yesno
    sql: ${fiscal_year} = ${current.fiscal_year} ;;
  }

  #}

  # Dimensions creating the comparison for the fields (current is a self join of the current table) {

  dimension: is_this_day_last_year {
    group_label: "Filter Fields"
    type: yesno
    sql: ${fiscal_day} = ${current.fiscal_day} ;;
  }

  dimension: is_yesterday_last_year {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_yesterday} AND ${is_last_year} ;;
  }

  dimension: is_this_week_last_year {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_this_week} AND ${is_last_year} ;;
  }

  dimension: is_previous_week_last_year {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_previous_week} AND (${is_previous_last_year_week}) ;;
  }

  dimension: is_this_period_last_year {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_this_period} AND ${is_last_year} ;;
  }

  dimension: is_previous_period_last_year {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_previous_period} AND (${is_previous_last_year_month}) ;;
  }

  dimension: is_this_quarter_last_year {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_this_quarter} AND ${is_last_year} ;;
  }

  dimension: is_previous_quarter_last_year {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_previous_quarter} AND (${is_previous_last_year_quarter}) ;;
  }

  dimension: is_last_year {
    group_label: "Filter Fields"
    type: yesno
    sql: ${fiscal_year} = ${current.fiscal_year} - 1 ;;
  }

  dimension: is_previous_last_year_week {
    group_label: "Filter Fields"
    type: yesno
    #Due to previous on fiscal week 1 being 2 years behind, coded an exception case when that occurs, otherwise defaults to original logic
    sql: CASE WHEN ${current.fiscal_week} = 1 THEN ${fiscal_year} = ${current.fiscal_year} - 2 ELSE ${is_last_year} END;;
  }

  dimension: is_previous_last_year_month {
    group_label: "Filter Fields"
    type: yesno
    #Due to previous on fiscal period 1 being 2 years behind, coded an exception case when that occurs, otherwise defaults to original logic
    sql: CASE WHEN ${current.fiscal_period} = 1 THEN ${fiscal_year} = ${current.fiscal_year} - 2 ELSE ${is_last_year} END;;
  }

  dimension: is_previous_last_year_quarter {
    group_label: "Filter Fields"
    type: yesno
    #Due to previous on fiscal quarter 1 being 2 years behind, coded an exception case when that occurs, otherwise defaults to original logic
    sql: CASE WHEN ${current.fiscal_quarter} = 1 THEN ${fiscal_year} = ${current.fiscal_year} - 2 ELSE ${is_last_year} END;;
  }


  dimension: is_two_years_ago {
    group_label: "Filter Fields"
    type: yesno
    sql: ${fiscal_year} = ${current.fiscal_year} - 2 ;;
  }

  dimension: is_yesterday_two_years_ago {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_yesterday} AND ${is_two_years_ago} ;;
  }

  dimension: is_this_week_two_years_ago {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_this_week} AND ${is_two_years_ago} ;;
  }

  dimension: is_previous_week_two_years_ago {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_previous_week} AND (${is_previous_two_years_week}) ;;
  }

  dimension: is_this_period_two_years_ago {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_this_period} AND ${is_two_years_ago} ;;
  }

  dimension: is_previous_period_two_years_ago {
    group_label: "Filter Fields"
    type: yesno
    sql: ${matches_previous_period} AND (${is_previous_two_years_month}) ;;
  }

  dimension: is_previous_two_years_week {
    group_label: "Filter Fields"
    type: yesno
    #Due to previous on fiscal week 1 being 2 years behind, coded an exception case when that occurs, otherwise defaults to original logic
    sql: CASE WHEN ${current.fiscal_week} = 1 THEN ${fiscal_year} = ${current.fiscal_year} - 3 ELSE ${is_two_years_ago} END;;
  }

  dimension: is_previous_two_years_month {
    group_label: "Filter Fields"
    type: yesno
    #Due to previous on fiscal period 1 being 2 years behind, coded an exception case when that occurs, otherwise defaults to original logic
    sql: CASE WHEN ${current.fiscal_period} = 1 THEN ${fiscal_year} = ${current.fiscal_year} - 3 ELSE ${is_two_years_ago} END;;
  }

  dimension: is_previous_two_years_quarter {
    group_label: "Filter Fields"
    type: yesno
    #Due to previous on fiscal quarter 1 being 2 years behind, coded an exception case when that occurs, otherwise defaults to original logic
    sql: CASE WHEN ${current.fiscal_quarter} = 1 THEN ${fiscal_year} = ${current.fiscal_year} - 3 ELSE ${is_two_years_ago} END;;
  }


  #}

  # Dimensions establishing text for each date of how a date compares to their corresponding from previous periods/years {

  dimension: compare_by_yesterday {
    type: string
    group_label: "Comparisons"
    group_item_label: "1 – Yesterday"
    label: "Compare Yesterday"
    description: "Compare Data by Yesterday: TY vs LY."
    sql: CASE
      WHEN ${is_yesterday} THEN "Yesterday"
      WHEN ${is_yesterday_last_year} THEN "Yesterday Last Year"
      WHEN ${is_yesterday_two_years_ago} THEN "Yesterday 2 Years Ago"
      WHEN ${matches_yesterday} THEN "Yesterday " || ${fiscal_year}
      ELSE NULL
    END ;;
  }

  dimension: compare_by_week {
    type: string
    group_label: " Comparisons"
    group_item_label: "2 – Week"
    label: "Compare Week"
    description: "Pivot Dataset by Week: TW, LW, TWLY, LWLY."
    sql: CASE
      WHEN ${is_this_week} THEN "This Week"
      WHEN ${is_previous_week} THEN "Last Week"
      WHEN ${is_two_weeks_ago} THEN "2 Weeks Ago"
      WHEN ${is_this_week_last_year} THEN "This Week Last Year"
      WHEN ${is_previous_week_last_year} THEN "Last Week Last Year"
      WHEN ${is_this_week_two_years_ago} THEN "This Week 2 Years Ago"
      WHEN ${is_previous_week_two_years_ago} THEN "Last Week 2 Years Ago"
      WHEN ${matches_this_week} THEN "This Week " || ${fiscal_year}
      WHEN ${matches_previous_week} THEN "Last Week " || ${fiscal_year}
      ELSE NULL
    END ;;
  }

  dimension: compare_by_period {
    type: string
    group_label: " Comparisons"
    group_item_label: "3 – Period"
    label: "Compare Period"
    description: "Pivot Dataset by Period: TY, LY, LP, LPLY."
    sql: CASE
      WHEN ${is_this_period} THEN "This Period"
      WHEN ${is_previous_period} THEN "Last Period"
      WHEN ${is_this_period_last_year} THEN "This Period Last Year"
      WHEN ${is_previous_period_last_year} THEN "Last Period Last Year"
      WHEN ${is_this_period_two_years_ago} THEN "This Period 2 Years Ago"
      WHEN ${is_previous_period_two_years_ago} THEN "Last Period 2 Years Ago"
      WHEN ${matches_this_period} THEN "This Period " || ${fiscal_year}
      WHEN ${matches_previous_period} THEN "Last Period " || ${fiscal_year}
      ELSE NULL
    END ;;
  }

  dimension: compare_by_quarter {
    type: string
    group_label: " Comparisons"
    group_item_label: "4 – Quarter"
    label: "Compare Quarter"
    description: "Pivot Dataset by Period: TY, LY, LQ, LQLY."
    sql: CASE
      WHEN ${is_this_quarter} THEN "This Quarter"
      WHEN ${is_previous_quarter} THEN "Last Quarter"
      WHEN ${is_this_quarter_last_year} THEN "This Quarter Last Year"
      WHEN ${is_previous_quarter_last_year} THEN "Last Quarter Last Year"
      WHEN ${matches_this_quarter} THEN "This Quarter " || ${fiscal_year}
      WHEN ${matches_previous_quarter} THEN "Last Quarter " || ${fiscal_year}
      ELSE NULL
    END ;;
  }

  dimension: compare_by_ytd {
    type: string
    group_label: " Comparisons"
    group_item_label: "5 – Year"
    label: "Compare YTD"
    description: "Pivot Dataset by Year: TYD vs LYTD."
    sql: CASE
      WHEN ${is_this_year} AND ${is_year_to_date} THEN "YTD"
      WHEN ${is_last_year} AND ${is_year_to_date} THEN "YTD Last Year"
      WHEN ${is_two_years_ago} AND ${is_year_to_date} THEN "YTD 2 Years Ago"
      WHEN ${is_year_to_date} THEN ${fiscal_year} || " YTD"
      ELSE NULL
    END ;;
  }

  dimension: compare_by_year {
    type: string
    group_label: " Comparisons"
    group_item_label: "6 – Year"
    label: "Compare Last 2 Years"
    description: "Pivot Dataset by Year: TY vs LY."
    sql: CASE
      WHEN ${is_this_year} THEN "This Year"
      WHEN ${is_last_year} THEN "Last Year"
      WHEN ${is_two_years_ago} THEN "2 Years Ago"
      ELSE CAST(${fiscal_year} AS STRING)
    END ;;
  }

  #}

  # Dimensions from the original fiscal_calendar table {

  dimension: fiscal_day {
    type: number
    sql: ${TABLE}.fiscal_day ;;
  }

  dimension: fiscal_week {
    type: number
    sql: ${TABLE}.fiscal_week ;;
  }

  dimension_group: fiscal_year_week_start {
    hidden: yes
    type: time
    datatype: date
    convert_tz: no
    timeframes: [raw]
    sql: ${TABLE}.fiscal_year_week_start_raw ;;
  }

  dimension: fiscal_period {
    type: number
    sql: ${TABLE}.fiscal_period ;;
  }

  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}.fiscal_quarter ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: day_of_week {
    type: number
    sql: ${TABLE}.day_of_week ;;
  }

  dimension: day_of_period {
    type: number
    sql: ${TABLE}.day_of_period ;;
  }

  dimension: day_of_quarter {
    type: number
    sql: ${TABLE}.day_of_quarter ;;
  }

  dimension: day_of_year {
    type: number
    sql: ${TABLE}.day_of_year ;;
  }

  #}

}
