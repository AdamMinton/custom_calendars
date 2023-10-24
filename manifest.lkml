project_name: "custom_calendars"

constant: fiscal_year {
  value: "
  {% assign today_week = 'now' | date: '%W' | minus: 0  %}
  {% assign today_month = 'now' | date: '%m' | minus: 0  %}
  {% assign today_year = 'now' | date: '%Y' | minus: 0 %}
  {% if today_week < 5 and today_month <> 12 %} {% assign fiscal_year = today_year | minus:1 %}
  {% else %} {% assign fiscal_year = today_year %}
  {% endif %}"
}

constant: fiscal_year_start {
  value: "
  {% if fiscal_year == 2014 %} {% assign fiscal_year_start = '2014-02-02' %}
  {% elsif fiscal_year == 2015 %} {% assign fiscal_year_start = '2015-02-01' %}
  {% elsif fiscal_year == 2016 %} {% assign fiscal_year_start = '2016-01-31' %}
  {% elsif fiscal_year == 2017 %} {% assign fiscal_year_start = '2017-01-29' %}
  {% elsif fiscal_year == 2018 %} {% assign fiscal_year_start = '2018-02-04' %}
  {% elsif fiscal_year == 2019 %} {% assign fiscal_year_start = '2019-02-03' %}
  {% elsif fiscal_year == 2020 %} {% assign fiscal_year_start = '2020-02-02' %}
  {% elsif fiscal_year == 2021 %} {% assign fiscal_year_start = '2021-01-31' %}
  {% elsif fiscal_year == 2022 %} {% assign fiscal_year_start = '2022-01-30' %}
  {% elsif fiscal_year == 2023 %} {% assign fiscal_year_start = '2023-01-29' %}
  {% elsif fiscal_year == 2024 %} {% assign fiscal_year_start = '2024-02-04' %}
  {% elsif fiscal_year == 2025 %} {% assign fiscal_year_start = '2025-02-02' %}
  {% elsif fiscal_year == 2026 %} {% assign fiscal_year_start = '2026-02-01' %}
  {% elsif fiscal_year == 2027 %} {% assign fiscal_year_start = '2027-01-31' %}
  {% elsif fiscal_year == 2028 %} {% assign fiscal_year_start = '2028-01-30' %}
  {% elsif fiscal_year == 2029 %} {% assign fiscal_year_start = '2029-02-04' %}
  {% elsif fiscal_year == 2030 %} {% assign fiscal_year_start = '2030-02-03' %}

  {% else %} {% assign fiscal_year_start = '2030-02-03' %}
  {% endif %}
  {% assign fiscal_year_start_seconds = fiscal_year_start | date: '%s' %}
  "
}

constant: fiscal_year_end {
  value: "
  {% if fiscal_year == 2014 %} {% assign fiscal_year_end = '2015-01-31' %}
  {% elsif fiscal_year == 2015 %} {% assign fiscal_year_end = '2016-01-30' %}
  {% elsif fiscal_year == 2016 %} {% assign fiscal_year_end = '2017-01-28' %}
  {% elsif fiscal_year == 2017 %} {% assign fiscal_year_end = '2018-02-03' %}
  {% elsif fiscal_year == 2018 %} {% assign fiscal_year_end = '2019-02-02' %}
  {% elsif fiscal_year == 2019 %} {% assign fiscal_year_end = '2020-02-01' %}
  {% elsif fiscal_year == 2020 %} {% assign fiscal_year_end = '2021-01-30' %}
  {% elsif fiscal_year == 2021 %} {% assign fiscal_year_end = '2022-01-29' %}
  {% elsif fiscal_year == 2022 %} {% assign fiscal_year_end = '2023-01-28' %}
  {% elsif fiscal_year == 2023 %} {% assign fiscal_year_end = '2024-02-03' %}
  {% elsif fiscal_year == 2024 %} {% assign fiscal_year_end = '2025-02-01' %}
  {% elsif fiscal_year == 2025 %} {% assign fiscal_year_end = '2026-01-31' %}
  {% elsif fiscal_year == 2026 %} {% assign fiscal_year_end = '2027-01-30' %}
  {% elsif fiscal_year == 2027 %} {% assign fiscal_year_end = '2028-01-29' %}
  {% elsif fiscal_year == 2028 %} {% assign fiscal_year_end = '2029-02-03' %}
  {% elsif fiscal_year == 2029 %} {% assign fiscal_year_end = '2030-02-02' %}
  {% elsif fiscal_year == 2030 %} {% assign fiscal_year_end = '2031-02-01' %}

  {% else %} {% assign fiscal_year_end = '2031-02-01' %}
  {% endif %}
  {% assign fiscal_year_end_seconds = fiscal_year_end | date: '%s' %}
  "
}

constant: fiscal_day_of_year {
  value: "
  {% assign today_seconds = 'now' | date: '%s' %}
  {% assign fiscal_day_of_year = today_seconds | minus: fiscal_year_start_seconds | divided_by: 3600 | divided_by: 24 | round %}
  "
}

constant: today_fiscal_day_of_year {
  value: "
  {% assign today_week = 'now' | date: '%W' | minus: 0  %}
  {% assign today_month = 'now' | date: '%m' | minus: 0  %}
  {% assign today_year = 'now' | date: '%Y' | minus: 0 %}
  {% if today_week < 5 and today_month <> 12 %} {% assign today_fiscal_year = today_year | minus:1 %}
  {% else %} {% assign today_fiscal_year = today_year %}
  {% endif %}
  {% if today_fiscal_year == 2014 %} {% assign today_fiscal_year_start = '2014-02-02' %}
  {% elsif today_fiscal_year == 2015 %} {% assign today_fiscal_year_start = '2015-02-01' %}
  {% elsif today_fiscal_year == 2016 %} {% assign today_fiscal_year_start = '2017-01-31' %}
  {% elsif today_fiscal_year == 2017 %} {% assign today_fiscal_year_start = '2017-01-29' %}
  {% elsif today_fiscal_year == 2018 %} {% assign today_fiscal_year_start = '2018-02-04' %}
  {% elsif today_fiscal_year == 2019 %} {% assign today_fiscal_year_start = '2019-02-03' %}
  {% elsif today_fiscal_year == 2020 %} {% assign today_fiscal_year_start = '2020-02-02' %}
  {% elsif today_fiscal_year == 2021 %} {% assign today_fiscal_year_start = '2021-01-31' %}
  {% elsif today_fiscal_year == 2022 %} {% assign today_fiscal_year_start = '2022-01-30' %}
  {% elsif today_fiscal_year == 2023 %} {% assign today_fiscal_year_start = '2023-01-29' %}
  {% elsif today_fiscal_year == 2024 %} {% assign today_fiscal_year_start = '2024-02-04' %}
  {% elsif today_fiscal_year == 2025 %} {% assign today_fiscal_year_start = '2025-02-02' %}
  {% elsif today_fiscal_year == 2026 %} {% assign today_fiscal_year_start = '2026-02-01' %}
  {% elsif today_fiscal_year == 2027 %} {% assign today_fiscal_year_start = '2027-01-31' %}
  {% elsif today_fiscal_year == 2028 %} {% assign today_fiscal_year_start = '2028-01-30' %}
  {% elsif today_fiscal_year == 2029 %} {% assign today_fiscal_year_start = '2029-02-04' %}
  {% elsif today_fiscal_year == 2030 %} {% assign today_fiscal_year_start = '2030-02-03' %}
  {% else %} {% assign today_fiscal_year_start = '2030-02-03' %}
  {% endif %}
  {% assign today_seconds = 'now' | date: '%s' %}
  {% assign today_fiscal_year_start_seconds = today_fiscal_year_start | date: '%s' %}
  {% assign fiscal_day_of_year = today_seconds | minus: today_fiscal_year_start_seconds | divided_by: 3600 | divided_by: 24 | round %}
  "
}

