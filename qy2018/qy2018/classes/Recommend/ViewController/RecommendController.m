//
//  RecommendController.m
//  qy2018
//
//  Created by zxy on 2018/3/27.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "RecommendController.h"
#import "RecommendHeader.h"
#import "RecommendModel.h"
@interface RecommendController (){
    NSInteger _page;
}
@property(nonatomic,strong)NSMutableArray *lunboArray;
@property(nonatomic,strong)NSMutableArray *dataSoure;
@property (weak, nonatomic) IBOutlet UITableView *tabView;
@property(nonatomic,strong)RecommendHeader *recommendHeader;
@end

@implementation RecommendController

-(NSMutableArray *)dataSoure{
    if(!_dataSoure){
        _dataSoure=[NSMutableArray array];
    }
    return _dataSoure;
}

-(NSMutableArray *)lunboArray{
    if(!_lunboArray){
        _lunboArray=[NSMutableArray array];
    }
    return _lunboArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    _page=1;
    [self setupHeader];
    [self requestDatas];
}

#pragma mark -获取数据
-(void)requestDatas{
    __weak typeof(self) weakself=self;
    NSString *url=[NSString stringWithFormat: recommend_url,_page];
   [PPNetworkHelper GET:url parameters:nil success:^(id responseObject) {
       RecommendModel *model=[[RecommendModel alloc]initWithDictionary:responseObject[@"data"] error:nil];
       if(_page==1){
           for (NSInteger i = 0; i < model.slide.count; i++) {
               lunboModel *m=model.slide[i];
               [weakself.lunboArray addObject:m.photo];
           }
           weakself.recommendHeader.lunboArray = weakself.lunboArray;
       }
       [weakself.tabView reloadData];
       
   } failure:^(NSError *error) {
       NSLog(@"error=%@",error);
   }];
}

#pragma mark -设置头部
-(void)setupHeader{
    RecommendHeader *header=[[RecommendHeader alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 200)];
    self.tabView.tableHeaderView=header;
    self.recommendHeader=header;
}

@end
