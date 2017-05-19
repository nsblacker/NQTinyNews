//
//  NSURLSessionTool.m
//  NQTinyNews
//
//  Created by 那强 on 2017/5/17.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "NSURLSessionTool.h"

@implementation NSURLSessionTool

-(void)SessionRequestWithHTTPMethod:(HTTPMethod)httpMethod
                          hostUrl:(NSString*)host
                          pathUrl:(NSString*)path
                         param:(id)param
                       success:(void (^)(id response))success
                       failure:(void (^)(NSError *err))failure{

    NSString *appcode = @"752bcdf6fd7244ae81b8c82ae838c31e";
    NSString *method = @"GET";
    NSString *querys = @"?";
    [param enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
       
        [querys stringByAppendingString:obj];
    }];
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path , querys];
    NSString *bodys = @"";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request
                                                   completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                       NSLog(@"Response object: %@" , response);
                                                       NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
                                                       
                                                       //打印应答中的body
                                                       NSLog(@"Response body: %@" , bodyString);
                                                   }];
    
    [task resume];

}

+(void)a{
    
    NSString *appcode = @"752bcdf6fd7244ae81b8c82ae838c31e";
    NSString *host = @"http://toutiao-ali.juheapi.com";
    NSString *path = @"/toutiao/index";
    NSString *method = @"GET";
    NSString *querys = @"?type=type";
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path , querys];
    NSString *bodys = @"";
    
}

@end
