#ifndef RKERN_TYPES_HPP
#define RKERN_TYPES_HPP

/**
 * Reference:
 *   The RISC-V Instruction Set Manual, Volume I: User-Level ISA, Version 2.0
 *   Section 18.1
 *
 * RV32:
 * - char, unsigned char -> 8-bit unsigned integers, zero extended when stored in RISC-V integer register
 * - signed char -> 8-bit signed integer, sign-extended when stored in RISC-V integer register
 * - int -> 32 bits
 * - short -> 16-bit signed integer, sign-extended when stored in RISC-V integer register
 * - unsigned short -> 16, zero extended when stored in RISC-V integer register
 * - long -> 32 bits
 * - long long -> 64 bits
 * - float -> 32 bits (IEEE 754-2008 floating-point number)
 * - double -> 64 bits (IEEE 754-2008 floating-point number)
 * - long double -> 128 bits (IEEE 754-2008 floating-point number)
 * - pointers -> 32 bits
 *
 * RV64:
 * - char, unsigned char -> 8-bit unsigned integers, zero extended when stored in RISC-V integer register
 * - signed char -> 8-bit signed integer, sign-extended when stored in RISC-V integer register
 * - int -> 32 bits
 * - unsigned short -> 16 bits, zero extended when stored in RISC-V integer register
 * - long -> 64 bits
 * - long long -> 64 bits
 * - float -> 32 bits (IEEE 754-2008 floating-point number)
 * - double -> 64 bits (IEEE 754-2008 floating-point number)
 * - long double -> 128 bits (IEEE 754-2008 floating-point number)
 * - pointers -> 64 bits
 */

namespace rkern {

using size_t = unsigned int;

using byte = unsigned char;

using int8_t = signed char;
using uint8_t = unsigned char;

using int16_t = short;
using uint16_t = unsigned short;

using int32_t = int;
using uint32_t = unsigned int;

using int64_t = long long;
using uint64_t = unsigned long long;

} // namespace rkern

#endif
