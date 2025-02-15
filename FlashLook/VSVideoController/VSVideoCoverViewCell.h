//
//  VSVideoCoverViewCell.h
//  TencentNews
//
//  Created by cr on 2024/12/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VSVideoCoverViewCell : UICollectionViewCell

- (void)layoutWithCoverUrl:(NSString*)videoCoverUrl videoUrl:(NSString*)videoUrl;

@end

NS_ASSUME_NONNULL_END
