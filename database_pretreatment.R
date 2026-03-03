responses_raw <- readRDS('./stu_qqq.rds')

responses <- responses_raw |> 
  select(
    country = CNT,
    academic_lvl = ST001D01T,
    birth_year = ST003D03T,
    gender = ST004D01T,
    index_highest_parental_education = PAREDINT,
    index_highest_parental_occupation_status = HISEI,
    index_socioeconomic_status = ESCS,
    computer_for_work_available = ST250Q02JA,
    educational_apps_available = ST250Q03JA,
    internet_access_available = ST250Q05JA,
    response_medium = ADMINMODE,
    book_reading_for_school = ST256Q10JA,
    region_and_schools = STRATUM,
    
    digital_resources_usage_for_learning_at_school_by_day = ST326Q01JA,
    digital_resources_usage_for_learning_outside_school_by_day = ST326Q02JA,
    digital_resources_usage_for_learning_on_weekends = ST326Q03JA,
    digital_resources_usage_for_leisure_at_school_by_day = ST326Q04JA,
    digital_resources_usage_for_leisure_outside_school_by_day = ST326Q05JA,
    digital_resources_usage_for_leisure_on_weekends = ST326Q06JA,
    nb_digital_devices_at_home = ST253Q01JA,
    digital_games_usage_for_learning = IC174Q10JA,
    
    pv_math_1 = PV1MATH,
    pv_math_2 = PV2MATH,
    pv_math_3 = PV3MATH,
    pv_math_4 = PV4MATH,
    pv_math_5 = PV5MATH,
    pv_math_6 = PV6MATH,
    pv_math_7 = PV7MATH,
    pv_math_8 = PV8MATH,
    pv_math_9 = PV9MATH,
    pv_math_10 = PV10MATH,
    pv_reading_comprehension_1 = PV1READ,
    pv_reading_comprehension_2 = PV2READ,
    pv_reading_comprehension_3 = PV3READ,
    pv_reading_comprehension_4 = PV4READ,
    pv_reading_comprehension_5 = PV5READ,
    pv_reading_comprehension_6 = PV6READ,
    pv_reading_comprehension_7 = PV7READ,
    pv_reading_comprehension_8 = PV8READ,
    pv_reading_comprehension_9 = PV9READ,
    pv_reading_comprehension_10 = PV10READ,
    pv_science_1 = PV1SCIE,
    pv_science_2 = PV2SCIE,
    pv_science_3 = PV3SCIE,
    pv_science_4 = PV4SCIE,
    pv_science_5 = PV5SCIE,
    pv_science_6 = PV6SCIE,
    pv_science_7 = PV7SCIE,
    pv_science_8 = PV8SCIE,
    pv_science_9 = PV9SCIE,
    pv_science_10 = PV10SCIE,
  )

responses <- responses %>% 
  mutate(
    pv_math = rowMeans(
      select(., pv_math_1,
                pv_math_2,
                pv_math_3,
                pv_math_4,
                pv_math_5,
                pv_math_6,
                pv_math_7,
                pv_math_8,
                pv_math_9,
                pv_math_10
      ), 
      na.rm = TRUE
    ),
    pv_reading_comprehension = rowMeans(
      select(., pv_reading_comprehension_1,
                pv_reading_comprehension_2,
                pv_reading_comprehension_3,
                pv_reading_comprehension_4,
                pv_reading_comprehension_5,
                pv_reading_comprehension_6,
                pv_reading_comprehension_7,
                pv_reading_comprehension_8,
                pv_reading_comprehension_9,
                pv_reading_comprehension_10
      ),
      na.rm = TRUE
    ),
    pv_science = rowMeans(
      select(., pv_science_1,
                pv_science_2,
                pv_science_3,
                pv_science_4,
                pv_science_5,
                pv_science_6,
                pv_science_7,
                pv_science_8,
                pv_science_9,
                pv_science_10
      ), 
      na.rm = TRUE
    )
  )

saveRDS(responses, './clean_stu_qqq.rds')
