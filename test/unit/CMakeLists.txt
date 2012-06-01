# main file for src

SET(UNIT_TESTS FALSE
    CACHE STRING " enable or disable the unit tests")

if(UNIT_TESTS)

include_directories(${PROJECT_SOURCE_DIR}/src ".")


add_subdirectory(datetime)
add_subdirectory(session)
add_subdirectory(request)
add_subdirectory(neon)
add_subdirectory(credential)

FILE(GLOB src_cgreen "*.cpp")

add_executable(test_unit_davix ${src_cgreen} ${src_test_datetime} ${src_test_session} ${src_test_req} ${src_test_neon} ${src_credential})
target_link_libraries(test_unit_davix davix cgreen)


add_test(test_davix_all test_unit_davix)


endif(UNIT_TESTS)