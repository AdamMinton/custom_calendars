view: fiscal_calendar_string {
  view_label: "04. 🗓️ Calendar - String"
  sql_table_name: `aminton-sandbox-ps.reference.calendar_nrf_string` ;;

  dimension: calendar_raw {
    hidden: yes
    group_label: "Calendar Date"
    type: date_raw
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: calendar_date {
    group_label: "Calendar Date"
    type: date
    datatype: date
    can_filter: no
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: calendar_week {
    group_label: "Calendar Date"
    type: date_week
    datatype: date
    can_filter: no
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: calendar_month {
    group_label: "Calendar Date"
    type: date_month
    datatype: date
    can_filter: no
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: calendar_day_of_week {
    group_label: "Calendar Date"
    type: date_day_of_week
    datatype: date
    can_filter: no
    convert_tz: no
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: calendar_year {
    group_label: "Calendar Date"
    type: date_year
    datatype: date
    can_filter: no
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: fiscal_period {
    group_label: "Fiscal Calendar"
    type: string
    sql: ${TABLE}.fiscal_period ;;
    #can_filter: no
    value_format: "\"Period \" #"
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_period
  }

  dimension: fiscal_quarter {
    group_label: "Fiscal Calendar"
    type: string
    sql: ${TABLE}.fiscal_quarter ;;
    #can_filter: no
    value_format: "\"Quarter \" #"
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_quarter
  }

  dimension: fiscal_day {
    group_label: "Fiscal Calendar"
    type: string
    sql: ${TABLE}.fiscal_day ;;
    #can_filter: no
    value_format: "\"Day \" #"
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_day
  }

  dimension: fiscal_week {
    group_label: "Fiscal Calendar"
    type: string
    sql: ${TABLE}.fiscal_week ;;
    #can_filter: no
    value_format: "\"Week \" #"
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_week
  }

  dimension: fiscal_year_month {
    group_label: "Fiscal Calendar"
    label: "Fiscal Year Period"
    type: string
    #can_filter: no
    sql:  ${TABLE}.fiscal_year_month ;;
    value_format: "\"FYP \" #"
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_year_month
  }

  dimension: calendar_no {
    hidden: yes
    type: string
    #can_filter: no
    sql: ${TABLE}.calendar_no ;;
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.calendar_no
  }

  dimension: fiscal_year {
    group_label: "Fiscal Calendar"
    type: string
    #can_filter: no
    sql: ${TABLE}.fiscal_year ;;
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_year
  }

  dimension: fiscal_year_day {
    hidden: yes
    group_label: "Fiscal Calendar"
    type: string
    #can_filter: no
    sql: ${TABLE}.fiscal_year_day ;;
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_year_day
  }

  dimension: fiscal_year_period {
    hidden: yes
    group_label: "Fiscal Calendar"
    type: string
    #can_filter: no
    sql: ${TABLE}.fiscal_year_month ;;
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_year_period
  }

  dimension: fiscal_year_month_start {
    hidden: yes
    type: date
    datatype: date
    #can_filter: no
    sql: ${TABLE}.fiscal_year_month_start_date ;;
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_year_month_start
  }

  dimension: fiscal_year_quarter {
    hidden: yes
    group_label: "Fiscal Calendar"
    type: string
    #can_filter: no
    sql: ${TABLE}.fiscal_year_quarter ;;
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_year_quarter
  }

  dimension: fiscal_year_quarter_start {
    hidden: yes
    type: date
    datatype: date
    #can_filter: no
    sql: ${TABLE}.fiscal_year_quarter_start_date ;;
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_year_quarter_start
  }

  dimension: fiscal_year_start {
    hidden: yes
    type: date
    datatype: date
    #can_filter: no
    sql: ${TABLE}.fiscal_year_start_date ;;
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_year_start
  }

  dimension: fiscal_year_week {
    group_label: "Fiscal Calendar"
    type: string
    #can_filter: no
    sql: ${TABLE}.fiscal_year_week ;;
    value_format: "\" FYW \" #"
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_year_week_day
  }

  dimension: fiscal_year_week_day {
    hidden: yes
    group_label: "Fiscal Calendar"
    type: string
    #can_filter: no
    sql: ${TABLE}.fiscal_year_week_day ;;
    suggest_explore: fiscal_calendar_string_52_weeks
    suggest_dimension: fiscal_calendar_string_52_weeks.fiscal_year_week_day
  }

  dimension: fiscal_year_week_start_raw {
    hidden: yes
    type: date_raw
    #can_filter: no
    sql: ${TABLE}.fiscal_year_week_start_date ;;
  }

}

view: fiscal_calendar_string_52_weeks {
  sql_table_name: `aminton-sandbox-ps.reference.calendar_nrf_string` ;;

  dimension: calendar_raw {
    hidden: yes
    group_label: "Calendar Date"
    type: date_raw
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: calendar_date {
    group_label: "Calendar Date"
    type: date
    datatype: date
    can_filter: no
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: calendar_week {
    group_label: "Calendar Date"
    type: date_week
    datatype: date
    can_filter: no
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: calendar_month {
    group_label: "Calendar Date"
    type: date_month
    datatype: date
    can_filter: no
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: calendar_day_of_week {
    group_label: "Calendar Date"
    type: date_day_of_week
    datatype: date
    can_filter: no
    convert_tz: no
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: calendar_year {
    group_label: "Calendar Date"
    type: date_year
    datatype: date
    can_filter: no
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: fiscal_period {
    group_label: "Fiscal Calendar"
    type: string
    sql: ${TABLE}.fiscal_period ;;
    #can_filter: no
    value_format: "\"Period \" #"
  }

  dimension: fiscal_quarter {
    group_label: "Fiscal Calendar"
    type: string
    sql: ${TABLE}.fiscal_quarter ;;
    #can_filter: no
    value_format: "\"Quarter \" #"
  }

  dimension: fiscal_day {
    group_label: "Fiscal Calendar"
    type: string
    sql: ${TABLE}.fiscal_day ;;
    #can_filter: no
    value_format: "\"Day \" #"
  }

  dimension: fiscal_week {
    group_label: "Fiscal Calendar"
    type: string
    sql: ${TABLE}.fiscal_week ;;
    #can_filter: no
    value_format: "\"Week \" #"
  }

  dimension: fiscal_year_month {
    group_label: "Fiscal Calendar"
    label: "Fiscal Year Period"
    type: string
    #can_filter: no
    sql:  ${TABLE}.fiscal_year_month ;;
    value_format: "\"FYP \" #"
  }


  dimension: calendar_no {
    hidden: yes
    type: string
    #can_filter: no
    sql: ${TABLE}.calendar_no ;;
  }

  dimension: fiscal_year {
    group_label: "Fiscal Calendar"
    type: string
    #can_filter: no
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: fiscal_year_day {
    hidden: yes
    group_label: "Fiscal Calendar"
    type: string
    #can_filter: no
    sql: ${TABLE}.fiscal_year_day ;;
  }

  dimension: fiscal_year_period {
    hidden: yes
    group_label: "Fiscal Calendar"
    type: string
    #can_filter: no
    sql: ${TABLE}.fiscal_year_month ;;
  }

  dimension: fiscal_year_month_start {
    hidden: yes
    type: date
    datatype: date
    #can_filter: no
    sql: ${TABLE}.fiscal_year_month_start_date ;;
  }

  dimension: fiscal_year_quarter {
    hidden: yes
    group_label: "Fiscal Calendar"
    type: string
    #can_filter: no
    sql: ${TABLE}.fiscal_year_quarter ;;
  }

  dimension: fiscal_year_quarter_start {
    hidden: yes
    type: date
    datatype: date
    #can_filter: no
    sql: ${TABLE}.fiscal_year_quarter_start_date ;;
  }

  dimension: fiscal_year_start {
    hidden: yes
    type: date
    datatype: date
    #can_filter: no
    sql: ${TABLE}.fiscal_year_start_date ;;
  }

  dimension: fiscal_year_week {
    group_label: "Fiscal Calendar"
    type: string
    #can_filter: no
    sql: ${TABLE}.fiscal_year_week ;;
    value_format: "\" FYW \" #"
  }

  dimension: fiscal_year_week_day {
    hidden: yes
    group_label: "Fiscal Calendar"
    type: string
    #can_filter: no
    sql: ${TABLE}.fiscal_year_week_day ;;
  }

  dimension: fiscal_year_week_start_raw {
    hidden: yes
    type: date_raw
    #can_filter: no
    sql: ${TABLE}.fiscal_year_week_start_date ;;
  }
}
