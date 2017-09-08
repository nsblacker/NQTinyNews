//
//  TNFetchDataVM.h
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/9/7.
//  Copyright © 2017年 那强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TNHomeNewsModel.h"

@interface TNFetchTableFlowDataVM : TNViewModelClass
-(void)fetchDataWithNewsType:(NSString*)type;

- (void)tinynewsDetailWithModel:(TNHomeNewsModel*)model topViewController:(UIViewController*)topViewController;
@end
