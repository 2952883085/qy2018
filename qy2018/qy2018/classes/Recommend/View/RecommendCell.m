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
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTopCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleHeightCons;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *subjectHeightCOns;

@end
@implementation RecommendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.picImgV.layer.cornerRadius = 20;
    self.picImgV.clipsToBounds = YES;
}

-(void)setModel:(entryM *)model{
    _model = model;
    NSString *coverUrl=[[model.cover componentsSeparatedByString:@"?"] firstObject];
    [self.coverImgV setNormalProfileImageFromUrl:coverUrl placeholderImage:nil];
    [self.columnBtn setTitle:model.column forState:UIControlStateNormal];
    self.subjectL.text = model.subject;
    self.titleL.text = model.title;
    [self.icon_urlImgV setNormalProfileImageFromUrl:model.icon_url placeholderImage:nil];
    if(model.author.username.length || model.author.pic.length){
        self.picImgV.hidden = NO;
        self.usernameL.hidden = NO;
        [self.picImgV setNormalProfileImageFromUrl:model.author.pic placeholderImage:nil];
        self.usernameL.text = model.author.username;
        
        self.titleTopCons.constant = 15;
    }else{
        self.picImgV.hidden = YES;
        self.usernameL.hidden = YES;
        
        self.titleTopCons.constant = -40;
    }
    _titleHeightCons.constant = model.titleHeight + 5;
    _subjectHeightCOns.constant = model.subjectHeight + 5;
}

-(void)setFrame:(CGRect)frame{
    frame.origin.y += 10;
    frame.size.height -= 10;
    [super setFrame:frame];
}

@end
