//
//  VSVideoCoverViewCell.m
//  TencentNews
//
//  Created by cr on 2024/12/29.
//

#import "VSVideoCoverViewCell.h"
#import <AVFoundation/AVFoundation.h>

@interface VSVideoCoverViewCell()

@property(nonatomic,strong,readwrite) UIImageView* coverImageView;
@property(nonatomic,strong,readwrite) UIImageView* playButtonView;
@property(nonatomic,copy,readwrite) NSString* videoUrl;

@end

@implementation VSVideoCoverViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self) {
        [self addSubview:({
            self.coverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
            self.coverImageView;
        })];
        
        [self addSubview:({
            self.playButtonView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - 50)/2, (frame.size.height - 50)/2,50,50)];
            self.playButtonView.image = [UIImage imageNamed:@"icon.bondle/video.png"];
            self.playButtonView;
        })];
        
        UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_tapToPlay)];
    }
    return self;
}

- (void)layoutWithCoverUrl:(NSString*)videoCoverUrl videoUrl:(NSString*)videoUrl {
    self.coverImageView.image = [UIImage imageNamed:videoUrl];
    self.videoUrl = videoUrl;
}

- (void)_tapToPlay {
    NSURL* videoURL = [NSURL URLWithString:self.videoUrl];
    AVAsset* assert = [AVAsset assetWithURL:videoURL];
    
    
}
@end
