//
//  NormalTableViewCell.h
//  Tencent News
//
//  Created by cr on 2024/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol VSNormalTableViewCellDelegate <NSObject>

-(void)tableViewCell:(UITableViewCell*)tableViewCell clickDeleteButton:(UIButton*)deleteButton;

@end

@class VSListItemModel;

@interface VSNormalTableViewCell : UITableViewCell

@property(nonatomic,weak,readwrite)id<VSNormalTableViewCellDelegate> deletegate;

-(void)layoutTableViewCellWithItem:(VSListItemModel*) listItemModel;

@end

NS_ASSUME_NONNULL_END
