#if !defined(HELLO_WORLD_H)
#define HELLO_WORLD_H

#include <string>

namespace hello_world {
    std::string hello();

    std::string hello() {
        std::string value = "Hello, World!";
        return (value);
    }
}

#endif