constant: fiscal_week_number {
  value: "
  {% assign fiscal_week_number = fiscal_day_of_year | divided_by: 7 | plus:1 %}"
}

constant: fiscal_week_start {
  value: "
  {% assign fiscal_week_start_offset = fiscal_week_number | minus: 1 | times: 7 | times: 24 | times: 60 | times: 60 %}
  {% assign fiscal_week_start = fiscal_year_start | date:'%s' | plus: fiscal_week_start_offset | date: '%Y-%m-%d' %}"
}

constant: fiscal_week_end {
  value: "
  {% assign fiscal_week_end_offset = 1 | times: 6 | times: 24 | times: 60 | times: 60 %}
  {% assign fiscal_week_end = fiscal_week_start | date:'%s' | plus: fiscal_week_end_offset | date: '%Y-%m-%d' %}"
}

constant: fiscal_month_number {
  value: "
  {% if    fiscal_week_number >=   1 and fiscal_week_number <=  4 %} {% assign fiscal_month_number =  1 %}
  {% elsif fiscal_week_number >=   5 and fiscal_week_number <=  9 %} {% assign fiscal_month_number =  2 %}
  {% elsif fiscal_week_number >=  10 and fiscal_week_number <= 13 %} {% assign fiscal_month_number =  3 %}
  {% elsif fiscal_week_number >=  14 and fiscal_week_number <= 17 %} {% assign fiscal_month_number =  4 %}
  {% elsif fiscal_week_number >=  18 and fiscal_week_number <= 22 %} {% assign fiscal_month_number =  5 %}
  {% elsif fiscal_week_number >=  23 and fiscal_week_number <= 26 %} {% assign fiscal_month_number =  6 %}
  {% elsif fiscal_week_number >=  27 and fiscal_week_number <= 30 %} {% assign fiscal_month_number =  7 %}
  {% elsif fiscal_week_number >=  31 and fiscal_week_number <= 35 %} {% assign fiscal_month_number =  8 %}
  {% elsif fiscal_week_number >=  36 and fiscal_week_number <= 39 %} {% assign fiscal_month_number =  9 %}
  {% elsif fiscal_week_number >=  40 and fiscal_week_number <= 43 %} {% assign fiscal_month_number = 10 %}
  {% elsif fiscal_week_number >=  44 and fiscal_week_number <= 48 %} {% assign fiscal_month_number = 11 %}
  {% elsif fiscal_week_number >=  49 and fiscal_week_number <= 53 %} {% assign fiscal_month_number = 12 %}
  {% endif %}"
}

constant: fiscal_month_start {
  value: "
  {% assign seconds = 1 | times: 24 | times: 60 | times: 60 %}
  {% if    fiscal_month_number ==  1 %} {% assign day_modifier =  0 | plus: 0 | times:7 %}
  {% elsif fiscal_month_number ==  2 %} {% assign day_modifier =  0 | plus: 4 | times:7 %}
  {% elsif fiscal_month_number ==  3 %} {% assign day_modifier =  0 | plus: 9 | times:7 %}
  {% elsif fiscal_month_number ==  4 %} {% assign day_modifier =  0 | plus:13 | times:7 %}
  {% elsif fiscal_month_number ==  5 %} {% assign day_modifier = 13 | plus: 4 | times:7 %}
  {% elsif fiscal_month_number ==  6 %} {% assign day_modifier = 13 | plus: 9 | times:7 %}
  {% elsif fiscal_month_number ==  7 %} {% assign day_modifier = 13 | plus:13 | times:7 %}
  {% elsif fiscal_month_number ==  8 %} {% assign day_modifier = 26 | plus: 4 | times:7 %}
  {% elsif fiscal_month_number ==  9 %} {% assign day_modifier = 26 | plus: 9 | times:7 %}
  {% elsif fiscal_month_number == 10 %} {% assign day_modifier = 26 | plus:13 | times:7 %}
  {% elsif fiscal_month_number == 11 %} {% assign day_modifier = 39 | plus: 4 | times:7 %}
  {% elsif fiscal_month_number == 12 %} {% assign day_modifier = 39 | plus: 9 | times:7 %}
  {% endif %}
  {% assign seconds_since_start_of_fiscal_year = seconds | times: day_modifier %}
  {% assign fiscal_month_start = fiscal_year_start | date: '%s' | plus: seconds_since_start_of_fiscal_year | date: '%Y-%m-%d' %}"
}

constant: fiscal_month_end {
  value: "
  {% assign seconds = 1 | times: 24 | times: 60 | times: 60 %}
  {% if    fiscal_month_number ==  1 %} {% assign day_modifier =  4 | times:7 | minus:1 %}
  {% elsif fiscal_month_number ==  2 %} {% assign day_modifier =  5 | times:7 | minus:1 %}
  {% elsif fiscal_month_number ==  3 %} {% assign day_modifier =  4 | times:7 | minus:1 %}
  {% elsif fiscal_month_number ==  4 %} {% assign day_modifier =  4 | times:7 | minus:1 %}
  {% elsif fiscal_month_number ==  5 %} {% assign day_modifier =  5 | times:7 | minus:1 %}
  {% elsif fiscal_month_number ==  6 %} {% assign day_modifier =  4 | times:7 | minus:1 %}
  {% elsif fiscal_month_number ==  7 %} {% assign day_modifier =  4 | times:7 | minus:1 %}
  {% elsif fiscal_month_number ==  8 %} {% assign day_modifier =  5 | times:7 | minus:1 %}
  {% elsif fiscal_month_number ==  9 %} {% assign day_modifier =  4 | times:7 | minus:1 %}
  {% elsif fiscal_month_number == 10 %} {% assign day_modifier =  4 | times:7 | minus:1 %}
  {% elsif fiscal_month_number == 11 %} {% assign day_modifier =  5 | times:7 | minus:1 %}
  {% elsif fiscal_month_number == 12 %} {% assign day_modifier =  4 | times:7 | minus:1 %}
  {% endif %}
  {% assign seconds_to_end_of_fiscal_month = seconds | times: day_modifier %}
  {% assign fiscal_month_end = fiscal_month_start | date: '%s' | plus: seconds_to_end_of_fiscal_month | date: '%Y-%m-%d' %}"
}

