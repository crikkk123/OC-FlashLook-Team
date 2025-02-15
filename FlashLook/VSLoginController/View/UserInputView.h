//
//  UserInputView.h
//  FlashLook
//
//  Created by yupao on 2025/2/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInputView : UIView <UITextFieldDelegate>

@property(nonatomic,strong,readonly) UIButton* verifyButton;
@property(nonatomic,strong,readonly) UITextField* verifyText;
@property(nonatomic,strong,readonly) UITextField* phoneText;

@end

NS_ASSUME_NONNULL_END
