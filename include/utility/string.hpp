#ifndef RKERN_UTILITY_STRING_HPP
#define RKERN_UTILITY_STRING_HPP

namespace rkern::utility::string {

    size_t length(const char* str)
    {
        size_t len = 0;
        while (str[len]) {
            len++;
        }
        return len;
    }

}

#endif
