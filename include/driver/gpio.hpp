#ifndef RKERN_GPIO_HPP
#define RKERN_GPIO_HPP

#include <types.hpp>
#include <utility/binary_io.hpp>

namespace rkern {
namespace driver {

using namespace rkern::utility;

class Gpio {
public:
    Gpio(uint32_t const base_address);

    void enable_input(int const gpio_pin_number);
    void disable_input(int const gpio_pin_number);
    void set_input_value(int const gpio_pin_number, int const value);

    void enable_output(int const gpio_pin_number);
    void disable_output(int const gpio_pin_number);
    void set_output_value(int const gpio_pin_number, int const value);

    void enable_pullup(int const gpio_pin_number);
    void disable_pullup(int const gpio_pin_number);

    void enable_io_function(int const gpio_pin_number);
    void disable_io_function(int const gpio_pin_number);

    void set_drive_strength(int const gpio_pin_number, int const value);

    void enable_rise_interrupt(int const gpio_pin_number);
    void disable_rise_interrupt(int const gpio_pin_number);
    void clear_pending_rise_interrupt(int const gpio_pin_number);

    void enable_fall_interrupt(int const gpio_pin_number);
    void disable_fall_interrupt(int const gpio_pin_number);
    void clear_pending_fall_interrupt(int const gpio_pin_number);

    void enable_high_interrupt(int const gpio_pin_number);
    void disable_high_interrupt(int const gpio_pin_number);
    void clear_pending_high_interrupt(int const gpio_pin_number);

    void enable_low_interrupt(int const gpio_pin_number);
    void disable_low_interrupt(int const gpio_pin_number);
    void clear_pending_low_interrupt(int const gpio_pin_number);

    void set_output_xor(int const gpio_pin_number);
    void clear_output_xor(int const gpio_pin_number);

private:
    volatile uint32_t _base_address;

