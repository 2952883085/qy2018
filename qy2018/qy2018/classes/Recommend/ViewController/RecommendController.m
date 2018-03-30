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
@property(nonatomic,strong)UILabel *networkLab;
@end

@implementation RecommendController

-(UILabel *)networkView{
    if(!_networkLab){
        _networkLab=[[UILabel alloc]initWithFrame:CGRectMake(screenWidth*0.5-100, screenHeight*0.5-10, 200, 20)];
        _networkLab.backgroundColor=[UIColor lightGrayColor];
        _networkLab.layer.cornerRadius=10;
        _networkLab.clipsToBounds=YES;
//        _networkLab.hidden=YES;
        _networkLab.alpha=0;
        _networkLab.text=@"网络加载失败，请检查网络";
        _networkLab.font=[UIFont systemFontOfSize:14];
        _networkLab.textColor=[UIColor whiteColor];
        _networkLab.textAlignment=NSTextAlignmentCenter;
    }
    return _networkLab;
}

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
    [self.view addSubview:self.networkView];
    [self setupHeader];
    [self requestDatas];
}
-(void)addAnimation{
    POPBasicAnimation *baseAni = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    baseAni.fromValue = @(1);
    baseAni.toValue = @(0);
//    baseAni.beginTime = CACurrentMediaTime() + 2;
    baseAni.duration = 3;
    [self.networkLab pop_addAnimation:baseAni forKey:@"kalpha"];
}
#pragma mark -获取数据
-(void)requestDatas{
    __weak typeof(self) weakself=self;
    [weakself.indicator startAnimation];
    NSString *url=[NSString stringWithFormat: recommend_url,_page];
   [PPNetworkHelper GET:url parameters:nil success:^(id responseObject) {
       [weakself.indicator stopAnimationWithLoadText:@"" withType:YES];
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
       
       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//           weakself.networkView.hidden=NO;
           [weakself.indicator stopAnimationWithLoadText:@"" withType:YES];
           [weakself addAnimation];
//           dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//               weakself.networkView.hidden=YES;
//           });
       });
   }];
}

#pragma mark -设置头部
-(void)setupHeader{
    RecommendHeader *header=[[RecommendHeader alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 200)];
    self.tabView.tableHeaderView=header;
    self.recommendHeader=header;
}

@end
