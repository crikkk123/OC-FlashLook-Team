//
//  VSMediator.h
//  FlashLook
//
//  Created by cr on 2024/12/29.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol VSDetailViewControllerProtocol <NSObject>

- (__kindof UIViewController*) detailViewControllerWithUrl:(NSString*)detailUrl;

@end

NS_ASSUME_NONNULL_BEGIN

/// 用于解耦新闻页的跳转
@interface VSMediator : NSObject

/// target action
/// 利用runtime和反射解偶
/// 缺点：字符串硬编码、传递参数限制
+ (__kindof UIViewController*)detailViewControllerWithUrl:(NSString*) urlString;


/// url scheme
/// 缺点：传递参数是通过字典 调用方不知道传什么值，需求看注册
typedef void(^VSMediatorProcessBlock)(NSDictionary* params);
+ (void)registerScheme:(NSString*)scheme processBlock:(VSMediatorProcessBlock)processBlock;
+ (void)openUrl:(NSString*)url params:(NSDictionary*)params;


// protocol class
+ (void)registerProtocol:(Protocol*) proto class:(Class)cls;
+ (Class)classForProtocol:(Protocol*) proto;

@end

NS_ASSUME_NONNULL_END
