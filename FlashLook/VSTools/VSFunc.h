//
//  VSFunc.h
//  FlashLook
//
//  Created by cr on 2024/12/29.
//


#import <Foundation/Foundation.h>

void VSNSLog(NSString *format, ...) {
#ifdef DEBUG
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);

    NSLog(@"%@", message);
#endif
}
