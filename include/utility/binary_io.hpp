#ifndef RKERN_BINARY_IO_HPP
#define RKERN_BINARY_IO_HPP

#include <types.hpp>

namespace rkern {
namespace utility {

/*
 * Set a specific bit of the value located at base_address with the specified offset.
 */
inline void set_bit(uint32_t const base_address, uint32_t const offset, unsigned int const bit_number)
{
    *((uint32_t *) (base_address + offset)) |= (0x1 << bit_number);
}

/*
 * Clear a specific bit of the value located at base_address with the specified offset.
 */
inline void clear_bit(uint32_t const base_address, uint32_t const offset, unsigned int const bit_number)
{
    *((uint32_t *) (base_address + offset)) &= ~(0x1 << bit_number);
}

}
}

#endif //RKERN_BINARY_IO_HPP
