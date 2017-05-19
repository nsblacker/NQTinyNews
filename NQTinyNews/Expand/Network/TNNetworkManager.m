//
//  TNNetworkManager.m
//  NQTinyNews
//
//  Created by 那强 on 2017/5/19.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TNNetworkManager.h"
#import "NSURLSessionTool.h"
#import <AFNetworking.h>


@implementation TNNetworkManager

+(void)AFRequestWithHTTPMethod:(HTTPMethod)httpMethod
                           url:(NSString*)url
                         param:(id)param
                       success:(void (^)(id response))success
                       failure:(void (^)(NSError *err))failure{
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            failure(error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            success(responseObject);
        }
    }];
    [dataTask resume];
}

+(void)requestForNews{
    
    NSString *appcode = @"你自己的AppCode";
    NSString *host = @"http://toutiao-ali.juheapi.com";
    NSString *path = @"/toutiao/index";
    NSString *method = @"GET";
    NSString *querys = @"?type=type";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path , querys];
    NSString *bodys = @"";
    
    
}



@end
