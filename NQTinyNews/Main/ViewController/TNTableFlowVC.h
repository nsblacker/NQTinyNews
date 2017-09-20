//
//  TNTableFlowVC.h
//  NQTinyNews
//
//  Created by 那强 on 2017/5/27.
//  Copyright © 2017年 那强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJScrollPageView.h"

@interface TNTableFlowVC : TNBaseVC<ZJScrollPageViewChildVcDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, copy)NSString *newsType;

@end
