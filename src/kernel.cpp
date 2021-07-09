#include <types.hpp>
#include <driver/gpio.hpp>

extern "C" void kernel_main()
{
    rkern::uint32_t gpio0_base = 0x10012000;

    // LED0 is GPIO pin 22 - red
    // LED1 is GPIO pin 19 - green
    // LED2 is GPIO pin 21 - blue

    rkern::driver::Gpio gpio0{gpio0_base};

    gpio0.disable_input(21);
    gpio0.disable_io_function(21);
    gpio0.enable_output(21);
}
