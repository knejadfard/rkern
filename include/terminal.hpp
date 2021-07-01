#ifndef RKERN_TERMINAL_HPP
#define RKERN_TERMINAL_HPP

#include <types.hpp>
#include <utility.hpp>
#include <vga.hpp>

namespace rkern {

    class Terminal {
    public:
        Terminal();

        void color(uint8_t);
        void put_entry_at(char, uint8_t, size_t, size_t);
        void put_char(char);
        void write(const char*, size_t);
        void write_string(const char*);

    private:
        size_t row_;
        size_t column_;
        uint8_t color_;
        uint16_t* buffer_;
    };

    /*
     * Default constructor
     */
    Terminal::Terminal()
        : row_{0}, column_{0}, color_{vga::entry_color(vga::Color::LIGHT_GREY, vga::Color::BLACK)},
        buffer_{(uint16_t*) 0xB8000}
    {
        for (size_t y = 0; y < vga::HEIGHT; y++) {
            for (size_t x = 0; x < vga::WIDTH; x++) {
                const size_t index = y * vga::WIDTH + x;
                buffer_[index] = vga::entry(' ', color_);
            }
        }
    }

    /*
     * Set terminal color values.
     */
    inline void Terminal::color(uint8_t color)
    {
        color_ = color;
    }

    /*
     * Put a character at a specific location in terminal using x, y coordinates.
     */
    inline void Terminal::put_entry_at(char c, uint8_t color, size_t x, size_t y)
    {
        const size_t index = y * vga::WIDTH + x;
        buffer_[index] = vga::entry(c, color);
    }

    /*
     * Put a character in terminal at the cursor and update the cursor location.
     */
    inline void Terminal::put_char(char c)
    {
        put_entry_at(c, color_, column_, row_);
        if (++column_ == vga::WIDTH) {
            column_ = 0;
            if (++row_ == vga::HEIGHT) {
                row_ = 0;
            }
        }
    }

    /*
     * Write data with specific size into terminal's internal buffer.
     */
    void Terminal::write(const char* data, size_t size)
    {
        for (size_t i = 0; i < size; i++) {
            put_char(data[i]);
        }
    }

    /*
     * Write a null-terminated string into terminal's internal buffer.
     */
    inline void Terminal::write_string(const char* data)
    {
        write(data, utility::string::length(data));
    }

}

#endif
