//
//  TNWebviewVC.m
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/9/8.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TNWebviewVC.h"
#import <WebKit/WebKit.h>

@interface TNWebviewVC ()<WKUIDelegate,WKNavigationDelegate>

@end

@implementation TNWebviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebView *webview = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]]];
    [self.view addSubview:webview];
}

#pragma -mark WKWebview Delegate


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
