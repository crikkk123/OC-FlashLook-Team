//
//  VSDeleteCellView.h
//  Tencent News
//
//  Created by cr on 2024/12/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VSDeleteCellView : UIView

-(void)showDeleteViewFromPoint:(CGPoint)point clickBlock:(dispatch_block_t) clickBlock;

@end

NS_ASSUME_NONNULL_END
