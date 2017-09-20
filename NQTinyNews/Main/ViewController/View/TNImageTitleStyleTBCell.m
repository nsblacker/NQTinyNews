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
#import <Masonry.h>

@implementation TNImageTitleStyleTBCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self layoutUI];
    }
    return self;
}

-(void)layoutUI{
    
    _mThumbnailImg = [[UIImageView alloc]init];
    [self.contentView addSubview:_mThumbnailImg];
    [_mThumbnailImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_left).offset(5);
        make.top.equalTo(self.contentView.mas_top).offset(5);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-5);
        make.width.equalTo(@70);
    }];
    
    _mTitleLab = [[UILabel alloc]init];
    _mTitleLab.font = [UIFont systemFontOfSize:20 weight:1.2];
    _mTitleLab.numberOfLines = 3;
    [self.contentView addSubview:_mTitleLab];
    [_mTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_mThumbnailImg.mas_right).offset(20);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (void)layoutSubviews{
//    [super layoutSubviews];
//    [self.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
//}

- (void)configCellWithModel:(TNHomeNewsModel*)model{
    _mTitleLab.text = model.title;
    [_mThumbnailImg setImageWithURL:[NSURL URLWithString:model.thumbnail_pic_s] placeholder:nil options:YYWebImageOptionIgnoreFailedURL completion:nil];
}
@end
