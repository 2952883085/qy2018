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
#import "SearchResultM.h"
static NSString *const recommendCellid = @"recommendCellid";
@interface RecommendController ()<UITableViewDelegate,UITableViewDataSource,PYSearchViewControllerDelegate>{
    NSInteger _page;
}
@property(nonatomic,strong)NSMutableArray *lunboArray;
@property(nonatomic,strong)NSMutableArray *dataSoure;
@property(nonatomic,strong)NSMutableArray *heightArray;
@property (weak, nonatomic) IBOutlet UITableView *tabView;
@property(nonatomic,strong)RecommendHeader *recommendHeader;
@property(nonatomic,strong)UILabel *networkLab;
@property(nonatomic,strong)XmgMjRefreshFooter *mjFooter;


@property (weak, nonatomic) IBOutlet UIView *searchBgView;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property(nonatomic,strong)NSMutableArray *searchArray;
@end

@implementation RecommendController

-(NSMutableArray *)searchArray{
    if(!_searchArray){
        _searchArray = [NSMutableArray array];
    }
    return _searchArray;
}

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
    self.searchBgView.hidden = YES;
    self.searchBtn.layer.cornerRadius = 15;
    self.searchBtn.clipsToBounds = YES;
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
    
    self.mjFooter = [XmgMjRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(upRefrsh)];
    self.tabView.mj_footer = self.mjFooter;
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
           [weakself.dataSoure removeAllObjects];
           weakself.mjFooter.stateLabel.hidden = YES;
           //重置没有更多数据状态
           [weakself.tabView.mj_footer resetNoMoreData];
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
       if(weakself.dataSoure.count >=80){
           weakself.mjFooter.stateLabel.hidden = NO;
           [weakself.mjFooter setTitle:@"没有更多数据了" forState:MJRefreshStateNoMoreData];
           [weakself.tabView.mj_footer endRefreshingWithNoMoreData];
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


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%f",offsetY);
    if(offsetY > 200){
        self.searchBgView.hidden = NO;
    }else if(offsetY < 50){
        self.searchBgView.hidden = YES;
    }
}

#pragma mark -搜索按钮点击事件
- (IBAction)searchBtnClick:(UIButton *)sender {
    NSArray *hotSeaches = @[@"Java", @"Python", @"Objective-C", @"Swift", @"C", @"C++", @"PHP", @"C#", @"Perl", @"Go", @"JavaScript", @"R", @"Ruby", @"MATLAB"];
    PYSearchViewController *searchCtl = [PYSearchViewController searchViewControllerWithHotSearches:hotSeaches searchBarPlaceholder:@"请输入要搜索内容" didSearchBlock:^(PYSearchViewController *searchViewController, UISearchBar *searchBar, NSString *searchText) {
        NSLog(@"点击搜索结果实现页面跳转在这里");
        //设置搜索结果控制器
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[SearchResultController alloc]init]];
        searchViewController.searchResultController = nav;
    }];
    
    searchCtl.searchBarBackgroundColor = [UIColor cz_colorWithHex:0x2B705A];
    //设置搜索框占位文字颜色
    [searchCtl.searchTextField changePlaceholderTextColor:[UIColor whiteColor]];
    //设置输入文字颜色
    [searchCtl.searchTextField setTextColor:[UIColor whiteColor]];
    
    //设置searchBar搜索按钮颜色
    [searchCtl.searchBar setImage:[UIImage imageNamed:@"communtiy_search_icon"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    
    //设置清除按钮图片
    [searchCtl.searchBar setImage:[UIImage imageNamed:@"question_tag_cancel_icon"] forSearchBarIcon:UISearchBarIconClear state:UIControlStateNormal];
    
    searchCtl.searchBar.layer.cornerRadius = 14;
    searchCtl.searchBar.clipsToBounds = YES;
    
    searchCtl.delegate = self;
    
    //通过嵌入来显示搜索结果的视图
    searchCtl.searchResultShowMode = PYSearchResultShowModeEmbed;
    
    
    //设置搜索历史风格
    searchCtl.searchHistoryStyle = PYSearchHistoryStyleColorfulTag;
    searchCtl.hotSearchStyle = PYHotSearchStyleColorfulTag;
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:searchCtl];
    [nav.navigationBar setBarTintColor:[UIColor cz_colorWithHex:0x1D8C53]];
    [self presentViewController:nav animated:YES completion:nil];
}


#pragma mark -PYSearchViewControllerDelegate

//点击搜索结果
- (void)searchViewController:(PYSearchViewController *)searchViewController
didSelectSearchSuggestionAtIndex:(NSInteger)index
                  searchText:(NSString *)searchText{
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[SearchResultController alloc]init]];
    searchViewController.searchResultController = nav;
}

#pragma mark -搜索文本开始改变时
- (void)searchViewController:(PYSearchViewController *)searchViewController
         searchTextDidChange:(UISearchBar *)searchBar
                searchText:(NSString *)searchText{
    
    
    //根据搜索文本，从服务器获取搜索结果
    if(searchText.length){
        [self requestResultDatas:searchText searchCtl:searchViewController];
    }
    
}

#pragma mark -获取搜索结果数据
-(void)requestResultDatas:(NSString *)searchText searchCtl:(PYSearchViewController *)searchCtl{
    __weak typeof(self)weakself = self;
    [weakself.searchArray removeAllObjects];
    NSString *str = [searchText stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *url = [NSString stringWithFormat:search_url,str];
    [PPNetworkHelper GET:url parameters:nil success:^(id responseObject) {
        NSArray *array = responseObject[@"data"][@"entry"];
        for (NSInteger i = 0; i < array.count; i++) {
            SearchResultM *model = [[SearchResultM alloc]initWithDictionary:array[i] error:nil];
            [weakself.searchArray addObject:model.cnname];
        }
        searchCtl.searchSuggestions = weakself.searchArray;
    } failure:^(NSError *error) {
        NSLog(@"error=%@",error);
    }];
}
@end
