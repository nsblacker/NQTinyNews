//
//  TNBaseVC.h
//  NQTinyNews
//
//  Created by NaQiang_iMac on 2017/6/19.
//  Copyright © 2017年 那强. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,TNBaseVCType) {
    TNBaseVCTypeWith,
};
@interface TNBaseVC : UIViewController
- (void)setLeftItem:(id)left;
- (void)setLeftItem:(id)left responeSEL:(SEL)action;
- (void)setRightItem:(id)right responeSEL:(SEL)action;
@end
