//
//  NSURLSessionTool.h
//  NQTinyNews
//
//  Created by 那强 on 2017/5/17.
//  Copyright © 2017年 那强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"
#import "Marco.h"

typedef NS_ENUM(NSUInteger , HTTPMethod) {
    HTTPMethod_GET,
    HTTPMethod_POST,
};

typedef void (^URLSessionSuccessBlk_t)(NSURLResponse *response,id jsonDic);
typedef void (^URLSessionFailureBlk_t)(NSError *error);

@interface NSURLSessionTool : NSObject

SingletonH

-(void)requestNewsWithType:(NSString *)type success:(URLSessionSuccessBlk_t)success
                   failure:(URLSessionFailureBlk_t)failure;
@end
