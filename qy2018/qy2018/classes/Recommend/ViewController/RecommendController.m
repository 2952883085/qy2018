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
#import "RecommendCell.h"
#import "XmgMjRefreshHeader.h"
#import "XmgMjRefreshFooter.h"
static NSString *const recommendCellid = @"recommendCellid";
@interface RecommendController ()<UITableViewDelegate,UITableViewDataSource>{
    NSInteger _page;
}
@property(nonatomic,strong)NSMutableArray *lunboArray;
@property(nonatomic,strong)NSMutableArray *dataSoure;
@property(nonatomic,strong)NSMutableArray *heightArray;
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

-(NSMutableArray *)heightArray{
    if(!_heightArray){
        _heightArray=[NSMutableArray array];
    }
    return _heightArray;
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
    [self setupMjRefersh];
    
}
#pragma mark -没有网络提示动画
-(void)addAnimation{
    POPBasicAnimation *baseAni = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    baseAni.fromValue = @(1);
    baseAni.toValue = @(0);
//    baseAni.beginTime = CACurrentMediaTime() + 2;
    baseAni.duration = 3;
    [self.networkLab pop_addAnimation:baseAni forKey:@"kalpha"];
}

#pragma mark -刷新
-(void)setupMjRefersh{
    self.tabView.mj_header = [XmgMjRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefresh)];
    [self.tabView.mj_header beginRefreshing];
    
    self.tabView.mj_footer= [XmgMjRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(upRefrsh)];
}

-(void)downRefresh{
    _page = 1;
    [self requestDatas];
}

-(void)upRefrsh{
    _page++;
    [self requestDatas];
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
           [weakself.lunboArray removeAllObjects];
           for (NSInteger i = 0; i < model.slide.count; i++) {
               lunboModel *m=model.slide[i];
               [weakself.lunboArray addObject:m.photo];
           }
           weakself.recommendHeader.lunboArray = weakself.lunboArray;
       }
       [weakself.dataSoure addObjectsFromArray:model.feed.entry];
       weakself.tabView.backgroundColor = [UIColor cz_colorWithHex:0xE6E6E6];
       [weakself.tabView reloadData];
       if(weakself.tabView.mj_header){
           [weakself.tabView.mj_header endRefreshing];
       }
       if(weakself.tabView.mj_footer){
           [weakself.tabView.mj_footer endRefreshing];
       }
       
   } failure:^(NSError *error) {
       NSLog(@"error=%@",error);
       [weakself.tabView.mj_header endRefreshing];
       [weakself.tabView.mj_footer endRefreshing];
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
    
    [self.tabView registerNib:[UINib nibWithNibName:@"RecommendCell" bundle:nil] forCellReuseIdentifier:recommendCellid];
    
    self.tabView.contentInset = UIEdgeInsetsMake(0, 0, 49, 0);
}

#pragma mark -tableviewDataSoure
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSoure.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 0;
    if(self.heightArray.count <= indexPath.row){//缓存高度
        entryM *model = self.dataSoure[indexPath.row];
        if(model.author.username.length || model.author.pic.length){
            height = 150 + 20 + 10 + 20 + 15 + model.titleHeight + 15 + model.subjectHeight + 20 + 30 + 20 + 10;
        }else{
            height = 150 + 15 + model.titleHeight + 15 + model.subjectHeight + 20 + 30+ 20 + 10;
        }
        [self.heightArray addObject:[NSNumber numberWithFloat:height]];
    }else{//从缓存去高度
        height = [self.heightArray[indexPath.row] floatValue];
    }
    return height;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:recommendCellid forIndexPath:indexPath];
    if(self.dataSoure.count){
        cell.model = self.dataSoure[indexPath.row];
    }
    return cell;
}

@end
