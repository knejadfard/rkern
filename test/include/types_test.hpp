#ifndef TYPES_TEST_HPP
#define TYPES_TEST_HPP

#include <types.hpp>
#include <catch2/catch.hpp>

TEST_CASE("Types have been defined correctly according to RISC-V ISA specifications", "[type_definitions]") {
    REQUIRE(sizeof(rkern::size_t) == 4);
    REQUIRE(sizeof(rkern::byte) == 1);

    REQUIRE(sizeof(rkern::int8_t) == 1);
    REQUIRE(sizeof(rkern::uint8_t) == 1);

    REQUIRE(sizeof(rkern::int16_t) == 2);
    REQUIRE(sizeof(rkern::uint16_t) == 2);

    REQUIRE(sizeof(rkern::int32_t) == 4);
    REQUIRE(sizeof(rkern::uint32_t) == 4);

    REQUIRE(sizeof(rkern::int64_t) == 8);
    REQUIRE(sizeof(rkern::uint64_t) == 8);
}

#endif
