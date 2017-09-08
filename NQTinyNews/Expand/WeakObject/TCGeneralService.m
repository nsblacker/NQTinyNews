//
//  TCGeneralService.m
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/8/15.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TCGeneralService.h"
#import "TCWeakObject.h"

@interface TCGeneralService()
@property(nonatomic ,strong)NSMutableSet *delegates;
@end



@implementation TCGeneralService

+ (instancetype)sharedInstance{
    static TCGeneralService *serviceInstance;
    dispatch_once_t * _Nonnull predicate = NULL;
    dispatch_once(predicate, ^{
        serviceInstance = [[TCGeneralService alloc]init];
    });
    return serviceInstance;
}
- (instancetype)init{
    if(self = [super init]){
        _delegates = [[NSMutableSet alloc]init];
    }
    return self;
}

- (void)registerDelegate:(id<TCServieDelegate>)delegate{
    if([delegate conformsToProtocol:@protocol(TCServieDelegate)]){
        [self.delegates addObject:[TCWeakObject weakobjectWithObj:delegate]];
    }
}

- (void)removeDelegate:(id<TCServieDelegate>)delegate{
    if([delegate conformsToProtocol:@protocol(TCServieDelegate)]){
        [self.delegates removeObject:[TCWeakObject weakobjectWithObj:delegate]];
    }
}


@end
