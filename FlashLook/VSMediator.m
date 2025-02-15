//
//  VSMediator.m
//  FlashLook
//
//  Created by cr on 2024/12/29.
//

#import "VSMediator.h"
#import "VSDetailViewController.h"

@implementation VSMediator

+ (__kindof UIViewController*)detailViewControllerWithUrl:(NSString*) urlString; {
    Class detailClass = NSClassFromString(@"VSDetailViewController");
    
    UIViewController *controller = [[detailClass alloc] performSelector:NSSelectorFromString(@"initWithUrlString:") withObject:urlString];
    
    return controller;
}


+ (NSMutableDictionary*)mediatorCache {
    static NSMutableDictionary* cache;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = @{}.mutableCopy;
    });
    return cache;
}


+ (void)registerScheme:(NSString*)scheme processBlock:(VSMediatorProcessBlock)processBlock {
    if(scheme && processBlock) {
        [[[self class] mediatorCache] setObject:processBlock forKey:scheme];
    }
}
+ (void)openUrl:(NSString*)url params:(NSDictionary*)params {
    VSMediatorProcessBlock block = [[[self class] mediatorCache] objectForKey:url];
    if(block) {
        block(params);
    }
}

// protocol class
+ (void)registerProtocol:(Protocol*) proto class:(Class)cls {
    if(proto && cls){
        [[[self class] mediatorCache] setObject:cls forKey:NSStringFromProtocol(proto)];
    }
}
+ (Class)classForProtocol:(Protocol*) proto {
    return [[[self class] mediatorCache] objectForKey:NSStringFromProtocol(proto)];
}

@end
