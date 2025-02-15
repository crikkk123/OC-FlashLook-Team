//
//  RecommendViewController.m
//  Tencent News
//
//  Created by cr on 2024/12/29.
//

#import "VSRecommendViewController.h"
#import "VSRecommendViewControllerCell.h"


@interface VSRecommendViewController ()<UIScrollViewDelegate,UIGestureRecognizerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong,readwrite) NSArray* dataArray;

@end

@implementation VSRecommendViewController

-(instancetype)init{
    self = [super init];
    if(self){
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/like"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/like_selected"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [collectionView registerClass:[VSRecommendViewControllerCell class] forCellWithReuseIdentifier:@"VSRecommendViewControllerCell"];
    
    [self.view addSubview:collectionView];
}

-(void)viewClick{
    NSLog(@"viewClick");
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionView* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"VSRecommendViewControllerCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    if([cell isKindOfClass: [VSRecommendViewControllerCell class]]) {
//        [((VSRecommendViewControllerCell*)cell) layoutWithCoverUrl:@""];
    }
    
    return cell;
}
@end
