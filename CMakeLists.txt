cmake_minimum_required(VERSION 3.13)
project(rkern CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

option(STRIP_SYMBOLS "Strip symbols when linking" OFF)
option(USE_LLD "Use LLVM's LLD as linker (must use Clang for this to take effect)" ON)

add_executable(rkern ${PROJECT_SOURCE_DIR}/src/kernel.cpp ${PROJECT_SOURCE_DIR}/src/boot.asm)

set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "rkern.bin")

target_include_directories(rkern PUBLIC "${PROJECT_SOURCE_DIR}/include")

# TODO are all of these flags universal between GCC and Clang??
target_compile_options(rkern PUBLIC -fno-exceptions -fno-rtti -ffreestanding -fno-builtin -nostdlib -nostdinc -nostdinc++)
target_link_options(rkern PUBLIC -static -nostdlib)

if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    # Clang or AppleClang
    target_compile_options(rkern PUBLIC --target=i686-pc-none-elf)
    target_link_options(rkern PUBLIC -m32 -static)
    if(USE_LLD)
        target_link_options(rkern PUBLIC -fuse-ld=lld "LINKER:--script=${PROJECT_SOURCE_DIR}/src/linker.lld")
    else()
        target_link_options(rkern PUBLIC -fuse-ld=ld "LINKER:--script=${PROJECT_SOURCE_DIR}/src/linker.ld")
    endif()
    if(STRIP_SYMBOLS)
        target_link_options(rkern PUBLIC "LINKER:--strip-all")
    endif()
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    # GCC
    target_link_options(rkern PUBLIC -m32 -static -fuse-ld=ld "LINKER:--script=${PROJECT_SOURCE_DIR}/src/linker.ld")
endif()

enable_language(ASM)
