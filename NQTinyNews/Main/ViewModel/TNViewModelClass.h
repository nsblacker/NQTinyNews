//
//  TCViewModelClass.h
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/9/7.
//  Copyright © 2017年 那强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);
typedef void (^NetFailureBlock)(id errorCode);
@interface TNViewModelClass : NSObject

@property(nonatomic ,strong)ReturnValueBlock returnBlk;
@property(nonatomic ,strong)ErrorCodeBlock errorBlk;
@property(nonatomic ,strong)NetFailureBlock failureBlk;

- (void)setBlockWithReturnBlock:(ReturnValueBlock)returnBlk
                     errorBlock:(ErrorCodeBlock)errorBlk
                   failureBlock:(NetFailureBlock)failureBlk;
@end
