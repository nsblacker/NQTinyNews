//
//  HomePageVC.m
//  NQTinyNews
//
//  Created by 那强 on 2017/5/26.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "HomePageVC.h"
#import "ZJScrollPageView.h"
#import "TNTableFlowVC.h"

@interface HomePageVC ()<ZJScrollPageViewDelegate>
@property(nonatomic, strong)NSArray<NSString *>*titles;
@property(nonatomic, strong)NSArray<NSString *>*types;
@property(nonatomic, strong)ZJScrollPageView *segmentV;
//@property(nonatomic, strong)
@end

@implementation HomePageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    self.automaticallyAdjustsScrollViewInsets = NO;

    [self dataInitialty];
    
    [self setupUI];
    
}

#pragma -mark UI
- (void)setupUI{
    
    [self.view addSubview:self.segmentV];
}

- (ZJScrollPageView*)segmentV{
    
    if(!_segmentV){
        
        ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
        style.showCover = YES;
        style.segmentViewBounces = NO;
        style.gradualChangeTitleColor = YES;
        style.showExtraButton = NO;
        style.extraBtnBackgroundImageName = @"extraBtnBackgroundImage";
        style.segmentHeight = 30;
        style.autoAdjustTitlesWidth = YES;
        
        CGRect segmentViewFrame = CGRectMake(0, 64.0, self.view.bounds.size.width, self.view.bounds.size.height - 64.0);
        //初始化
        _segmentV = [[ZJScrollPageView alloc]initWithFrame:segmentViewFrame segmentStyle:style titles:_titles parentViewController:self delegate:self];
    }
    return _segmentV;
}

#pragma -mark Data
- (void)dataInitialty{
    //top(头条，默认),shehui(社会),guonei(国内),guoji(国际),yule(娱乐),tiyu(体育)junshi(军事),keji(科技),caijing(财经),shishang(时尚
    _titles =  @[
                    @"头条",
                    @"社会",
                    @"国内",
                    @"国际",
                    @"娱乐",
                    @"体育",
                    @"军事",
                    @"科技",
                    @"财经",
                    @"时尚"
                ];
        ;
    _types = @[
               @"top",
               @"shehui",
               @"guonei",
               @"guoji",
               @"yule",
               @"tiyu",
               @"junshi",
               @"keji",
               @"caijing",
               @"shishang"
            ];
}

#pragma -mark Sender Action


#pragma -mark ZJPageScrollPageDelagate
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}

- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index {
    
    //Table Flow Style
    TNTableFlowVC *childVc = (TNTableFlowVC *)reuseViewController;
    if (childVc == nil) {
        
        childVc = [[TNTableFlowVC alloc]init];
    }
    childVc.newsType = _types[index];
    return childVc;
}


#pragma -mark Override
/**
 * 按照这个库的要求，如果不想使用ZJScrollPageViewChildVcDelegate来控制生命周期，需要在parentViewController Override这个方法,且返回NO
 *
 */
-(BOOL)shouldAutomaticallyForwardAppearanceMethods{
    
    return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
