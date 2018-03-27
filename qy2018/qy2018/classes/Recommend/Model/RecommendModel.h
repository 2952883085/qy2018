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




@protocol entryModel;
@interface entryModel : JSONModel

@property(nonatomic,copy)NSString *mid;
@property(nonatomic,copy)NSString *type;
@property(nonatomic,copy)NSString *column;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *url;
@property(nonatomic,copy)NSString *cover;

@end
@interface RecommendModel : JSONModel
@property(nonatomic,strong)NSArray <lunboModel> *slide;
@property(nonatomic,strong)NSArray <entryModel> *entry;
@end
