//
//  DataBaseManager.m
//  张先勇
//
//  Created by qianfeng on 15/12/12.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "DataBaseManager.h"
#import "RecommendModel.h"
@interface DataBaseManager()
@property(nonatomic,strong)FMDatabase *database;
@end
@implementation DataBaseManager
-(instancetype)init
{
    if(self=[super init])
    {
       
        _database=[FMDatabase databaseWithPath:[self databasePath]];
        
        BOOL ret=[_database open];
        NSLog(@"%@",ret ?@"打开数据库成功":@"打开数据库失败");
        
        [self createTable];
        
    }
    return  self;
}
//数据库路径
-(NSString *)databasePath
{
    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSLog(@"path=%@",path);
    return [path stringByAppendingPathComponent:@"app.db"];
}
//创建表
-(void)createTable
{
    NSString *sql=@"create table if not exists LimitFree(id integer primary key autoincrement, mid text, column text, title text, url text, cover text,subject text,author text,icon_url text)";
    BOOL ret=[_database executeUpdate:sql];
    NSLog(@"%@",ret ?@"创建表成功":@"创建表失败");
}

+(DataBaseManager *)sharedManager
{
    static DataBaseManager *manager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[[DataBaseManager alloc]init];
    });
    return  manager;
}

//插入数据
-(BOOL)insertDatas:(NSArray *)array
{
    if(![self deleteDatas])
    {
        return NO;
    }
    BOOL ret=YES;
    for (entryM *mode in array) {
        NSString *sql=@"insert into LimitFree(mid text, column text, title text, url text, cover text,subject text,author text,icon_url text)values(?,?,?,?,?,?,?,?)";
        //将字典转成字符串存入数据库
        NSData *data =[NSJSONSerialization dataWithJSONObject:mode.author options:NSJSONWritingPrettyPrinted error:nil];
        NSString *authorStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        ret&= [_database executeUpdate:sql,mode.mid,mode.column,mode.title,mode.url,mode.cover,mode.subject,authorStr,mode.icon_url];
    }
    NSLog(@"%@",ret ?@"插入成功":@"插入失败");
    return ret;
}

-(BOOL)deleteDatas
{
    NSString *sql=@"delete from LimitFree;";
    BOOL ret=[_database executeUpdate:sql];
    NSLog(@"%@",ret ?@"删除成功":@"删除失败");
    return ret;
}

-(NSArray *)getAllDatas
{
    NSString *sql=@"select *from LimitFree";
    FMResultSet *set=[_database executeQuery:sql];
    NSMutableArray *muArr=[NSMutableArray array];
    while ([set next]) {
        entryM *mode=[[entryM alloc]init];
        mode.mid=[set stringForColumn:@"mid"];
        mode.column=[set stringForColumn:@"column"];
        mode.cover=[set stringForColumn:@"cover"];
        mode.title=[set stringForColumn:@"title"];
        mode.subject=[set stringForColumn:@"subject"] ;
        mode.url=[set stringForColumn:@"subject"];
        mode.icon_url=[set stringForColumn:@"icon_url"];
//        mode.author=[set stringForColumn:@"subject"];
        [muArr addObject:mode];
    }
    return muArr;
}

@end
