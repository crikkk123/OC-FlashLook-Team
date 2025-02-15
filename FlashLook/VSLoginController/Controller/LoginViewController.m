//
//  LoginViewController.m
//  FlashLook
//
//  Created by Mac on 2025/2/12.
//

#import "LoginViewController.h"
#import "UserInputView.h"
@interface LoginViewController ()
@property(nonatomic,strong) UserInputView *userInputView;

@end

@implementation LoginViewController
- (instancetype)init{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userInputView = [[UserInputView alloc]initWithFrame:CGRectMake(0, 180, 375, 200)];
    [self.view addSubview:self.userInputView];
    
}



@end
