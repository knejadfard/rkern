#include <types.hpp>
#include <driver/gpio.hpp>

extern "C" void kernel_main()
{
    rkern::uint32_t gpio0_base = 0x10012000;

    // LED0 is GPIO pin 22 - red
    // LED1 is GPIO pin 19 - green
    // LED2 is GPIO pin 21 - blue

    rkern::driver::Gpio gpio0{gpio0_base};

    gpio0.disable_input(19);
    gpio0.disable_io_function(19);
    gpio0.enable_output(19);

    gpio0.disable_input(21);
    gpio0.disable_io_function(21);
    gpio0.enable_output(21);

    gpio0.disable_input(22);
    gpio0.disable_io_function(22);
    gpio0.enable_output(22);

        gpio0.set_output_value(19, 1);
        gpio0.set_output_value(21, 1);
        gpio0.set_output_value(22, 1);
}
