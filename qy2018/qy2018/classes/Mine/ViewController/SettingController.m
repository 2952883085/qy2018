//
//  SettingController.m
//  qy2018
//
//  Created by zxy on 2018/4/3.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "SettingController.h"
#import "SettingCell.h"
#import "SectionHeader.h"
#import "SettingFooterView.h"
static NSString *const settingHeaderID = @"settingHeaderID";
@interface SettingController ()
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)NSArray *imgArray;
@end

@implementation SettingController


-(NSArray *)titleArray{
    if(!_titleArray){
        _titleArray=@[@"账号",@"个人信息",@"推送设置",@"清除缓存",@"意见反馈",@"评价穷游",@"分享穷游",@"关于穷游"];
    }
    return _titleArray;
}
-(NSArray *)imgArray{
    if(!_imgArray){
        _imgArray=@[@"setUp_accountPwd",@"setUp_account",@"SetUp_pushMg",@"setUp_clean",@"setUp_feeBack",@"setUp_appraisal",@"setUp_share",@"setUp_about"];
    }
    return _imgArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabView.backgroundColor = [UIColor whiteColor];
    self.title = @"设置";
    [self.tabView registerNib:[UINib nibWithNibName:@"SettingCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    [self.tabView registerClass:[SectionHeader class] forHeaderFooterViewReuseIdentifier:settingHeaderID];
    self.tabView.sectionHeaderHeight = 30;
    //去掉多余cellfinger线
    [self.tabView setTableFooterView:[[UIView alloc]init]];
    self.tabView.tableFooterView = [SettingFooterView settingFooterView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(indexPath.section == 0){
        cell.imgVIew.image = [UIImage imageNamed:self.imgArray[indexPath.row]];
        cell.titleL.text = self.titleArray[indexPath.row];
    }else{
        cell.imgVIew.image = [UIImage imageNamed:self.imgArray[indexPath.row + 4]];
        cell.titleL.text = self.titleArray[indexPath.row + 4];
        cell.arrowView.hidden = YES;
    }
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SectionHeader *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:settingHeaderID];
    if(section == 0){
        header.sectionTitle.text = @"个人设置";
    }else{
        header.sectionTitle.text = @"应用相关";
    }
    return header;
}

@end
