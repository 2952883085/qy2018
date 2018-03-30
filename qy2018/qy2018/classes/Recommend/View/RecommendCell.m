//
//  RecommendCell.m
//  qy2018
//
//  Created by zxy on 2018/3/30.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "RecommendCell.h"
@interface RecommendCell()
@property (weak, nonatomic) IBOutlet UIButton *columnBtn;
@property (weak, nonatomic) IBOutlet UIImageView *coverImgV;
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UIImageView *picImgV;
@property (weak, nonatomic) IBOutlet UILabel *usernameL;
@property (weak, nonatomic) IBOutlet UILabel *subjectL;
@property (weak, nonatomic) IBOutlet UIImageView *icon_urlImgV;

@end
@implementation RecommendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
