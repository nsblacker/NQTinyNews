//
//  TNNetworkManager.m
//  NQTinyNews
//
//  Created by 那强 on 2017/5/19.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TNNetworkManager.h"
#import <AFNetworking.h>

NSString *const TNApiAuthorization_News = @"752bcdf6fd7244ae81b8c82ae838c31e";
/*
 类型,,top(头条，默认),shehui(社会),guonei(国内),guoji(国际),yule(娱乐),tiyu(体育)junshi(军事),keji(科技),caijing(财经),shishang(时尚)
 */

@interface TNNetworkManager ()

@property(nonatomic, strong)AFHTTPSessionManager *afHttpSessionManager;

@end

@implementation TNNetworkManager

SingletonM

-(AFHTTPSessionManager*)afHttpSessionManager{
    
    if(!_afHttpSessionManager){
    
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        [sessionConfig setHTTPAdditionalHeaders:@{@"Authorization":[NSString  stringWithFormat:@"APPCODE %@" ,  TNApiAuthorization_News]}];
        
        _afHttpSessionManager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:sessionConfig];
        
    }
    return _afHttpSessionManager;
}

-(void)AFRequestWithHTTPMethod:(HttpRequestMethod)httpMethod
                          host:(NSString*)host
                           path:(NSString*)path
                         param:(id)param
                       success:(void (^)(id response))success
                       failure:(void (^)(NSError *err))failure{
    
    
    NSURL *URL = [NSURL URLWithString:host];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",host ,path];

    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    switch (httpMethod) {
            
        case HttpRequestMethod_GET:
        {
            NSURLSessionDataTask *dataTask = [self.afHttpSessionManager GET:urlStr
                                                                 parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
                                                                     
            }success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
                success(responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                failure(error);
            }];
            [dataTask resume];
        }
            break;
        case HttpRequestMethod_POST:
        {
            NSURLSessionDataTask *dataTask  = [self.afHttpSessionManager POST:urlStr
                                                                   parameters:param
                                                                     progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                
                success(responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                failure(error);
            }];
            [dataTask resume];
        }
            break;
        default:
            break;
    }
}

-(void)requestNewsWithType:(NSString *)type
                   success:(AFNSuccessBlk_t)success
                   failure:(AFNFailureBlk_t)failure{
    
    NSString *host = @"http://toutiao-ali.juheapi.com";
    
    NSString *path = @"/toutiao/index";
    
    NSDictionary *param = @{@"type":type};
    
    [self AFRequestWithHTTPMethod:HttpRequestMethod_GET
                             host:host
                             path:path
                            param:param
                          success:success
                          failure:failure];
    
}



@end
