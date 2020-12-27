cmake_minimum_required(VERSION 3.13)
project(rkern CXX)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

option(STRIP_SYMBOLS "Strip symbols when linking" OFF)
option(USE_LLD "Use LLVM's LLD as linker (must use Clang for this to take effect)" ON)
option(GEN_ASM "Generate assembly output to file during the build process" ON)
option(GEN_LINK_MAP "Generate linker mapping file during the build process" ON)

add_executable(rkern ${PROJECT_SOURCE_DIR}/src/kernel.cpp ${PROJECT_SOURCE_DIR}/src/boot.asm)

set_target_properties(${PROJECT_NAME} PROPERTIES OUTPUT_NAME "rkern.bin")

target_include_directories(rkern PUBLIC "${PROJECT_SOURCE_DIR}/include")

target_compile_options(rkern PUBLIC -fno-exceptions -fno-rtti -ffreestanding -fno-builtin -nostdlib -nostdinc -nostdinc++)
target_link_options(rkern PUBLIC -static -nostdlib)

if(GEN_ASM)
    # the following compiler flag is acceptable by both GCC and LLVM
    target_compile_options(rkern PUBLIC -save-temps)
endif()

if(GEN_LINK_MAP)
    # It looks like with LLVM/Clang, this flag is --Map or -M, whereas
    # with GCC/G++ it is -Map. When adding GCC compilation compatibility
    # this must be considered.
    target_link_options(rkern PRIVATE "LINKER:--Map,link.map")
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    # Clang or AppleClang
    target_compile_options(rkern PUBLIC -target riscv32-none-elf -march=rv32imac -mno-relax)
    target_link_options(rkern PUBLIC -target riscv32-none-elf)
    if(USE_LLD)
        target_link_options(rkern PUBLIC -fuse-ld=ld.lld "LINKER:--script=${PROJECT_SOURCE_DIR}/src/linker.ld")
    else()
        target_link_options(rkern PUBLIC -fuse-ld=ld "LINKER:--script=${PROJECT_SOURCE_DIR}/src/linker.ld")
    endif()
    if(STRIP_SYMBOLS)
        target_link_options(rkern PUBLIC "LINKER:--strip-all")
    endif()
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    # GCC
    target_link_options(rkern PUBLIC "LINKER:--script=${PROJECT_SOURCE_DIR}/src/linker.ld")
endif()

enable_language(ASM)
