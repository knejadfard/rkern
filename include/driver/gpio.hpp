#ifndef RKERN_GPIO_HPP
#define RKERN_GPIO_HPP

#include <types.hpp>

namespace rkern {
namespace driver {

class Gpio {
public:
    Gpio(uint32_t const base_address);

    void enable_input(int const gpio_pin_number);
    void disable_input(int const gpio_pin_number);

    void enable_output(int const gpio_pin_number);
    void disable_output(int const gpio_pin_number);

    void enable_io_function(int const gpio_pin_number);
    void disable_io_function(int const gpio_pin_number);

    void set_output_value(int const gpio_pin_number, int const value);

    void set_drive_strength(int const gpio_pin_number, int const value);

private:
    volatile uint32_t _base_address;

    enum GpioOffset {
        INPUT_VALUE = 0x00,
        INPUT_ENABLE = 0x04,
        OUTPUT_ENABLE = 0x08,
        OUTPUT_VALUE = 0x0C,
        // TODO pue
        DRIVE_STRENGTH = 0x14,
        // TODO rise_ie, rise_ip, fall_ie, fall_ip, high_ie, high_ip, low_ie, low_ip
        IO_FUNCTION_ENABLE = 0x38,
        OUT_XOR = 0x40
    };
};

Gpio::Gpio(const uint32_t base_address) : _base_address{base_address}
{
    // empty
}

// TODO should use a helper function for setting a bit to 0 or 1 and reuse it here.
void Gpio::enable_input(const int gpio_pin_number)
{
    *((uint32_t *) (_base_address + GpioOffset::INPUT_ENABLE)) = *((rkern::uint32_t *) (_base_address + GpioOffset::INPUT_ENABLE)) | (0x1 << gpio_pin_number);
}

void Gpio::disable_input(const int gpio_pin_number)
{
    *((uint32_t *) (_base_address + GpioOffset::INPUT_ENABLE)) &= ~(0x1 << gpio_pin_number);
}

void Gpio::enable_output(const int gpio_pin_number)
{
    *((uint32_t *) (_base_address + GpioOffset::OUTPUT_ENABLE)) |= (0x1 << gpio_pin_number);
}

void Gpio::disable_output(const int gpio_pin_number)
{
    *((uint32_t *) (_base_address + GpioOffset::OUTPUT_ENABLE)) = *((rkern::uint32_t *) (_base_address + GpioOffset::OUTPUT_ENABLE)) & ~(0x1 << gpio_pin_number);
}

void Gpio::enable_io_function(const int gpio_pin_number)
{
    *((uint32_t *) (_base_address + GpioOffset::IO_FUNCTION_ENABLE)) = *((rkern::uint32_t *) (_base_address + GpioOffset::IO_FUNCTION_ENABLE)) | (0x1 << gpio_pin_number);
}

void Gpio::disable_io_function(const int gpio_pin_number)
{
    *((uint32_t *) (_base_address + GpioOffset::IO_FUNCTION_ENABLE)) = *((rkern::uint32_t *) (_base_address + GpioOffset::IO_FUNCTION_ENABLE)) & ~(0x1 << gpio_pin_number);
}

void Gpio::set_output_value(int const gpio_pin_number, int const value)
{
    *((uint32_t *) (_base_address + GpioOffset::OUTPUT_VALUE)) = *((rkern::uint32_t *) (_base_address + GpioOffset::OUTPUT_VALUE)) | value;
}

void Gpio::set_drive_strength(int const gpio_pin_number, int const value)
{
    *((uint32_t *) (_base_address + GpioOffset::DRIVE_STRENGTH)) = *((rkern::uint32_t *) (_base_address + GpioOffset::DRIVE_STRENGTH)) | value;
}

} // namespace driver
} // namespace rkern

#endif //RKERN_GPIO_HPP
