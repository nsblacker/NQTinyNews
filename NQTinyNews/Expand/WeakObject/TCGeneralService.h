//
//  TCGeneralService.h
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/8/15.
//  Copyright © 2017年 那强. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TCGeneralService;

@protocol TCServieDelegate<NSObject>
-(void)generalService:(TCGeneralService*)generalService didStartLoadingUrl:(NSString*)urlStr;
@end

@interface TCGeneralService : NSObject
+ (instancetype)sharedInstance;
- (void)registerDelegate:(id<TCServieDelegate>)delegate;
- (void)removeDelegate:(id<TCServieDelegate>)delegate;
@end
