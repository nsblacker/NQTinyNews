//
//  TCViewModelClass.m
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/9/7.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TNViewModelClass.h"

@implementation TNViewModelClass

- (void)setBlockWithReturnBlock:(ReturnValueBlock)returnBlk errorBlock:(ErrorCodeBlock)errorBlk failureBlock:(NetFailureBlock)failureBlk{
    _returnBlk = returnBlk;
    _errorBlk = errorBlk;
    _failureBlk = failureBlk;
}
@end
