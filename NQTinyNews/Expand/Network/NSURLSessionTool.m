//
//  NSURLSessionTool.m
//  NQTinyNews
//
//  Created by 那强 on 2017/5/17.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "NSURLSessionTool.h"

NSString *const TNApiAuthorization_News1 = @"752bcdf6fd7244ae81b8c82ae838c31e";

@implementation NSURLSessionTool

SingletonM

#pragma -mark detail request
-(void)requestNewsWithType:(NSString *)type
                   success:(URLSessionSuccessBlk_t)success
                   failure:(URLSessionFailureBlk_t)failure{
    
    NSString *host = @"http://toutiao-ali.juheapi.com";
    
    NSString *path = @"/toutiao/index";
    
    NSDictionary *param = @{@"type":type};
    
    [self sessionRequestWithHTTPMethod:HTTPMethod_GET
                               hostUrl:host
                               pathUrl:path
                                 param:param
                               success:success
                               failure:failure];
}

#pragma -mark network main interface
/**
 * 本App网路请求的入口，配置Config去设置Authorization，if needed.
 */
-(void)sessionRequestWithHTTPMethod:(HTTPMethod)httpMethod
                          hostUrl:(NSString*)host
                          pathUrl:(NSString*)path
                         param:(id)params
                       success:(URLSessionSuccessBlk_t)success
                       failure:(URLSessionFailureBlk_t)failure{
    
    //注意配置Header中参数的方法
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    
    [sessionConfig setHTTPAdditionalHeaders:@{@"Authorization":[NSString  stringWithFormat:@"APPCODE %@" ,  TNApiAuthorization_News1]}];
    
    switch (httpMethod) {
        case HTTPMethod_GET:
        {
            [self GETDataWithHostUrl:host pathUrl:path param:params config:sessionConfig success:success failure:failure];
        }
            break;
        case HTTPMethod_POST:
        {
            [self POSTDataWithHostUrl:host pathUrl:path param:params config:sessionConfig success:success failure:failure];
        }
            break;
    }
    
}

#pragma -mark GET/POST
/**
 * 封装GET与POST两者的区别，思路上就一点不同：param的处理。
 * GET把参数string接到URL，然后init request with url；
 * POST把参数string转为NSData，放到request.HTTPBody
 * 以下两个方法可以移植
 */
/**
 * Get Request
 */
-(void)GETDataWithHostUrl:(NSString*)host
                  pathUrl:(NSString*)path
                    param:(id)params
                   config:(NSURLSessionConfiguration*)config
                  success:(URLSessionSuccessBlk_t)success
                  failure:(URLSessionFailureBlk_t)failure{
//    
//    if ([NSJSONSerialization isValidJSONObject:params]){
//        
//        
//    }
    NSMutableString *paramStr = [[NSMutableString alloc]init];
    
    if([params isKindOfClass:[NSDictionary class]]){
        
        [params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
            [paramStr appendFormat:@"%@=%@&",key,obj];
            
        }];
    }
    //GET
    NSString *queryGET = [paramStr substringToIndex:paramStr.length - 1];//不安全
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@?%@",host,path,queryGET]];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:10.0f];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data && !error) {
            
            id jsonDic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            if(!jsonDic){
                
                jsonDic = data;
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (success) {
                    
                    success(response,jsonDic);
                }
            });
            
            
        }else{
            
            failure(error);
        }
    }];
    [dataTask resume];
}
/**
 * Post Request
 */
-(void)POSTDataWithHostUrl:(NSString*)host
                   pathUrl:(NSString*)path
                     param:(id)params
                    config:(NSURLSessionConfiguration *)config
                   success:(URLSessionSuccessBlk_t)success
                   failure:(URLSessionFailureBlk_t)failure{

    NSMutableString *paramStr = [[NSMutableString alloc]init];
    
    if([params isKindOfClass:[NSDictionary class]]){
        
        [params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            
            NSString *paramKey = key;
            
            NSString *paramObj = obj;
            
            [paramStr appendFormat:@"%@=%@&",paramKey,paramObj];
            
        }];
    }
    //POST
    NSString *queryPOST = [paramStr substringToIndex:paramStr.length - 1];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",host,path]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:10.0f];
    
    //与get不一样的地方
    NSData *queryPOSTData = [queryPOST dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPMethod:@"POST"];
    request.HTTPBody = queryPOSTData;
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data && !error) {
            
            id jsonDic = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            if(!jsonDic){
                
                jsonDic = data;
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (success) {
                    
                    success(response,jsonDic);
                }
            });
            
            
        }else{
            
            failure(error);
        }
    }];
    [dataTask resume];
}

@end
