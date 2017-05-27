//
//  TNRootVC.m
//  NQTinyNews
//
//  Created by 那强 on 2017/5/26.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TNRootVC.h"
#import "HomePageVC.h"

@interface TNRootVC ()

@end

@implementation TNRootVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupBaseVC];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setupBaseVC{

    HomePageVC *homePageVC = [[HomePageVC alloc]init];
    homePageVC.title = @"home";
    homePageVC.view.backgroundColor = [UIColor redColor];
    UINavigationController *homePageNVC = [[UINavigationController alloc]initWithRootViewController:homePageVC];
    
    UIViewController *tmpVC1 = [[UIViewController alloc]init];
    tmpVC1.title = @"tmp1";
    UINavigationController *tmpNVC1 = [[UINavigationController alloc]initWithRootViewController:tmpVC1];
    
    UIViewController *tmpVC2 = [[UIViewController alloc]init];
    tmpVC2.title = @"tmp2";
    UINavigationController *tmpNVC2 = [[UINavigationController alloc]initWithRootViewController:tmpVC2];
    
    UIViewController *tmpVC3 = [[UIViewController alloc]init];
    UINavigationController *tmpNVC3 = [[UINavigationController alloc]initWithRootViewController:tmpVC3];
    tmpVC3.title = @"tmp3";
    
    [self setViewControllers:@[homePageNVC,tmpNVC1,tmpNVC2,tmpNVC3]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
