//
//  TNImageTitleStyleTBCell.m
//  NQTinyNews
//
//  Created by 那强 on 2017/6/8.
//  Copyright © 2017年 那强. All rights reserved.
//

#import "TNImageTitleStyleTBCell.h"
#import "TNHomeNewsModel.h"
#import <UIImageView+YYWebImage.h>

@implementation TNImageTitleStyleTBCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
}

- (void)configCellWithModel:(TNHomeNewsModel*)model{
    _newsTitle.text = model.title;
    [_newsThumbnail setImageWithURL:[NSURL URLWithString:model.thumbnail_pic_s] placeholder:nil options:YYWebImageOptionIgnoreFailedURL completion:nil];
    _newsSource.text  = @"from";
}
@end
