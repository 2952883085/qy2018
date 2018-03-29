//
//  RecommendModel.h
//  qy2018
//
//  Created by zxy on 2018/3/27.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "JSONModel.h"

@protocol lunboModel;
@interface lunboModel : JSONModel

@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *photo;

@end


@protocol authorM;
@interface authorM : JSONModel

@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *pic;


@end

@protocol entryM;
@interface entryM : JSONModel

@property(nonatomic,copy)NSString *mid;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *column;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *cover;
@property(nonatomic,strong)authorM *author;
@property(nonatomic,copy)NSString *subject;
@property(nonatomic,copy)NSString *icon_url;
@end

@protocol feedM;
@interface feedM : JSONModel
@property(nonatomic,strong)NSArray <entryM>*entry;
@end

@interface RecommendModel : JSONModel
@property(nonatomic,strong)NSArray <lunboModel> *slide;
@property(nonatomic,strong)feedM *feed;
@end
