//
//  TNWebviewVC.m
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/9/8.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TNWebviewVC.h"
#import <WebKit/WebKit.h>
#import <Masonry.h>

@interface TNWebviewVC ()<WKUIDelegate,WKNavigationDelegate>
@property(nonatomic ,strong)WKWebView *webView;
@property(nonatomic ,strong)UIProgressView *progressView;
@end

@implementation TNWebviewVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view addSubview:self.webView];
    [self.view addSubview:self.progressView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]]];
}

- (void)leftSEL{
    if(_webView.canGoBack){
        [_webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma -mark -lazy UI
-(WKWebView*)webView{
    if(!_webView){
        _webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _webView;
}

-(UIProgressView*)progressView{
    if(!_progressView){
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0 , 0, ScreenWidth, 0)];
        self.progressView.tintColor = [UIColor redColor];
        self.progressView.trackTintColor = [UIColor whiteColor];
    }
    return _progressView;
}

#pragma -mark KVO
// 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        if (newprogress == 1) {
            self.progressView.hidden = YES;
            [self.progressView setProgress:0 animated:NO];
        }else {
            self.progressView.hidden = NO;
            [self.progressView setProgress:newprogress animated:YES];
        }
    }
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
