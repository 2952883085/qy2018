//
//  SearchResultM.h
//  qy2018
//
//  Created by zxy on 2018/4/9.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "JSONModel.h"

@interface SearchResultM : JSONModel
@property(nonatomic,copy)NSString *mid;
@property(nonatomic,copy)NSString *cnname;
@property(nonatomic,copy)NSString *enname;
@property(nonatomic,copy)NSString *place_type;
@property(nonatomic,copy)NSString *lat;
@property(nonatomic,copy)NSString *lng;
@property(nonatomic,copy)NSString *country_cnname;
@property(nonatomic,copy)NSString *country_enname;
@property(nonatomic,copy)NSString *continent_cnname;
@end
