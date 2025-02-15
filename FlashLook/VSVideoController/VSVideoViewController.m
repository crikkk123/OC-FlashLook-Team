//
//  VideoViewController.m
//  Tencent News
//
//  Created by cr on 2024/12/29.
//

#import "VSVideoViewController.h"
#import "VSVideoCoverViewCell.h"

@interface VSVideoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation VSVideoViewController

-(instancetype)init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"视频";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/video"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/video_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 10;
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 10)/2, 300);
    
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [collectionView registerClass:[VSVideoCoverViewCell class] forCellWithReuseIdentifier:@"VSVideoCoverViewCell"];
    
    [self.view addSubview:collectionView];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 200;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionView* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VSVideoCoverViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    if([cell isKindOfClass: [VSVideoCoverViewCell class]]) {
        // http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
        [((VSVideoCoverViewCell*)cell) layoutWithCoverUrl:@"icon.bundle/videoCover@3x.png" videoUrl:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"];
    }
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((self.view.frame.size.width-10)/2, 300);
}
@end
