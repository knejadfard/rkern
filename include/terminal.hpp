#ifndef RKERN_TERMINAL_HPP
#define RKERN_TERMINAL_HPP

#include "vga.hpp"

namespace rkern {

    class Terminal {
    public:
        Terminal() : row_{0}, column_{0}, color_{vga::entry_color(vga::Color::LIGHT_GREY, vga::Color::BLACK)}, buffer_{(uint16_t*) 0xB8000}
        {
            for (size_t y = 0; y < vga::HEIGHT; y++) {
                for (size_t x = 0; x < vga::WIDTH; x++) {
                    const size_t index = y * vga::WIDTH + x;
                    buffer_[index] = vga::entry(' ', color_);
                }
            }
        }

        void color(uint8_t color)
        {
            color_ = color;
        }

        void put_entry_at(char c, uint8_t color, size_t x, size_t y)
        {
            const size_t index = y * vga::WIDTH + x;
            buffer_[index] = vga::entry(c, color);
        }

        void put_char(char c)
        {
            put_entry_at(c, color_, column_, row_);
            if (++column_ == vga::WIDTH) {
                column_ = 0;
                if (++row_ == vga::HEIGHT) {
                    row_ = 0;
                }
            }
        }

        void write(const char* data, size_t size)
        {
            for (size_t i = 0; i < size; i++) {
                put_char(data[i]);
            }
        }

        void write_string(const char* data)
        {
            write(data, utility::string::length(data));
        }

    private:
        size_t row_;
        size_t column_;
        uint8_t color_;
        uint16_t* buffer_;
    };

}

#endif
