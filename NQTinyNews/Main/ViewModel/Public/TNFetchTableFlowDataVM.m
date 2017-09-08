//
//  TNFetchDataVM.m
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/9/7.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TNFetchTableFlowDataVM.h"
#import "TNNetworkManager.h"
#import "TNWebviewVC.h"

@implementation TNFetchTableFlowDataVM

-(void)fetchDataWithNewsType:(NSString*)type{
    WeakSelf(weakSelf);
    [[TNNetworkManager sharedInstance]requestNewsWithType:type success:^(id response) {
        
        id result = [response valueForKey:@"result"];
        if(result && [result isKindOfClass:[NSDictionary class]]){
            [weakSelf fetchNewsDataSuccessWithDic:result];
        }
        
    } failure:^(NSError *error) {
        self.failureBlk(error);
    }];
}

- (void)fetchNewsDataSuccessWithDic:(NSDictionary*)resultDic {
    NSArray *data = resultDic[@"data"];
    NSMutableArray *datas = [[NSMutableArray alloc]initWithCapacity:data.count];
    for(int i = 0 ; i < data.count ;i++){
        NSError *err;
        TNHomeNewsModel *model = [[TNHomeNewsModel alloc]initWithDictionary:data[i] error:&err];
        if(!err){
            [datas addObject:model];
        }else{
            self.errorBlk(err);
            return;
        }
    }
    self.returnBlk(datas);
}

- (void)tinynewsDetailWithModel:(TNHomeNewsModel*)model
            topViewController:(UIViewController*)topViewController{
    TNWebviewVC *newDetailView = [[TNWebviewVC alloc]init];
    newDetailView.urlStr = model.url;
    [topViewController.navigationController pushViewController:newDetailView animated:YES];
}
@end
