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
#import "BJInfoController.h"
#import "CachingController.h"
static NSString *const settingHeaderID = @"settingHeaderID";
@interface SettingController (){
    CGFloat _cacheSize;
}
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
    //去掉多余cell分割线
    [self.tabView setTableFooterView:[[UIView alloc]init]];
    self.tabView.tableFooterView = [SettingFooterView settingFooterView];
    
    [self getCacheSize];
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
        if(indexPath.row == 3){
            if(_cacheSize > 0){
                cell.subTitleL.hidden = NO;
                cell.subTitleL.text = [NSString stringWithFormat:@"%.0fM",_cacheSize];
            }else{
                cell.subTitleL.hidden = YES;
            }
        }else{
            cell.subTitleL.hidden = YES;
        }
    }else{
        cell.imgVIew.image = [UIImage imageNamed:self.imgArray[indexPath.row + 4]];
        cell.titleL.text = self.titleArray[indexPath.row + 4];
        cell.arrowView.hidden = YES;
        cell.subTitleL.hidden = YES;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self)weakself = self;
    if(indexPath.section == 0 ){
        if(indexPath.row == 1){//个人信息
            BJInfoController *ctl = [[BJInfoController alloc]init];
            [self.navigationController pushViewController:ctl animated:YES];
        }else if (indexPath.row == 3){//清除缓存
            UIAlertController *alrtCtl = [UIAlertController alertControllerWithTitle:@"确定清除缓存?" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [cancel setValue:[UIColor lightGrayColor] forKey:@"titleTextColor"];
            UIAlertAction *enter = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //清楚缓存
                [weakself clearCache];
            }];
            [enter setValue:[UIColor greenColor] forKey:@"titleTextColor"];
            [alrtCtl addAction:cancel];
            [alrtCtl addAction:enter];
            [self.navigationController presentViewController:alrtCtl animated:YES completion:nil];
        }
    }
}

#pragma mark -获取缓存大小
-(void)getCacheSize{
    NSString *path = [CachingController getCachesDirectory];
    CGFloat size = [CachingController folderSizeAtPath:path];
    _cacheSize = size;
    NSLog(@"size=%.1fM",_cacheSize);
    
    
}

#pragma mark -清除缓存
-(void)clearCache{
    //获取caches缓存文件夹路径
    NSString *path=[CachingController getCachesDirectory];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD showWithStatus:@"正在清理缓存..."];
        [CachingController clearCache:path];
        dispatch_async(dispatch_get_main_queue(), ^{
            _cacheSize=0;
            [SVProgressHUD dismiss];
            [self.tabView reloadData];
        });
    });
}

@end
