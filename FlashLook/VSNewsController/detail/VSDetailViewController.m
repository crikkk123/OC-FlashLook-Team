//
//  VSDetailViewController.m
//  Tencent News
//
//  Created by cr on 2024/12/30.
//

#import "VSDetailViewController.h"
#import <WebKit/WebKit.h>
#import "VSMediator.h"

@interface VSDetailViewController ()<WKNavigationDelegate,VSDetailViewControllerProtocol>

@property(nonatomic,strong,readwrite) WKWebView* webView;
@property(nonatomic,strong,readwrite) UIProgressView* progressView;
@property(nonatomic,copy,readwrite) NSString* articleUrlString;
@end

@implementation VSDetailViewController

+ (void)load {
//    [VSMediator registerScheme:@"detail://" processBlock:^(NSDictionary * _Nonnull params) {
//        NSString* url = (NSString*)[params objectForKey:@"url"];
//        UINavigationController* navigationController = (UINavigationController*)[params objectForKey:@"controller"];
//        VSDetailViewController* controller = [[VSDetailViewController alloc] initWithUrlString:url];
//        [navigationController pushViewController:controller animated:YES];
//    }];
    [VSMediator registerProtocol:@protocol(VSDetailViewControllerProtocol) class:[self class]];
}

-(void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (instancetype)initWithUrlString:(NSString*)urlString {
    self = [super init];
    if(self){
        self.articleUrlString = urlString;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:({
        self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height - 88)];
        self.webView.navigationDelegate = self;
        self.webView;
    })];
    
    [self.view addSubview:({
        self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
        self.progressView;
    })];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.articleUrlString]]];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context: nil];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(WK_SWIFT_UI_ACTOR void (^)(WKNavigationActionPolicy))decisionHandler {
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"didFinishNavigation");
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context {
    self.progressView.progress = self.webView.estimatedProgress;
}

@end
