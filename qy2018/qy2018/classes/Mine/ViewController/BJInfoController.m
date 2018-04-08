//
//  BJInfoController.m
//  qy2018
//
//  Created by zxy on 2018/4/8.
//  Copyright © 2018年 foxconn. All rights reserved.
//

#import "BJInfoController.h"
#import "AvatarCell.h"
#import "BJCell.h"
static NSString *const avatarCellId = @"avatarCellId";
static NSString *const BJCellId = @"BJCellId";
@interface BJInfoController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)UIImagePickerController *pickerCtl;
@end

@implementation BJInfoController

-(NSArray *)titleArray{
    if(!_titleArray){
        _titleArray = @[@"用户昵称",@"性别",@"常居城市",@"个人简介"];
    }
    return _titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"编辑个人信息";
    [self.tabView registerNib:[UINib nibWithNibName:@"AvatarCell" bundle:nil] forCellReuseIdentifier:avatarCellId];
    [self.tabView registerNib:[UINib nibWithNibName:@"BJCell" bundle:nil] forCellReuseIdentifier:BJCellId];
    [self.tabView setTableFooterView:[[UIView alloc]init]];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return 80;
    }else{
        return 60;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        AvatarCell *cell = [tableView dequeueReusableCellWithIdentifier:avatarCellId forIndexPath:indexPath];
        return cell;
    }else{
        BJCell *cell = [tableView dequeueReusableCellWithIdentifier:BJCellId forIndexPath:indexPath];
        cell.titleL.text = self.titleArray[indexPath.row - 1];
        if(indexPath.row == 1){
            cell.subTitleL.text = @"LAL1237896";
        }else if (indexPath.row == 2){
            cell.subTitleL.text = @"保密";
        }else{
            cell.subTitleL.text = @"设置";
        }
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    __weak typeof(self)weakself = self;
    
    weakself.pickerCtl = [[UIImagePickerController alloc]init];
    weakself.pickerCtl.allowsEditing = YES;
    weakself.pickerCtl.delegate = self;
    
    if(indexPath.row == 0){
        UIAlertController *ctl = [UIAlertController alertControllerWithTitle:@"更换头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        //设置提示标题颜色
        NSMutableAttributedString *alertControllerStr = [[NSMutableAttributedString alloc]initWithString:@"提示" attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16],NSForegroundColorAttributeName: [UIColor blackColor]}];
        
        [ctl setValue:alertControllerStr forKey:@"attributedTitle"];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"从相册选取照片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            weakself.pickerCtl.sourceType =UIImagePickerControllerSourceTypePhotoLibrary;
            [weakself.navigationController presentViewController:weakself.pickerCtl animated:YES completion:nil];
        }];
        [action1 setValue:[UIColor greenColor] forKey:@"titleTextColor"];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //判断相机是否可用
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
                weakself.pickerCtl.sourceType = UIImagePickerControllerSourceTypeCamera;
                [weakself.navigationController presentViewController:weakself.pickerCtl animated:YES completion:nil];
            }
        }];
        
        [action2 setValue:[UIColor greenColor] forKey:@"titleTextColor"];
        [ctl addAction:action1];
        [ctl addAction:action2];
        [self presentViewController:ctl animated:YES completion:nil];
    }
}


#pragma mark -UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //info是所选择照片的信息
    
    //    UIImagePickerControllerEditedImage//编辑过的图片
    //    UIImagePickerControllerOriginalImage//原图
    UIImage *resultImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    NSLog(@"%@",info);
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
