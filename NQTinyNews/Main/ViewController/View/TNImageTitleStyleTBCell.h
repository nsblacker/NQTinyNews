//
//  TNImageTitleStyleTBCell.h
//  NQTinyNews
//
//  Created by 那强 on 2017/6/8.
//  Copyright © 2017年 那强. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TNHomeNewsModel;

@interface TNImageTitleStyleTBCell : UITableViewCell
@property (strong, nonatomic) UIImageView *mThumbnailImg;
@property (strong, nonatomic) UILabel *mTitleLab;
- (void)configCellWithModel:(id)model;
@end
