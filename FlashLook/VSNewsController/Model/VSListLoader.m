//
//  VSListLoader.m
//  Tencent News
//
//  Created by cr on 2025/1/9.
//

#import "VSListLoader.h"
#import <AFNetworking/AFNetworking.h>
#import "VSListItemModel.h"

@implementation VSListLoader

- (void)loadListDataWithFinishBlock:(VSListLoaderFinishBlock) finishBlock {
    
//    NSArray<VSListItemModel*>* listData = [self _readDataFromLocal];
//    if(listData){
//        finishBlock(YES,listData.copy);
//    }
    
    // http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e
    __weak typeof(self) weakSelf = self;
    [[AFHTTPSessionManager manager] GET:@"http://v.juhe.cn/toutiao/index?type=top&key=97ad001bfcc2082e2eeaf798bad3d54e" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSArray* dataArray = [((NSDictionary*)[((NSDictionary*)responseObject) objectForKey:@"result"]) objectForKey:@"data"];
        NSMutableArray* listItemArray = [[NSMutableArray alloc] init];
        for(NSDictionary* info in dataArray){
            VSListItemModel* model = [[VSListItemModel alloc] init];
            [model configWithDictionart:info];
            [listItemArray addObject:model];
        }
        
//        [strongSelf _archiveListDataWithArray:listItemArray.copy];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(finishBlock) {
                finishBlock(YES,listItemArray.copy);
            }
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"");
    }];
}

- (NSArray<VSListItemModel*>*)_readDataFromLocal {
    NSArray* pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* cachePath = [pathArray firstObject];
    NSString* dataPath = [cachePath stringByAppendingPathComponent:@"VSData/list"];
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSData* readListData = [fileManager contentsAtPath:dataPath];
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSSet setWithObjects:[NSArray class],[VSListItemModel class], nil] fromData:readListData error:nil];
//    
//    if([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0){
//        return (NSArray<VSListItemModel*>*)unarchiveObj;
//    }
    return nil;
}

-(void) _archiveListDataWithArray:(NSArray<VSListItemModel*>*)array {
    NSArray* pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString* cachePath = [pathArray firstObject];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSString* dataPath = [cachePath stringByAppendingPathComponent:@"VSData"];
    
    NSError* createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&createError];
    
    NSString* listDataPath = [dataPath stringByAppendingPathComponent:@"list"];
    NSData* listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:listDataPath contents:listData attributes:nil];
    
    NSData* readListData = [fileManager contentsAtPath:listDataPath];
    
    [[NSUserDefaults standardUserDefaults] setObject:listData forKey:@"listData"];
    
    NSData* testListData = [[NSUserDefaults standardUserDefaults] dataForKey:@"listData"];
    
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClass:[NSSet setWithObjects:[NSArray class],[VSListItemModel class], nil] fromData:testListData error:nil];
}

@end
