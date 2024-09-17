#include <iostream>
#include "duktape.h"

int main() {
    // Create a new Duktape heap
    duk_context *ctx = duk_create_heap_default();
    
    if (!ctx) {
        std::cerr << "Failed to create Duktape context." << std::endl;
        return 1;
    }
    
    // JavaScript code to evaluate
    const char* js_code = "var x = 10; var y = 20; x + y;";
    
    // Evaluate the JavaScript code
    if (duk_peval_string(ctx, js_code) != 0) {
        std::cerr << "Error: " << duk_safe_to_string(ctx, -1) << std::endl;
    } else {
        std::cout << "Result of Duktape evaluation: " << duk_get_int(ctx, -1) << std::endl;
    }
    
    // Clean up Duktape context
    duk_destroy_heap(ctx);
    
    return 0;
}