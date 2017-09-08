//
//  TNNetworkManager.h
//  NQTinyNews
//
//  Created by 那强 on 2017/5/19.
//  Copyright © 2017年 那强. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger,HttpRequestMethod){
    
    HttpRequestMethod_GET = 0,
    HttpRequestMethod_POST,
};

typedef void (^AFNSuccessBlk_t)(id response);

typedef void (^AFNFailureBlk_t)(NSError *error);

@interface TNNetworkManager : NSObject

SingletonH

- (void)requestNewsWithType:(NSString *)type
                   success:(AFNSuccessBlk_t)success
                   failure:(AFNFailureBlk_t)failure;

@end
