#ifndef RKERN_VGA_HPP
#define RKERN_VGA_HPP

namespace rkern::vga {

    // Hardware text mode color constants.
    enum Color {
        BLACK = 0,
        BLUE = 1,
        GREEN = 2,
        CYAN = 3,
        RED = 4,
        MAGENTA = 5,
        BROWN = 6,
        LIGHT_GREY = 7,
        DARK_GREY = 8,
        LIGHT_BLUE = 9,
        LIGHT_GREEN = 10,
        LIGHT_CYAN = 11,
        LIGHT_RED = 12,
        LIGHT_MAGENTA = 13,
        LIGHT_BROWN = 14,
        WHITE = 15,
    };

    static inline uint8_t entry_color(Color fg, Color bg)
    {
        return fg | bg << 4;
    }

    static inline uint16_t entry(unsigned char uc, uint8_t color)
    {
        return (uint16_t) uc | (uint16_t) color << 8;
    }

    static const size_t WIDTH = 80;
    static const size_t HEIGHT = 25;

}

#endif
