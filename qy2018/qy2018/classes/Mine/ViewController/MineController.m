//
//  MineController.m
//  qy2018
//
//  Created by zxy on 2018/3/27.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "MineController.h"
#import "LoginHeader.h"
@interface MineController ()
@property(nonatomic,strong)NSArray *imgArray;
@property(nonatomic,strong)NSArray *titleArray;
@end

@implementation MineController


-(NSArray *)imgArray{
    if(!_imgArray){
        _imgArray=@[@"myOrder_icon",@"myOrderCollecte_icon",@"mycoupon_icon",@"MyFootPrint_icon",@"MyComment_icon",@"MyPosts_icon",@"MyQuestionsAnswers_icon",@"MyGoWith_icon"];
    }
    return _imgArray;
}

-(NSArray *)titleArray{
    if(!_titleArray){
        _titleArray=@[@"我的订单",@"我收藏的折扣",@"我的优惠劵",@"我的足迹",@"等我点评的目的地",@"我发布的帖子",@"我的问答",@"我的结伴"];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabView.backgroundColor = [UIColor lightGrayColor];
    [self setupNavigationBar];
    [self setupHeader];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}


#pragma mark -设置导航栏
-(void)setupNavigationBar{
    self.navigationItem.title = @"个人中心";
    UIButton *rightItem = [UIButton cz_textButton:nil fontSize:0 normalColor:nil ImageName:@"QYNavSettingWhite"];
    [rightItem setImage:[UIImage imageNamed:@"QYNavSettingGreen"] forState:UIControlStateHighlighted];
    rightItem.frame = CGRectMake(10, 0, 30, 30);
    [rightItem addTarget:self action:@selector(setBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    [view addSubview:rightItem];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:view];
}

-(void)setBtnClick:(UIButton *)sender{
    NSLog(@"设置按钮被点击了");
}

#pragma mark - 设置头部
-(void)setupHeader{
    LoginHeader *header = [LoginHeader loginHeader];
    header.backgroundColor=[UIColor clearColor];
    header.frame = CGRectMake(0, 0, screenWidth, 280);
    self.tabView.tableHeaderView = header;
    self.tabView.yz_headerScaleImage=[UIImage imageNamed:@"profileHeader.jpg"];
    self.tabView.yz_headerScaleImageHeight = 180;
}

#pragma mark -tableviewDataSoure


@end
