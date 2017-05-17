//
//  AppDelegate.h
//  NQTinyNews
//
//  Created by 那强 on 2017/5/17.
//  Copyright © 2017年 那强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

