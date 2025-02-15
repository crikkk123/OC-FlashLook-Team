//
//  VSListLoader.h
//  Tencent News
//
//  Created by cr on 2025/1/9.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@class VSListItemModel;
typedef void (^VSListLoaderFinishBlock)(BOOL isSucess, NSArray<VSListItemModel*>* dataArray);

// 列表请求
@interface VSListLoader : NSObject

- (void)loadListDataWithFinishBlock:(VSListLoaderFinishBlock) finishBlock;

@end

NS_ASSUME_NONNULL_END