    enum Offset : uint32_t {
        INPUT_VALUE = 0x00,
        INPUT_ENABLE = 0x04,
        OUTPUT_ENABLE = 0x08,
        OUTPUT_VALUE = 0x0C,
        PULLUP_ENABLE = 0x10,
        DRIVE_STRENGTH = 0x14,
        RISE_INTERRUPT_ENABLE = 0x18,
        RISE_INTERRUPT_PENDING = 0x1C,
        FALL_INTERRUPT_ENABLE = 0x20,
        FALL_INTERRUPT_PENDING = 0x24,
        HIGH_INTERRUPT_ENABLE = 0x28,
        HIGH_INTERRUPT_PENDING = 0x2C,
        LOW_INTERRUPT_ENABLE = 0x30,
        LOW_INTERRUPT_PENDING = 0x34,
        IO_FUNCTION_ENABLE = 0x38,
        OUT_XOR = 0x40
    };
};

Gpio::Gpio(const uint32_t base_address) : _base_address{base_address}
{
    // empty
}

inline void Gpio::enable_input(const int gpio_pin_number)
{
    set_bit(_base_address, Offset::INPUT_ENABLE, gpio_pin_number);

}

inline void Gpio::disable_input(const int gpio_pin_number)
{
    clear_bit(_base_address, Offset::INPUT_ENABLE, gpio_pin_number);
}

inline void Gpio::enable_output(const int gpio_pin_number)
{
    set_bit(_base_address, Offset::OUTPUT_ENABLE, gpio_pin_number);
}

inline void Gpio::disable_output(const int gpio_pin_number)
{
    clear_bit(_base_address, Offset::OUTPUT_ENABLE, gpio_pin_number);
}

inline void Gpio::enable_io_function(const int gpio_pin_number)
{
    set_bit(_base_address, Offset::IO_FUNCTION_ENABLE, gpio_pin_number);
}

inline void Gpio::disable_io_function(const int gpio_pin_number)
{
    clear_bit(_base_address, Offset::IO_FUNCTION_ENABLE, gpio_pin_number);
}

inline void Gpio::set_output_value(int const gpio_pin_number, int const value)
{
    if (value == 0) {
        clear_bit(_base_address, Offset::OUTPUT_VALUE, gpio_pin_number);
    }
    else {
        set_bit(_base_address, Offset::OUTPUT_VALUE, gpio_pin_number);
    }
}

inline void Gpio::set_input_value(int const gpio_pin_number, int const value)
{
    if (value == 0) {
        clear_bit(_base_address, Offset::INPUT_VALUE, gpio_pin_number);
    }
    else {
        set_bit(_base_address, Offset::INPUT_VALUE, gpio_pin_number);
    }
}

inline void Gpio::set_drive_strength(int const gpio_pin_number, int const value)
{
    if (value == 0) {
        clear_bit(_base_address, Offset::DRIVE_STRENGTH, gpio_pin_number);
    }
    else {
        set_bit(_base_address, Offset::DRIVE_STRENGTH, gpio_pin_number);
    }
}

inline void Gpio::enable_pullup(int const gpio_pin_number)
{
    set_bit(_base_address, Offset::PULLUP_ENABLE, gpio_pin_number);
}

inline void Gpio::disable_pullup(int const gpio_pin_number)
{
    clear_bit(_base_address, Offset::PULLUP_ENABLE, gpio_pin_number);
}

inline void Gpio::enable_rise_interrupt(int const gpio_pin_number)
{
    set_bit(_base_address, Offset::RISE_INTERRUPT_ENABLE, gpio_pin_number);
}

inline void Gpio::disable_rise_interrupt(int const gpio_pin_number)
{
    clear_bit(_base_address, Offset::RISE_INTERRUPT_ENABLE, gpio_pin_number);
}

inline void Gpio::clear_pending_rise_interrupt(int const gpio_pin_number)
{
    set_bit(_base_address, Offset::RISE_INTERRUPT_PENDING, gpio_pin_number);
}

inline void Gpio::enable_fall_interrupt(int const gpio_pin_number)
{
    set_bit(_base_address, Offset::FALL_INTERRUPT_ENABLE, gpio_pin_number);
}

inline void Gpio::disable_fall_interrupt(int const gpio_pin_number)
{
    clear_bit(_base_address, Offset::FALL_INTERRUPT_ENABLE, gpio_pin_number);
}

inline void Gpio::clear_pending_fall_interrupt(int const gpio_pin_number)
{
    set_bit(_base_address, Offset::FALL_INTERRUPT_PENDING, gpio_pin_number);
}

inline void Gpio::enable_high_interrupt(int const gpio_pin_number)
{
    set_bit(_base_address, Offset::HIGH_INTERRUPT_ENABLE, gpio_pin_number);
}

inline void Gpio::disable_high_interrupt(int const gpio_pin_number)
{
    clear_bit(_base_address, Offset::HIGH_INTERRUPT_ENABLE, gpio_pin_number);
}

inline void Gpio::clear_pending_high_interrupt(int const gpio_pin_number)
{
    set_bit(_base_address, Offset::HIGH_INTERRUPT_PENDING, gpio_pin_number);
}

inline void Gpio::enable_low_interrupt(int const gpio_pin_number)
{
    set_bit(_base_address, Offset::LOW_INTERRUPT_ENABLE, gpio_pin_number);
}

inline void Gpio::disable_low_interrupt(int const gpio_pin_number)
{
    clear_bit(_base_address, Offset::LOW_INTERRUPT_ENABLE, gpio_pin_number);
}

inline void Gpio::clear_pending_low_interrupt(int const gpio_pin_number)
{
    set_bit(_base_address, Offset::LOW_INTERRUPT_PENDING, gpio_pin_number);
}

inline void Gpio::set_output_xor(int const gpio_pin_number)
{
    set_bit(_base_address, Offset::OUT_XOR, gpio_pin_number);
}

inline void Gpio::clear_output_xor(int const gpio_pin_number)
{
    clear_bit(_base_address, Offset::OUT_XOR, gpio_pin_number);
}

} // namespace driver
} // namespace rkern

#endif //RKERN_GPIO_HPP
