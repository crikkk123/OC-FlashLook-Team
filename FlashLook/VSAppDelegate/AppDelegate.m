//
//  AppDelegate.m
//  FlashLook
//
//  Created by cr on 2024/12/29.
//

#import "AppDelegate.h"
#import "VSNewsViewController.h"
#import "VSVideoViewController.h"
#import "VSRecommendViewController.h"
#import "VSSplashView.h"
#import "LoginViewController.h"
#import "VSFunc.h"


@interface AppDelegate ()

@end


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // TabBar导航
    UITabBarController* tabbarController = [[UITabBarController alloc] init];
    tabbarController.tabBar.barTintColor = [UIColor whiteColor];
    // 新闻
    VSNewsViewController* newsViewController = [[VSNewsViewController alloc] init];
    
    // 视频
    VSVideoViewController *videoController = [[VSVideoViewController alloc] init];
    
    // 推荐
    VSRecommendViewController *recommendController = [[VSRecommendViewController alloc] init];
    
    // 我的
    UIViewController *controller4 = [[UIViewController alloc] init];
    controller4.view.backgroundColor = [UIColor lightGrayColor];
    controller4.tabBarItem.title = @"我的";
    controller4.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/home"];
    controller4.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/home_selected"];
    
    // 添加到导航栏
    [tabbarController setViewControllers:@[newsViewController,videoController,recommendController,controller4]];
    
    // TabBar导航的控制器
    UINavigationController* navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    LoginViewController *loginController = [[LoginViewController alloc] init];
    self.window.rootViewController = loginController;
    
    // 根视图
    //self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    /// 将自己的闪屏显示
    VSSplashView* splashView = [[VSSplashView alloc] initWithFrame:self.window.bounds];
    [self.window addSubview:splashView];
    
    return YES;
}


/// 外部唤起app
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    VSNSLog(@"外部唤起了app，url：%@",url);
    return YES;
}

@end