constant: fiscal_quarter_number {
  value: "
  {% if    fiscal_week_number >=   1 and fiscal_week_number <= 13 %} {% assign fiscal_quarter_number =  1 %}
  {% elsif fiscal_week_number >=  14 and fiscal_week_number <= 26 %} {% assign fiscal_quarter_number =  2 %}
  {% elsif fiscal_week_number >=  27 and fiscal_week_number <= 39 %} {% assign fiscal_quarter_number =  3 %}
  {% elsif fiscal_week_number >=  40 and fiscal_week_number <= 53 %} {% assign fiscal_quarter_number =  4 %}
  {% endif %}"
}

constant: fiscal_quarter_start {
  value: "
  {% assign seconds = 1 | times: 24 | times: 60 | times: 60 %}
  {% if    fiscal_quarter_number ==  1 %} {% assign day_modifier =  0 | plus:  0 | times:7 | times:1 %}
  {% elsif fiscal_quarter_number ==  2 %} {% assign day_modifier =  0 | plus: 13 | times:7 | times:1 %}
  {% elsif fiscal_quarter_number ==  3 %} {% assign day_modifier =  0 | plus: 13 | times:7 | times:2 %}
  {% elsif fiscal_quarter_number ==  4 %} {% assign day_modifier =  0 | plus: 13 | times:7 | times:3 %}
  {% endif %}
  {% assign seconds_since_start_of_fiscal_year = seconds | times: day_modifier %}
  {% assign fiscal_quarter_start = fiscal_year_start | date: '%s' | plus: seconds_since_start_of_fiscal_year | date: '%Y-%m-%d' %}"
}

constant: fiscal_quarter_end {
  value: "
  {% assign seconds = 1 | times: 24 | times: 60 | times: 60 %}
  {% if    fiscal_quarter_number ==  1 %} {% assign day_modifier =  0 | plus: 13 | times:7 | times:1 | minus:1 %}
  {% elsif fiscal_quarter_number ==  2 %} {% assign day_modifier =  0 | plus: 13 | times:7 | times:2 | minus:1 %}
  {% elsif fiscal_quarter_number ==  3 %} {% assign day_modifier =  0 | plus: 13 | times:7 | times:3 | minus:1 %}
  {% elsif fiscal_quarter_number ==  4 %} {% assign day_modifier =  0 | plus: 13 | times:7 | times:4 | minus:1 %}
  {% endif %}
  {% assign seconds_since_start_of_fiscal_year = seconds | times: day_modifier %}
  {% assign fiscal_quarter_end = fiscal_year_start | date: '%s' | plus: seconds_since_start_of_fiscal_year | date: '%Y-%m-%d' %}"
}


constant: this_year_fiscal_dates {
  value: "
  @{fiscal_year}
  @{fiscal_year_start}
  @{fiscal_year_end}
  @{fiscal_day_of_year}
  @{fiscal_week_number}
  @{fiscal_week_start}
  @{fiscal_week_end}
  @{fiscal_month_number}
  @{fiscal_month_start}
  @{fiscal_month_end}
  @{fiscal_quarter_number}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}
  "
}

