//
//  NormalTableViewCell.m
//  Tencent News
//
//  Created by cr on 2024/12/29.
//

#import "VSNormalTableViewCell.h"
#import "VSListItemModel.h"
#import <SDWebImage/SDWebImage.h>

@interface VSNormalTableViewCell()

@property(nonatomic,strong,readwrite) UILabel* titleLabel;  // 标题
@property(nonatomic,strong,readwrite) UILabel* sourceLabel; // 来源
@property(nonatomic,strong,readwrite) UILabel* commentLabel; // 评论
@property(nonatomic,strong,readwrite) UILabel* timeLabel;  // 时间

@property(nonatomic,strong,readwrite) UIImageView* rightImageView;  // 右侧的图片
@property(nonatomic,strong,readwrite) UIButton* deleteButton;       // 删除按钮

@end


@implementation VSNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if(self){
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 270, 50)];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel.numberOfLines = 2;
            self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 50, 20)];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor grayColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 50, 20)];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor grayColor];
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 70, 50, 20)];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor grayColor];
            self.timeLabel;
        })];
        
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 100, 70)];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView;
        })];
        
//        [self.contentView addSubview:({
//            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(290, 80, 30, 20)];
//            [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
//            [self.deleteButton setTitle:@"V" forState:UIControlStateHighlighted];
//            [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchDragInside];
//            self.deleteButton.layer.cornerRadius = 10;
//            self.deleteButton.layer.masksToBounds = YES;
//            self.deleteButton.layer.borderColor = [UIColor whiteColor].CGColor;
//            self.deleteButton.backgroundColor = [UIColor grayColor];
//            self.deleteButton.layer.borderWidth = 2;
//            self.deleteButton;
//        })];
    }
    return self;
}

-(void)layoutTableViewCellWithItem:(VSListItemModel*) listItemModel {
    BOOL hasRead = [[NSUserDefaults standardUserDefaults] boolForKey:listItemModel.uniqueKey];
    if(hasRead){
        self.titleLabel.textColor = [UIColor lightGrayColor];
    } else {
        self.titleLabel.textColor = [UIColor blackColor];
    }
    
    self.titleLabel.text = listItemModel.title;
    
    self.sourceLabel.text = listItemModel.authorName;
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = listItemModel.category;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = listItemModel.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    
    
    [self.rightImageView sd_setImageWithURL:[NSURL URLWithString:listItemModel.picUrl]];
}

-(void)deleteButtonClick{
    if(self.deletegate && [self.deletegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]){
        [self.deletegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}

@end
