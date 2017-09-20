//
//  Marco.h
//  NQTinyNews
//
//  Created by 那强 on 2017/5/17.
//  Copyright © 2017年 那强. All rights reserved.
//

#ifndef Marco_h
#define Marco_h

//生成单例
#define SingletonH + (instancetype)sharedInstance;

#define SingletonM \
static id _instance; \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (instancetype)sharedInstance \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instance; \
}

//weak/strong
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define StrongSelf(strongSelf) __strong __typeof(&*weakSelf)strongSelf = weakSelf;//必须先声明了weakSelf


//Log当前方法
#define MethodLog \
NSLog(@"%s",__func__);\

//Log任意对对象

#ifdef DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d\t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#define Print(obj) NSLog(@"%@",obj);
#else
#define NSLog(FORMAT, ...) nil
#define Print(obj) nil
#endif

//颜色
#define RGB(a,b,c) [UIColor colorWithRed:(a/255.0) green:(b/255.0) blue:(c/255.0) alpha:1.0]
#define RGBA(a,b,c,d) [UIColor colorWithRed:(a/255.0) green:(b/255.0) blue:(c/255.0) alpha:d]
#define HEXColor(HexValue) \
[UIColor colorWithRed:((float)((HexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((HexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(HexValue & 0xFF))/255.0 alpha:1.0]

//尺寸
#define ScreenHeight                    MAX([[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height)
#define ScreenWidth                     MIN([[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height)
#define Screen35in                      (ScreenHeight==480) // 4、4s
#define Screen40in                      (ScreenHeight==568) // 5、5C
#define Screen47in                      (ScreenHeight==667) // 6、7
#define Screen55in                      (ScreenHeight==736) // 6+、7+
#define iPad                            (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define iPadPro                         ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) && (ScreenHeight==1366))

#define ADAPTER_SIZE(n) (n * [UIScreen mainScreen].bounds.size.width / 320.0f)

#define height_StatusBar 20.0
#define height_NavigationBar 64.0
#define height_Segment 30.0
#define height_TabBar 48.0
#define height_ViewWithNav (ScreenHeight  - height_NavigationBar)
#define height_ViewWithNav_Tab (ScreenHeight  - height_NavigationBar - height_TabBar)
#define height_ViewWithNav_Tab_Seg (ScreenHeight  - height_NavigationBar - height_TabBar - height_Segment)

//系统
#define higheriOS(systemVer) [[[UIDevice currentDevice]systemVersion] floatValue] >= systemVer

#endif /* Marco_h */


