//
//  TNFeedPageVC.m
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/10/23.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TNFeedPageVC.h"

@interface TNFeedPageVC ()

@end

@implementation TNFeedPageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CALayer *myLayer = [[CALayer alloc]init];
    myLayer.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight/2);
    myLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.view.layer addSublayer:myLayer];
    
    UIImage *image = [UIImage imageNamed:@"image_face"];
    myLayer.contents = (__bridge id) image.CGImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
