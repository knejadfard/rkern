cmake_minimum_required(VERSION 3.10)

add_executable(unit_tests "src/unit_tests.cpp")
find_package(Catch2 REQUIRED)

target_include_directories(unit_tests PRIVATE include "${rkern_SOURCE_DIR}/include")
target_compile_options(unit_tests PRIVATE -O0)
target_link_libraries(unit_tests PRIVATE Catch2::Catch2)

install(TARGETS unit_tests RUNTIME DESTINATION bin)

add_test(NAME unit_tests COMMAND $<TARGET_FILE:unit_tests>)
