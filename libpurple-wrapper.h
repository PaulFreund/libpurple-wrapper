#pragma once

#ifdef _WIN32
    #ifdef LIBPURPLE_WRAPPER_EXPORTS
        #define LIBPURPLE_WRAPPER_API extern "C" __declspec(dllexport)
    #else
        #define LIBPURPLE_WRAPPER_API extern "C" __declspec(dllimport)
    #endif
#endif


LIBPURPLE_WRAPPER_API int TestFunction();
