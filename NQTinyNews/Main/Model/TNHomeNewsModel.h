//
//  TNHomeNewsModel.h
//  NQTinyNews
//
//  Created by 那强 on 2017/5/27.
//  Copyright © 2017年 那强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModelLib.h>

@interface TNHomeNewsModel : JSONModel

@property (nonatomic, copy)NSString *author_name;
@property (nonatomic, copy)NSString *category;
@property (nonatomic, copy)NSString *date;
@property (nonatomic, copy)NSString<Optional> *thumbnail_pic_s;
@property (nonatomic, copy)NSString<Optional> *thumbnail_pic_s02;
@property (nonatomic, copy)NSString<Optional> *thumbnail_pic_s03;
@property (nonatomic, copy)NSString<Optional> *thumbnail_pic_s04;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *uniquekey;
@property (nonatomic, copy)NSString *url;

@end
