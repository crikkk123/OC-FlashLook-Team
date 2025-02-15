//
//  VSListItemModel.h
//  Tencent News
//
//  Created by Caorui(曹锐)[运营中心] on 2025/1/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 列表结构化数据
@interface VSListItemModel : NSObject<NSCoding,NSCopying,NSSecureCoding>

@property(nonatomic,copy,readwrite) NSString* category;
@property(nonatomic,copy,readwrite) NSString* picUrl;
@property(nonatomic,copy,readwrite) NSString* uniqueKey;
@property(nonatomic,copy,readwrite) NSString* title;
@property(nonatomic,copy,readwrite) NSString* date;
@property(nonatomic,copy,readwrite) NSString* authorName;
@property(nonatomic,copy,readwrite) NSString* articleUrl;

- (void)configWithDictionart:(NSDictionary*) dictionary;

@end

NS_ASSUME_NONNULL_END
