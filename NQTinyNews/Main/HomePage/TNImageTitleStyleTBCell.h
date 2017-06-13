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
@property (strong, nonatomic) IBOutlet UIImageView *newsThumbnail;
@property (strong, nonatomic) IBOutlet UILabel *newsTitle;
@property (strong, nonatomic) IBOutlet UILabel *newsSource;

- (void)configCellWithModel:(id)model;
@end
