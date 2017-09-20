//
//  TNBaseVC.m
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/6/19.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TNBaseVC.h"

@interface TNBaseVC ()

@end

@implementation TNBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureViews];
    [self setLeftItem:@"返回"];
}

- (void)setLeftItem:(id)left
{
    [self setLeftItem:left responeSEL:nil];
}
- (void)setLeftItem:(id)left responeSEL:(SEL)action
{
    [self removeLeftItem];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    SEL sel;
    if(action)
    {
        sel = action;
    }
    else
    {
        sel = @selector(leftSEL);
    }
    [leftButton addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    leftButton.frame = CGRectMake(0, 0, 40, 40);
    if ([left isKindOfClass:[NSString class]]) {
        CGSize size = [(NSString *)left sizeWithAttributes:@{@"NSFontAttributeName" : @"16"}];
        leftButton.frame = CGRectMake(0, 0, size.width <= 10 ? 70 : size.width + 10, 44);
        [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        leftButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [leftButton setTitle:(NSString *)left forState:UIControlStateNormal];
        leftButton.titleLabel.textAlignment = NSTextAlignmentRight;
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
        negativeSpacer.width = -5;
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItems = @[negativeSpacer,leftItem];
        
    }
    else if([left isKindOfClass:[UIImage class]])
    {
        UIImage *image = (UIImage *)left;
        leftButton.frame = CGRectMake(0, 0, image.size.width/3, image.size.height/3);
        //        NSLog(@"leftButton.frame == %@",NSStringFromCGRect(leftButton.frame));
        [leftButton setImage:image forState:UIControlStateNormal];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
        self.navigationItem.leftBarButtonItem = leftItem;
        [leftButton setImage:(UIImage *)left forState:UIControlStateNormal];
        //[leftButton setBackgroundColor:[UIColor redColor]];
    }
    
}
- (void)setRightItem:(id)right
{
    
}
- (void)setRightItem:(id)right responeSEL:(SEL)action
{
    [self removeRightItem];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    SEL sel;
    if(action)
    {
        sel = action;
    }
    else
    {
        sel = @selector(rightSEL);
    }
    [rightButton addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    rightButton.frame = CGRectMake(0, 0, 40, 40);
    if ([right isKindOfClass:[NSString class]]) {
        //! 这里需要根据内容大小来调整宽度
        CGSize size = [(NSString *)right sizeWithAttributes:@{@"NSFontAttributeName" : @"16"}];
        rightButton.frame = CGRectMake(0, 0, size.width <= 10 ? 70 : size.width + 10, 44);
        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        rightButton.titleLabel.font = [UIFont systemFontOfSize:15.0];
        [rightButton setTitle:(NSString *)right forState:UIControlStateNormal];
        rightButton.titleLabel.textAlignment = NSTextAlignmentRight;
        UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                           initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                           target:nil action:nil];
        negativeSpacer.width = -5;
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItems = @[negativeSpacer, rightItem];
    }
    else if([right isKindOfClass:[UIImage class]])
    {
        
        UIImage *image = (UIImage *)right;
        [rightButton setImageEdgeInsets:UIEdgeInsetsMake(10, 20, 10, 0)];
        [rightButton setImage:image forState:UIControlStateNormal];
        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
        self.navigationItem.rightBarButtonItem = rightItem;
        [rightButton setImage:image forState:UIControlStateNormal];
    }
}
- (void)removeLeftItem
{
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.leftBarButtonItems = nil;
}

- (void)removeRightItem
{
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItems = nil;
}

- (void)leftSEL
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightSEL
{
    
}
- (void)doNothing
{
    
}


#pragma mark - ThemeManager
- (void)configureViews
{
//    [self.navigationController.navigationBar setBackgroundImage:[TCTools imageWithColor:Theme_Navbar_BGColor] forBarMetrics:0];
//    [[UIApplication sharedApplication] setStatusBarStyle:Theme_StatusBar_Style];
//    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:NotoRegular56, NSFontAttributeName,Theme_Label_TextColor(TMLabelNavTitle), NSForegroundColorAttributeName,nil]];
//    [self.view setBackgroundColor:Theme_View_BGColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    //    self.navigationController.hidesBarsOnSwipe = YES;
    //    self.tabBarController.hidesBottomBarWhenPushed = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
