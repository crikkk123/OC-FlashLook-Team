//
//  UserInputView.m
//  FlashLook
//
//  Created by yupao on 2025/2/11.
//

#import "UserInputView.h"
#import <Masonry/Masonry.h>

@interface UserInputView()
@property(nonatomic,strong)UIImageView* phoneIcon;
@property(nonatomic,strong)UIImageView* verifyIcon;
@property(nonatomic, strong)UIView *phoneBottomLineView;
@property(nonatomic, strong)UIView *verifyBottomLineView;

@property(nonatomic,strong,readwrite) UIButton* verifyButton;
@property(nonatomic,strong,readwrite) UITextField* verifyText;
@property(nonatomic,strong,readwrite) UITextField* phoneText;
@end

@implementation UserInputView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    //Phone UI
    self.phoneIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Login.phone"]];
    self.phoneIcon.contentMode = UIViewContentModeScaleToFill;
    
    self.phoneText = [[UITextField alloc] init];
    self.phoneText.placeholder = @"请输入手机号";
    self.phoneText.keyboardType = UIKeyboardTypePhonePad;
    self.phoneText.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneText.font = [UIFont systemFontOfSize:21];
    self.phoneText.delegate = self;
    
    self.phoneBottomLineView = [[UIView alloc] init];
    self.phoneBottomLineView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    
    [self addSubview:self.phoneIcon];
    [self addSubview:self.phoneText];
    [self addSubview:self.phoneBottomLineView];
    
    //Verify UI
    self.verifyIcon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Login.verify"]];
    self.verifyIcon.contentMode = UIViewContentModeScaleToFill;
    
    self.verifyText = [[UITextField alloc] init];
    self.verifyText.placeholder = @"请输入验证码";
    self.verifyText.keyboardType = UIKeyboardTypePhonePad;
    self.verifyText.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.verifyText.font = [UIFont systemFontOfSize:21];
    self.verifyText.delegate = self;
    
    self.verifyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.verifyButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.verifyButton.titleLabel.font = [UIFont systemFontOfSize:18];
    self.verifyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.verifyButton setTitleColor:[UIColor colorWithRed:50/255.0 green:150/255.0 blue:254/255.0 alpha:0.8] forState:UIControlStateNormal];
    [self.verifyButton setTitleColor:[UIColor colorWithRed:1/255.0 green:150/255.0 blue:254/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    
    self.verifyBottomLineView = [[UIView alloc] init];
    self.verifyBottomLineView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.5];
    
    [self addSubview:self.verifyIcon];
    [self addSubview:self.verifyText];
    [self addSubview:self.verifyButton];
    [self addSubview:self.verifyBottomLineView];
    
    [self setUpLayout];
}

-(void)setUpLayout{
    
    [self.phoneIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self).inset(40);
        make.height.width.equalTo(@30);
    }];
    
    [self.phoneText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self.phoneIcon.mas_right).offset(10);
        make.right.equalTo(self).inset(40);
        make.height.equalTo(@30);
    }];
    
    [self.phoneBottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneText.mas_bottom).offset(5);
        make.left.right.equalTo(self).inset(40);
        make.height.equalTo(@1.5);
    }];
    
    [self.verifyIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneBottomLineView.mas_bottom).offset(30);
        make.left.equalTo(self).inset(40);
        make.height.width.equalTo(@30);
    }];
    
    [self.verifyText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneBottomLineView.mas_bottom).offset(30);
        make.left.equalTo(self.verifyIcon.mas_right).offset(10);
        make.right.equalTo(self.verifyButton.mas_left).offset(-10);
        make.height.equalTo(@30);
    }];
    
    [self.verifyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneBottomLineView.mas_bottom).offset(30);
        make.right.equalTo(self).inset(40);
        make.height.equalTo(@30);
        make.width.equalTo(@140);
    }];
    
    [self.verifyBottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.verifyText.mas_bottom).offset(5);
        make.left.right.equalTo(self).inset(40);
        make.height.equalTo(@1.5);
    }];
        
}
@end