constant: this_year_last_week_fiscal_dates {
  value: "
  @{fiscal_year}
  @{fiscal_year_start}
  @{fiscal_day_of_year}
  @{fiscal_week_number}
  {% if fiscal_week_number == 1 %}
  {% assign fiscal_week_number = 52 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  @{fiscal_year_end}
  {% else %}
  {% assign fiscal_week_number = fiscal_week_number | minus: 1 %}
  {% endif %}
  @{fiscal_week_start}
  @{fiscal_week_end}"
}

constant: this_year_two_weeks_ago_fiscal_dates {
  value: "
  @{fiscal_year}
  @{fiscal_year_start}
  @{fiscal_day_of_year}
  @{fiscal_week_number}
  {% if fiscal_week_number == 1 %}
  {% assign fiscal_week_number = 51 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  {% elsif fiscal_week_number == 2 %}
  {% assign fiscal_week_number = 52 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  @{fiscal_year_end}
  {% else %}
  {% assign fiscal_week_number = fiscal_week_number | minus: 2 %}
  {% endif %}

  @{fiscal_week_start}
  @{fiscal_week_end}"
}

constant: this_year_last_month_fiscal_dates {
  value: "
  @{fiscal_year}
  @{fiscal_year_start}
  @{fiscal_day_of_year}
  @{fiscal_week_number}
  @{fiscal_month_number}
  {% if fiscal_month_number == 1 %}
  {% assign fiscal_month_number = 12 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  @{fiscal_year_end}
  {% else %}
  {% assign fiscal_month_number = fiscal_month_number | minus: 1 %}
  {% endif %}
  @{fiscal_month_start}
  @{fiscal_month_end}"
}

constant: this_year_last_quarter_fiscal_dates {
  value: "
  @{fiscal_year}
  @{fiscal_year_start}
  @{fiscal_day_of_year}
  @{fiscal_week_number}
  @{fiscal_month_number}
  @{fiscal_quarter_number}
  {% if fiscal_quarter_number == 1 %}
  {% assign fiscal_quarter_number = 4 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  @{fiscal_year_end}
  {% else %}
  {% assign fiscal_quarter_number = fiscal_quarter_number | minus: 1 %}
  {% endif %}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}"
}

constant: last_year_fiscal_dates {
  value: "
  @{fiscal_year}
  {% assign fiscal_year = fiscal_year | minus:1 %}
  @{fiscal_year_start}
  @{fiscal_year_end}
  @{today_fiscal_day_of_year}
  @{fiscal_week_number}
  @{fiscal_week_start}
  @{fiscal_week_end}
  @{fiscal_month_number}
  @{fiscal_month_start}
  @{fiscal_month_end}
  @{fiscal_quarter_number}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}"
}

constant: two_years_ago_fiscal_dates {
  value: "
  @{fiscal_year}
  {% assign fiscal_year = fiscal_year | minus:2 %}
  @{fiscal_year_start}
  @{fiscal_year_end}
  @{today_fiscal_day_of_year}
  @{fiscal_week_number}
  @{fiscal_week_start}
  @{fiscal_week_end}
  @{fiscal_month_number}
  @{fiscal_month_start}
  @{fiscal_month_end}
  @{fiscal_quarter_number}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}"
}

constant: fy19_fiscal_dates {
  value: "
  @{fiscal_year}
  {% assign fiscal_year = 2019 %}
  @{fiscal_year_start}
  @{fiscal_year_end}
  @{today_fiscal_day_of_year}
  @{fiscal_week_number}
  @{fiscal_week_start}
  @{fiscal_week_end}
  @{fiscal_month_number}
  @{fiscal_month_start}
  @{fiscal_month_end}
  @{fiscal_quarter_number}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}"
}

constant: last_year_last_week_fiscal_dates {
  value: "
  @{fiscal_year}
  {% assign fiscal_year = fiscal_year | minus:1 %}
  @{fiscal_year_start}
  @{today_fiscal_day_of_year}
  @{fiscal_week_number}
  {% if fiscal_week_number == 1 %}
  {% assign fiscal_week_number = 52 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  @{fiscal_year_end}
  {% else %}
  {% assign fiscal_week_number = fiscal_week_number | minus: 1 %}
  {% endif %}
  @{fiscal_week_start}
  @{fiscal_week_end}"
}

constant: two_years_last_week_fiscal_dates {
  value: "
  @{fiscal_year}
  {% assign fiscal_year = fiscal_year | minus:2 %}
  @{fiscal_year_start}
  @{today_fiscal_day_of_year}
  @{fiscal_week_number}
  {% if fiscal_week_number == 1 %}
  {% assign fiscal_week_number = 52 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  @{fiscal_year_end}
  {% else %}
  {% assign fiscal_week_number = fiscal_week_number | minus: 1 %}
  {% endif %}
  @{fiscal_week_start}
  @{fiscal_week_end}"
}

constant: fy19_last_week_fiscal_dates {
  value: "
  @{fiscal_year}
  {% assign fiscal_year = 2019 %}
  @{fiscal_year_start}
  @{today_fiscal_day_of_year}
  @{fiscal_week_number}
  {% if fiscal_week_number == 1 %}
  {% assign fiscal_week_number = 52 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  @{fiscal_year_end}
  {% else %}
  {% assign fiscal_week_number = fiscal_week_number | minus: 1 %}
  {% endif %}
  @{fiscal_week_start}
  @{fiscal_week_end}"
}

constant: last_year_last_month_fiscal_dates {
  value: "
  @{fiscal_year}
  {% assign fiscal_year = fiscal_year | minus:1 %}
  @{fiscal_year_start}
  @{today_fiscal_day_of_year}
  @{fiscal_week_number}
  @{fiscal_month_number}
  {% if fiscal_month_number == 1 %}
  {% assign fiscal_month_number = 12 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  {% else %}
  {% assign fiscal_month_number = fiscal_month_number | minus: 1 %}
  {% endif %}
  @{fiscal_month_start}
  @{fiscal_month_end}"
}

constant: two_years_last_month_fiscal_dates {
  value: "
  @{fiscal_year}
  {% assign fiscal_year = fiscal_year | minus:2 %}
  @{fiscal_year_start}
  @{today_fiscal_day_of_year}
  @{fiscal_week_number}
  @{fiscal_month_number}
  {% if fiscal_month_number == 1 %}
  {% assign fiscal_month_number = 12 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  {% else %}
  {% assign fiscal_month_number = fiscal_month_number | minus: 1 %}
  {% endif %}
  @{fiscal_month_start}
  @{fiscal_month_end}"
}

constant: fy19_last_month_fiscal_dates {
  value: "
  @{fiscal_year}
  {% assign fiscal_year = 2019 %}
  @{fiscal_year_start}
  @{today_fiscal_day_of_year}
  @{fiscal_week_number}
  @{fiscal_month_number}
  {% if fiscal_month_number == 1 %}
  {% assign fiscal_month_number = 12 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  {% else %}
  {% assign fiscal_month_number = fiscal_month_number | minus: 1 %}
  {% endif %}
  @{fiscal_month_start}
  @{fiscal_month_end}"
}

constant: last_year_last_quarter_fiscal_dates {
  value: "
  @{fiscal_year}
  {% assign fiscal_year = fiscal_year | minus:1 %}
  @{fiscal_year_start}
  @{today_fiscal_day_of_year}
  @{fiscal_week_number}
  @{fiscal_quarter_number}
  {% if fiscal_quarter_number == 1 %}
  {% assign fiscal_quarter_number = 4 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  {% else %}
  {% assign fiscal_quarter_number = fiscal_quarter_number | minus: 1 %}
  {% endif %}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}"
}

constant: two_years_last_quarter_fiscal_dates {
  value: "
  @{fiscal_year}
  {% assign fiscal_year = fiscal_year | minus:2 %}
  @{fiscal_year_start}
  @{today_fiscal_day_of_year}
  @{fiscal_week_number}
  @{fiscal_quarter_number}
  {% if fiscal_quarter_number == 1 %}
  {% assign fiscal_quarter_number = 4 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  {% else %}
  {% assign fiscal_quarter_number = fiscal_quarter_number | minus: 1 %}
  {% endif %}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}"
}

constant: fy19_last_quarter_fiscal_dates {
  value: "
  @{fiscal_year}
  {% assign fiscal_year = 2019 %}
  @{fiscal_year_start}
  @{today_fiscal_day_of_year}
  @{fiscal_week_number}
  @{fiscal_quarter_number}
  {% if fiscal_quarter_number == 1 %}
  {% assign fiscal_quarter_number = 4 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  {% else %}
  {% assign fiscal_quarter_number = fiscal_quarter_number | minus: 1 %}
  {% endif %}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}"
}

constant: loop_dates {
  value: "
  {% assign start_date_seconds = start_date | date: '%s' %}
  {% assign end_date_seconds = end_date | date: '%s' %}
  {% assign i = 0 %}
  {% assign stop = end_date_seconds | minus: start_date_seconds | divided_by: 3600 | divided_by: 24 | round | plus: 1 %}
  {% assign day_in_seconds = 1 | times: 24 | times: 60 | times: 60 %}
  {% for i in (0..5000) %}
  {% if i == stop %}
  {% break %}
  {% else %}
  {% assign day_multiplier = day_in_seconds | times: i %}
  {% assign date_output = start_date_seconds | plus: day_multiplier | date: '%Y-%m-%d' |prepend:\"DATE('\" | append: \"')\" %}
  {% if i == 0 %}
  {% assign dates = date_output %}
  {% else %}
  {% assign dates = dates | append:',' | append: date_output %}
  {% endif %}
  {% endif %}
  {% endfor %}"
}

constant: this_week_dates {
  value: "
  @{this_year_fiscal_dates}
  {% assign start_date = fiscal_week_start %}
  {% assign end_date = fiscal_week_end %}
  @{loop_dates}
  {{dates}}"
}

constant: this_month_dates {
  value: "
  @{this_year_fiscal_dates}
  {% assign start_date = fiscal_month_start %}
  {% assign end_date = fiscal_month_end %}
  @{loop_dates}
  {{dates}}"
}

constant: this_mtd_til_last_complete_week_dates {
  value: "
  @{fiscal_year}
  @{fiscal_year_start}
  @{fiscal_day_of_year}
  @{fiscal_week_number}

  {% if fiscal_week_number == 1 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  {% assign fiscal_month_number = 12 %}

  @{fiscal_year_start}
  @{fiscal_month_start}
  @{fiscal_month_end}

  {% assign start_date = fiscal_month_start %}
  {% assign end_date = fiscal_month_end %}


  {% elsif fiscal_week_number == 5
  or fiscal_week_number == 10
  or fiscal_week_number == 14
  or fiscal_week_number == 18
  or fiscal_week_number == 23
  or fiscal_week_number == 27
  or fiscal_week_number == 31
  or fiscal_week_number == 36
  or fiscal_week_number == 40
  or fiscal_week_number == 44
  or fiscal_week_number == 49 %}
  @{fiscal_month_number}
  {% assign fiscal_month_number = fiscal_month_number | minus: 1 %}

  @{fiscal_month_start}
  @{fiscal_month_end}
  {% assign start_date = fiscal_month_start %}
  {% assign end_date = fiscal_month_end %}

  {% else %}
  @{fiscal_month_number}
  @{fiscal_month_start}
  @{fiscal_month_end}
  @{fiscal_week_start}
  @{fiscal_week_end}

  {% assign start_date = fiscal_month_start %}
  {% assign 7_day_seconds = 7 | times: 24 | times: 60 | times: 60 %}
  {% assign end_date = fiscal_week_end | date: '%s' | minus: 7_day_seconds | date: '%Y-%m-%d' %}
  {% endif %}

  @{loop_dates}
  {{dates}}"
}

constant: this_quarter_dates {
  value: "
  @{this_year_fiscal_dates}
  {% assign start_date = fiscal_quarter_start %}
  {% assign end_date = fiscal_quarter_end %}
  @{loop_dates}
  {{dates}}"
}

constant: this_qtd_til_last_complete_week_dates {
  value: "
  @{fiscal_year}
  @{fiscal_year_start}
  @{fiscal_day_of_year}
  @{fiscal_week_number}

  {% if fiscal_week_number == 1 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  {% assign fiscal_quarter_number = 4 %}

  @{fiscal_year_start}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}

  {% assign start_date = fiscal_quarter_start %}
  {% assign end_date = fiscal_quarter_end %}


  {% elsif fiscal_week_number == 14
  or fiscal_week_number == 27
  or fiscal_week_number == 40
  %}
  @{fiscal_quarter_number}
  {% assign fiscal_quarter_number = fiscal_quarter_number | minus: 1 %}

  @{fiscal_year_start}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}
  {% assign start_date = fiscal_quarter_start %}
  {% assign end_date = fiscal_quarter_end %}

  {% else %}
  @{fiscal_quarter_number}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}
  @{fiscal_week_start}
  @{fiscal_week_end}

  {% assign start_date = fiscal_quarter_start %}
  {% assign 7_day_seconds = 7 | times: 24 | times: 60 | times: 60 %}
  {% assign end_date = fiscal_week_end | date: '%s' | minus: 7_day_seconds | date: '%Y-%m-%d' %}
  {% endif %}

  @{loop_dates}
  {{dates}}"
}

constant: this_year_dates {
  value: "
  @{this_year_fiscal_dates}
  {% assign start_date = fiscal_year_start %}
  {% assign end_date = fiscal_year_end %}
  @{loop_dates}
  {{dates}}"
}

constant: this_ytd_til_last_complete_week_dates {
  value: "
  @{fiscal_year}
  @{fiscal_year_start}
  @{fiscal_day_of_year}
  @{fiscal_week_number}

  {% if fiscal_week_number == 1 %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}

  @{fiscal_year_start}
  @{fiscal_year_end}
  {% assign start_date = fiscal_year_start %}
  {% assign end_date = fiscal_year_end %}

  {% else %}
  @{this_year_fiscal_dates}

  {% assign start_date = fiscal_year_start %}
  {% assign 7_day_seconds = 7 | times: 24 | times: 60 | times: 60 %}
  {% assign end_date = fiscal_week_end | date: '%s' | minus: 7_day_seconds | date: '%Y-%m-%d' %}
  {% endif %}

  @{loop_dates}
  {{dates}}"
}

constant: this_ytd_dates {
  value: "
  @{this_year_fiscal_dates}
  {% assign start_date = fiscal_year_start %}
  {% assign end_date =  'now' | date: '%Y-%m-%d' %}
  @{loop_dates}
  {{dates}}"
}

constant: last_week_dates {
  value: "
  @{this_year_last_week_fiscal_dates}
  {% assign start_date = fiscal_week_start %}
  {% assign end_date = fiscal_week_end %}
  @{loop_dates}
  {{dates}}"
}

constant: two_weeks_ago_dates {
  value: "
  @{this_year_two_weeks_ago_fiscal_dates}
  {% assign start_date = fiscal_week_start %}
  {% assign end_date = fiscal_week_end %}
  @{loop_dates}
  {{dates}}"
}

constant: last_month_dates {
  value: "
  @{this_year_last_month_fiscal_dates}
  {% assign start_date = fiscal_month_start %}
  {% assign end_date = fiscal_month_end %}
  @{loop_dates}
  {{dates}}"
}

constant: last_quarter_dates {
  value: "
  @{this_year_last_quarter_fiscal_dates}
  {% assign start_date = fiscal_quarter_start %}
  {% assign end_date = fiscal_quarter_end %}
  @{loop_dates}
  {{dates}}"
}

constant: last_year_dates {
  value: "
  @{last_year_fiscal_dates}
  {% assign start_date = fiscal_year_start %}
  {% assign end_date = fiscal_year_end %}
  @{loop_dates}
  {{dates}}"
}

constant: last_year_this_ytd_til_last_complete_week_dates {
  value: "
  @{fiscal_year}
  @{fiscal_year_start}
  @{fiscal_day_of_year}
  @{fiscal_week_number}

  {% if fiscal_week_number == 1 %}
  {% assign fiscal_year = fiscal_year | minus: 2 %}

  @{fiscal_year_start}
  @{fiscal_year_end}
  {% assign start_date = fiscal_year_start %}
  {% assign end_date = fiscal_year_end %}

  {% else %}
  @{last_year_fiscal_dates}

  {% assign start_date = fiscal_year_start %}
  {% assign 7_day_seconds = 7 | times: 24 | times: 60 | times: 60 %}
  {% assign end_date = fiscal_week_end | date: '%s' | minus: 7_day_seconds | date: '%Y-%m-%d' %}
  {% endif %}

  @{loop_dates}
  {{dates}}"
}


constant: this_ytd_dates {
  value: "
  @{this_year_fiscal_dates}
  {% assign start_date = fiscal_year_start %}
  {% assign end_date =  'now' | date: '%Y-%m-%d' %}
  @{loop_dates}
  {{dates}}"
}
constant: two_years_ago_dates {
  value: "
  @{two_years_ago_fiscal_dates}
  {% assign start_date = fiscal_year_start %}
  {% assign end_date = fiscal_year_end %}
  @{loop_dates}
  {{dates}}"
}

constant: fy19_dates {
  value: "
  @{fy19_fiscal_dates}
  {% assign start_date = fiscal_year_start %}
  {% assign end_date = fiscal_year_end %}
  @{loop_dates}
  {{dates}}"
}

constant: last_ytd_dates {
  value: "
  @{last_year_fiscal_dates}
  {% assign start_date = fiscal_year_start %}
  {% assign fiscal_day_of_year_seconds = fiscal_day_of_year | times: 24 | times: 60 | times: 60 %}
  {% assign end_date =  fiscal_year_start | date: '%s' | plus: fiscal_day_of_year_seconds | date: '%Y-%m-%d' %}
  @{loop_dates}
  {{dates}}"
}

constant: last_year_this_week_dates {
  value: "
  @{last_year_fiscal_dates}
  {% assign start_date = fiscal_week_start %}
  {% assign end_date = fiscal_week_end %}
  @{loop_dates}
  {{dates}}"
}

constant: two_years_this_week_dates {
  value: "
  @{two_years_ago_fiscal_dates}
  {% assign start_date = fiscal_week_start %}
  {% assign end_date = fiscal_week_end %}
  @{loop_dates}
  {{dates}}"
}

constant: fy19_this_week_dates {
  value: "
  @{fy19_fiscal_dates}
  {% assign start_date = fiscal_week_start %}
  {% assign end_date = fiscal_week_end %}
  @{loop_dates}
  {{dates}}"
}

constant: last_year_this_month_dates {
  value: "
  @{last_year_fiscal_dates}
  {% assign start_date = fiscal_month_start %}
  {% assign end_date = fiscal_month_end %}
  @{loop_dates}
  {{dates}}"
}

constant: last_year_this_mtd_til_last_complete_week_dates {
  value: "
  @{fiscal_year}
  @{fiscal_year_start}
  @{fiscal_day_of_year}
  @{fiscal_week_number}

  {% if fiscal_week_number == 1 %}
  {% assign fiscal_year = fiscal_year | minus: 2 %}
  {% assign fiscal_month_number = 12 %}

  @{fiscal_year_start}
  @{fiscal_month_start}
  @{fiscal_month_end}

  {% assign start_date = fiscal_month_start %}
  {% assign end_date = fiscal_month_end %}


  {% elsif fiscal_week_number == 5
  or fiscal_week_number == 10
  or fiscal_week_number == 14
  or fiscal_week_number == 18
  or fiscal_week_number == 23
  or fiscal_week_number == 27
  or fiscal_week_number == 31
  or fiscal_week_number == 36
  or fiscal_week_number == 40
  or fiscal_week_number == 44
  or fiscal_week_number == 49 %}

  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  @{fiscal_month_number}

  {% assign fiscal_month_number = fiscal_month_number | minus: 1 %}

  @{fiscal_month_start}
  @{fiscal_month_end}
  {% assign start_date = fiscal_month_start %}
  {% assign end_date = fiscal_month_end %}

  {% else %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  @{fiscal_month_number}
  @{fiscal_month_start}
  @{fiscal_month_end}
  @{fiscal_week_start}
  @{fiscal_week_end}

  {% assign start_date = fiscal_month_start %}
  {% assign 7_day_seconds = 7 | times: 24 | times: 60 | times: 60 %}
  {% assign end_date = fiscal_week_end | date: '%s' | minus: 7_day_seconds | date: '%Y-%m-%d' %}
  {% endif %}

  @{loop_dates}
  {{dates}}"
}

constant: two_years_this_month_dates {
  value: "
  @{two_years_ago_fiscal_dates}
  {% assign start_date = fiscal_month_start %}
  {% assign end_date = fiscal_month_end %}
  @{loop_dates}
  {{dates}}"
}

constant: fy19_this_month_dates {
  value: "
  @{fy19_fiscal_dates}
  {% assign start_date = fiscal_month_start %}
  {% assign end_date = fiscal_month_end %}
  @{loop_dates}
  {{dates}}"
}

constant: last_year_this_quarter_dates {
  value: "
  @{last_year_fiscal_dates}
  {% assign start_date = fiscal_quarter_start %}
  {% assign end_date = fiscal_quarter_end %}
  @{loop_dates}
  {{dates}}"
}

constant: last_year_this_qtd_til_last_complete_week_dates {
  value: "
  @{fiscal_year}
  @{fiscal_year_start}
  @{fiscal_day_of_year}
  @{fiscal_week_number}

  {% if fiscal_week_number == 1 %}
  {% assign fiscal_year = fiscal_year | minus: 2 %}
  {% assign fiscal_quarter_number = 4 %}

  @{fiscal_year_start}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}

  {% assign start_date = fiscal_quarter_start %}
  {% assign end_date = fiscal_quarter_end %}


  {% elsif fiscal_week_number == 14
  or fiscal_week_number == 27
  or fiscal_week_number == 40 %}

  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  @{fiscal_quarter_number}

  {% assign fiscal_quarter_number = fiscal_quarter_number | minus: 1 %}

  @{fiscal_quarter_start}
  @{fiscal_quarter_end}
  {% assign start_date = fiscal_quarter_start %}
  {% assign end_date = fiscal_quarter_end %}

  {% else %}
  {% assign fiscal_year = fiscal_year | minus: 1 %}
  @{fiscal_year_start}
  @{fiscal_quarter_number}
  @{fiscal_quarter_start}
  @{fiscal_quarter_end}
  @{fiscal_week_start}
  @{fiscal_week_end}

  {% assign start_date = fiscal_quarter_start %}
  {% assign 7_day_seconds = 7 | times: 24 | times: 60 | times: 60 %}
  {% assign end_date = fiscal_week_end | date: '%s' | minus: 7_day_seconds | date: '%Y-%m-%d' %}
  {% endif %}

  @{loop_dates}
  {{dates}}"
}



constant: two_years_this_quarter_dates {
  value: "
  @{two_years_ago_fiscal_dates}
  {% assign start_date = fiscal_quarter_start %}
  {% assign end_date = fiscal_quarter_end %}
  @{loop_dates}
  {{dates}}"
}

constant: fy19_this_quarter_dates {
  value: "
  @{fy19_fiscal_dates}
  {% assign start_date = fiscal_quarter_start %}
  {% assign end_date = fiscal_quarter_end %}
  @{loop_dates}
  {{dates}}"
}

constant: last_year_last_week_dates {
  value: "
  @{last_year_last_week_fiscal_dates}
  {% assign start_date = fiscal_week_start %}
  {% assign end_date = fiscal_week_end %}
  @{loop_dates}
  {{dates}}"
}

constant: two_years_last_week_dates {
  value: "
  @{two_years_last_week_fiscal_dates}
  {% assign start_date = fiscal_week_start %}
  {% assign end_date = fiscal_week_end %}
  @{loop_dates}
  {{dates}}"
}

constant: fy19_last_week_dates {
  value: "
  @{fy19_last_week_fiscal_dates}
  {% assign start_date = fiscal_week_start %}
  {% assign end_date = fiscal_week_end %}
  @{loop_dates}
  {{dates}}"
}

constant: last_year_last_month_dates {
  value: "
  @{last_year_last_month_fiscal_dates}
  {% assign start_date = fiscal_month_start %}
  {% assign end_date = fiscal_month_end %}
  @{loop_dates}
  {{dates}}"
}

constant: two_years_last_month_dates {
  value: "
  @{two_years_last_month_fiscal_dates}
  {% assign start_date = fiscal_month_start %}
  {% assign end_date = fiscal_month_end %}
  @{loop_dates}
  {{dates}}"
}

constant: fy19_last_month_dates {
  value: "
  @{fy19_last_month_fiscal_dates}
  {% assign start_date = fiscal_month_start %}
  {% assign end_date = fiscal_month_end %}
  @{loop_dates}
  {{dates}}"
}

constant: last_year_last_quarter_dates {
  value: "
  @{last_year_last_quarter_fiscal_dates}
  {% assign start_date = fiscal_quarter_start %}
  {% assign end_date = fiscal_quarter_end %}
  @{loop_dates}
  {{dates}}"
}

constant: two_years_last_quarter_dates {
  value: "
  @{two_years_last_quarter_fiscal_dates}
  {% assign start_date = fiscal_quarter_start %}
  {% assign end_date = fiscal_quarter_end %}
  @{loop_dates}
  {{dates}}"
}

constant: fy19_last_quarter_dates {
  value: "
  @{fy19_last_quarter_fiscal_dates}
  {% assign start_date = fiscal_quarter_start %}
  {% assign end_date = fiscal_quarter_end %}
  @{loop_dates}
  {{dates}}"
}

constant: compare_this_week_yoy {
  value: "@{this_week_dates},@{last_year_this_week_dates}"
}

constant: compare_this_week_two_years {
  value: "@{this_week_dates},@{two_years_this_week_dates}"
}

constant: compare_this_week_fy19 {
  value: "@{this_week_dates},@{fy19_this_week_dates}"
}

constant: compare_this_month_yoy {
  value: "@{this_month_dates},@{last_year_this_month_dates}"
}

constant: compare_this_month_last_complete_week_yoy {
  value: "@{this_mtd_til_last_complete_week_dates},@{last_year_this_mtd_til_last_complete_week_dates}"
}

constant: compare_this_month_two_years {
  value: "@{this_month_dates},@{two_years_this_month_dates}"
}

constant: compare_this_month_fy19 {
  value: "@{this_month_dates},@{fy19_this_month_dates}"
}

constant: compare_this_quarter_yoy {
  value: "@{this_quarter_dates},@{last_year_this_quarter_dates}"
}

constant: compare_this_quarter_last_complete_week_yoy {
  value: "@{this_qtd_til_last_complete_week_dates},@{last_year_this_qtd_til_last_complete_week_dates}"
}

constant: compare_this_quarter_two_years {
  value: "@{this_quarter_dates},@{two_years_this_quarter_dates}"
}

constant: compare_this_quarter_fy19 {
  value: "@{this_quarter_dates},@{fy19_this_quarter_dates}"
}

constant: compare_last_week_yoy {
  value: "@{last_week_dates},@{last_year_last_week_dates}"
}

constant: compare_last_week_two_years {
  value: "@{last_week_dates},@{two_years_last_week_dates}"
}

constant: compare_last_week_fy19 {
  value: "@{last_week_dates},@{fy19_last_week_dates}"
}

constant: compare_last_month_yoy {
  value: "@{last_month_dates},@{last_year_last_month_dates}"
}

constant: compare_last_month_two_years {
  value: "@{last_month_dates},@{two_years_last_month_dates}"
}

constant: compare_last_month_fy19 {
  value: "@{last_month_dates},@{fy19_last_month_dates}"
}

constant: compare_last_quarter_yoy {
  value: "@{last_quarter_dates},@{last_year_last_quarter_dates}"
}

constant: compare_last_quarter_two_years {
  value: "@{last_quarter_dates},@{two_years_last_quarter_dates}"
}

constant: compare_last_quarter_fy19 {
  value: "@{last_quarter_dates},@{fy19_last_quarter_dates}"
}

constant: compare_ytd_yoy {
  value: "@{last_ytd_dates},@{this_ytd_dates}"
}

constant: compare_this_year_last_complete_week_yoy {
  value: "@{this_ytd_til_last_complete_week_dates},@{last_year_this_ytd_til_last_complete_week_dates}"
}

constant: compare_last_two_years_yoy {
  value: "@{this_year_dates},@{last_year_dates}"
}

constant: compare_this_year_two_years {
  value: "@{this_year_dates},@{two_years_ago_dates}"
}

constant: compare_this_year_fy19 {
  value: "@{this_year_dates},@{fy19_dates}"
}

constant: compare_last_year_yoy {
  value: "@{last_year_dates},@{two_years_ago_dates}"
}

constant: compare_yesterday_yoy {
  value: "@{yesterday},@{last_year_yesterday}"
}

constant: compare_yesterday_two_years {
  value: "@{yesterday},@{yesterday_two_years}"
}

constant: compare_yesterday_fy19 {
  value: "@{yesterday},@{yesterday_fy19}"
}

constant: compare_this_week_to_last_week {
  value: "@{this_week_dates},@{last_week_dates}"
}

constant: compare_last_week_to_preceding_week {
  value: "@{last_week_dates},@{two_weeks_ago_dates}"
}

constant: compare_this_month_to_last_month {
  value: "@{this_month_dates},@{last_month_dates}"
}

constant: yesterday {
  value: "
  {% assign one_day = 1 | times: 24 | times: 60 | times: 60 %}
  {% assign yesterday = 'now' | date: '%s' | minus: one_day | date: '%Y-%m-%d' %}
  DATE('{{yesterday}}')
  "
}

constant: last_year_yesterday {
  value: "
  @{last_year_fiscal_dates}
  {% assign start_date = fiscal_year_start %}
  {% assign fiscal_day_of_year_seconds = fiscal_day_of_year | times: 24 | times: 60 | times: 60 %}
  {% assign one_day = 1 | times: 24 | times: 60 | times: 60 %}
  {% assign last_year_yesterday =  fiscal_year_start | date: '%s' | plus: fiscal_day_of_year_seconds | minus: one_day | date: '%Y-%m-%d' %}
  DATE('{{last_year_yesterday}}')"
}

constant: yesterday_two_years {
  value: "
  @{two_years_ago_fiscal_dates}
  {% assign start_date = fiscal_year_start %}
  {% assign fiscal_day_of_year_seconds = fiscal_day_of_year | times: 24 | times: 60 | times: 60 %}
  {% assign one_day = 1 | times: 24 | times: 60 | times: 60 %}
  {% assign yesterday_two_years =  fiscal_year_start | date: '%s' | plus: fiscal_day_of_year_seconds | minus: one_day | date: '%Y-%m-%d' %}
  DATE('{{yesterday_two_years}}')"
}

constant: yesterday_fy19 {
  value: "
  @{fy19_fiscal_dates}
  {% assign start_date = fiscal_year_start %}
  {% assign fiscal_day_of_year_seconds = fiscal_day_of_year | times: 24 | times: 60 | times: 60 %}
  {% assign one_day = 1 | times: 24 | times: 60 | times: 60 %}
  {% assign yesterday_fy19 =  fiscal_year_start | date: '%s' | plus: fiscal_day_of_year_seconds | minus: one_day | date: '%Y-%m-%d' %}
  DATE('{{yesterday_fy19}}')"
}

constant: fiscal_date_filter {
  value: "
  {% if parameter_selected == 'yesterday' %} @{yesterday}
  {% elsif parameter_selected == 'this_week' %} @{this_week_dates}
  {% elsif parameter_selected == 'last_week' %} @{last_week_dates}
  {% elsif parameter_selected == 'preceding_week' %} @{two_weeks_ago_dates}
  {% elsif parameter_selected == 'this_period' %} @{this_month_dates}
  {% elsif parameter_selected == 'this_period_last_complete_week' %} @{this_mtd_til_last_complete_week_dates}
  {% elsif parameter_selected == 'last_period' %} @{last_month_dates}
  {% elsif parameter_selected == 'this_quarter' %} @{this_quarter_dates}
  {% elsif parameter_selected == 'this_quarter_last_complete_week' %} @{this_qtd_til_last_complete_week_dates}
  {% elsif parameter_selected == 'last_quarter' %} @{last_quarter_dates}
  {% elsif parameter_selected == 'this_year' %} @{this_year_dates}
  {% elsif parameter_selected == 'this_year_last_complete_week' %} @{this_ytd_til_last_complete_week_dates}
  {% elsif parameter_selected == 'last_year' %} @{last_year_dates}
  {% elsif parameter_selected == 'two_years' %} @{two_years_ago_dates}
  {% elsif parameter_selected == 'fy19' %} @{fy19_dates}
  {% elsif parameter_selected == 'this_ytd' %} @{this_ytd_dates}
  {% elsif parameter_selected == 'last_ytd' %} @{last_ytd_dates}
  {% elsif parameter_selected == 'compare_yesterday' %} @{compare_yesterday_yoy}
  {% elsif parameter_selected == 'compare_yesterday_two_years' %} @{compare_yesterday_two_years}
  {% elsif parameter_selected == 'compare_yesterday_fy19' %} @{compare_yesterday_fy19}
  {% elsif parameter_selected == 'compare_this_week' %} @{compare_this_week_yoy}
  {% elsif parameter_selected == 'compare_this_week_two_years' %} @{compare_this_week_two_years}
  {% elsif parameter_selected == 'compare_this_week_fy19' %} @{compare_this_week_fy19}
  {% elsif parameter_selected == 'compare_last_week' %} @{compare_last_week_yoy}
  {% elsif parameter_selected == 'compare_last_week_two_years' %} @{compare_last_week_two_years}
  {% elsif parameter_selected == 'compare_last_week_fy19' %} @{compare_last_week_fy19}
  {% elsif parameter_selected == 'compare_this_period' %} @{compare_this_month_yoy}
  {% elsif parameter_selected == 'compare_this_period_last_complete_week' %} @{compare_this_month_last_complete_week_yoy}
  {% elsif parameter_selected == 'compare_this_period_two_years' %} @{compare_this_month_two_years}
  {% elsif parameter_selected == 'compare_this_period_fy19' %} @{compare_this_month_fy19}
  {% elsif parameter_selected == 'compare_last_period' %} @{compare_last_month_yoy}
  {% elsif parameter_selected == 'compare_last_period_two_years' %} @{compare_last_month_two_years}
  {% elsif parameter_selected == 'compare_last_period_fy19' %} @{compare_last_month_fy19}
  {% elsif parameter_selected == 'compare_this_quarter' %} @{compare_this_quarter_yoy}
  {% elsif parameter_selected == 'compare_this_quarter_last_complete_week' %} @{compare_this_quarter_last_complete_week_yoy}
  {% elsif parameter_selected == 'compare_last_quarter' %} @{compare_last_quarter_yoy}
  {% elsif parameter_selected == 'compare_ytd' %} @{compare_ytd_yoy}
  {% elsif parameter_selected == 'compare_this_year_last_complete_week' %} @{compare_this_year_last_complete_week_yoy}
  {% elsif parameter_selected == 'compare_last_year' %} @{compare_last_year_yoy}
  {% elsif parameter_selected == 'compare_this_year_two_years' %} @{compare_this_year_two_years}
  {% elsif parameter_selected == 'compare_this_year_fy19' %} @{compare_this_year_fy19}
  {% elsif parameter_selected == 'compare_last_two_years' %} @{compare_last_two_years_yoy}
  {% elsif parameter_selected == 'compare_this_week_to_last_week' %} @{compare_this_week_to_last_week}
  {% elsif parameter_selected == 'compare_last_week_to_preceding_week' %} @{compare_last_week_to_preceding_week}
  {% elsif parameter_selected == 'compare_this_period_to_last_period' %} @{compare_this_month_to_last_month}
  {% endif %}
  "
}
