//
//  VSSplashView.m
//  FlashLook
//
//  Created by cr on 2024/12/29.
//

#import "VSSplashView.h"
#import "VSDefine.h"

@interface VSSplashView()

@property(nonatomic,strong) UIButton* button;
@property (nonatomic, assign) NSInteger remainingSeconds;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation VSSplashView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        self.image = [UIImage imageNamed:@"icon.bundle/splash"];   /// 放闪屏图片
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self _addButtonUI];
            [self _setButtonTime];
        });
        self.userInteractionEnabled = YES;
    }
    return self;
}

///
- (void)_removeSplashView {
    [self removeFromSuperview];
}

- (void)_addButtonUI {
    [self addSubview:({
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 60, 50,30)];
        self.button.backgroundColor = [UIColor lightGrayColor];
        [self.button setTitle:@"跳过3" forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(_removeSplashView) forControlEvents:UIControlEventTouchUpInside];
        self.button;
    })];
}

- (void)_setButtonTime{
    self.remainingSeconds = 3;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                   target:self
                                                 selector:@selector(updateButtonTitle)
                                                 userInfo:nil
                                                  repeats:YES];
}

- (void)updateButtonTitle {
    if (self.remainingSeconds > 0) {
        [self.button setTitle:[NSString stringWithFormat:@"跳过%ld", (long)self.remainingSeconds] forState:UIControlStateNormal];
        self.remainingSeconds--;
    } else {
        [self.timer invalidate];
        self.timer = nil;
        [self _removeSplashView];
    }
}

@end
