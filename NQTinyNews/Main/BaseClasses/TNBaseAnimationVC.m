//
//  TNBaseAnimationVC.m
//  NQTinyNews
//
//  Created by 那强 on 2018/1/20.
//  Copyright © 2018年 那强. All rights reserved.
//

#import "TNBaseAnimationVC.h"

@interface TNBaseAnimationVC ()<UIViewControllerAnimatedTransitioning ,UIGestureRecognizerDelegate>

@end

@implementation TNBaseAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.delegate = self;
    
    
    //1.获取系统interactivePopGestureRecognizer对象的target对象
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    //2.创建滑动手势，taregt设置interactivePopGestureRecognizer的target，所以当界面滑动的时候就会自动调用target的action方法。
    //handleNavigationTransition是私有类_UINavigationInteractiveTransition的方法，系统主要在这个方法里面实现动画的。
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:target action:NSSelectorFromString(@"handleNavigationTransition:")];
    //3.设置代理
    pan.delegate = self;
    //4.添加到导航控制器的视图上
    [self.navigationController.view addGestureRecognizer:pan];
    
    //5.禁用系统的滑动手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;

}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count <= 1)
    {
        return NO;
    }
    
    return YES;
}


//push&pop animation

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    // 这里返回当前控制器，所以要在当前控制器实现动画
    // 仔细看返回值类型，要求返回值必须实现(id<UIViewControllerAnimatedTransitioning>)
    // 也就是当前控制器要实现这个代理才有效
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.15;
}

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // 1.从哪里来的控制器，这里是当前控制器
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    // 2.要去哪里的控制器，这是是UIViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 2.1不透明咯
    toViewController.view.alpha = 0;
    
#warning 没事，就是建议你打断点看一下控制器类型
    
    // 3.这个view是包含视图，怎么说呢，几个控制器的view做的动画都是在这里面操作的，看我文章图
    UIView *containerView = [transitionContext containerView];
    // 3.1要显示必须添加到里面哦
    [containerView addSubview:toViewController.view];
    
    // 4.动画效果
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
        // 用了淡入
        toViewController.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        // 移除从哪里来的控制器的view
        [fromViewController.view removeFromSuperview];
        // 必须一定肯定要调用，用来告诉上下文说已经结束动画了
        [transitionContext completeTransition:YES];
    }];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
