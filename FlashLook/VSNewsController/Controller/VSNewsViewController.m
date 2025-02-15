#import "VSNewsViewController.h"
#import "VSNormalTableViewCell.h"
#import "VSMediator.h"
#import "VSDeleteCellView.h"
#import "VSListLoader.h"
#import "VSListItemModel.h"

@interface VSNewsViewController ()<UITableViewDataSource,UITableViewDelegate,VSNormalTableViewCellDelegate>

@property(nonatomic,strong,readwrite) UITableView* tableView;
@property(nonatomic,strong,readwrite) NSArray* dataArray;
@property(nonatomic,strong,readwrite) VSListLoader* listLoader;
@end

@implementation VSNewsViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/page"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/page_selected"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview: self.tableView];
    
    
    __weak typeof(self) wself = self;
    self.listLoader = [[VSListLoader alloc] init];
    [self.listLoader loadListDataWithFinishBlock:^(BOOL isSucess, NSArray<VSListItemModel *> * _Nonnull dataArray) {
        __strong typeof (wself) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    VSNormalTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell){
        cell = [[VSNormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.deletegate = self;
    }
    // 展示标题、来源、时间、右侧图片
    [cell layoutTableViewCellWithItem:self.dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    VSListItemModel* itemModel = self.dataArray[indexPath.row];
    
    /// 1、
//    UIViewController *controller = [VSMediator detailViewControllerWithUrl:itemModel.articleUrl];
//    controller.title = [NSString stringWithFormat:@"%@",@(indexPath.row)];
//    [self.navigationController pushViewController:controller animated:YES];
    
    
    /// 2、
//    [VSMediator openUrl:@"detail://" params:@{@"url":itemModel.articleUrl,@"controller":self.navigationController}];
    
    // 3、
    Class cls = [VSMediator classForProtocol:@protocol(VSDetailViewControllerProtocol)];
    [self.navigationController pushViewController:[[cls alloc] detailViewControllerWithUrl:itemModel.articleUrl] animated:YES];
    
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:itemModel.uniqueKey];
}

- (void)tableViewCell:(UITableViewCell*)tableViewCell clickDeleteButton:(UIButton*)deleteButton{
//    VSDeleteCellView* deleteView = [[VSDeleteCellView alloc] initWithFrame:self.view.bounds];
//    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
//    
//    __weak typeof(self) wself = self;
//    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
//        __strong typeof (wself) strongSelf = wself;
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
}

@end
