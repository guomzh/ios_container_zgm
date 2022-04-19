//
//  ViewController01.m
//  ios_container_zgm
//
//  Created by 张国铭 on 2021/10/11.
//  Copyright © 2021 zgm. All rights reserved.
//

#import "HttpRequestController.h"
#import "SDWebImage.h"
#import "FMDatabase.h"

@interface HttpRequestController ()

@property (weak, nonatomic) IBOutlet UIButton *getButton;

@property (weak, nonatomic) IBOutlet UIButton *postButton;

@property (weak, nonatomic) IBOutlet UIImageView *networkPic;

@property (weak, nonatomic) IBOutlet UIButton *dbButton;

@end

@implementation HttpRequestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_networkPic sd_setImageWithURL:[[NSURL alloc]initWithString:@"https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1114%2F062021132H5%2F210620132H5-1-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1652156397&t=5ef7eb95081e33fb349dd59d2da43e74"]];
    [self testHttp];
}

- (void)testHttp {
    [_getButton addTarget:self action:@selector(httpGetRequest) forControlEvents:UIControlEventTouchUpInside];
    [_dbButton addTarget:self action:@selector(testFmdb) forControlEvents:UIControlEventTouchUpInside];
}

- (void)httpGetRequest {
    NSLog(@"开始进行http get 请求");
}


/// fmdb用法
- (void)testFmdb {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *filePath = [doc stringByAppendingPathComponent:@"student.db"];
    FMDatabase *db = [FMDatabase databaseWithPath:filePath];
    NSLog(@"%@", NSHomeDirectory());
    if(![db open]) {
        NSLog(@"打开数据库失败");
        return;
    }
    NSString *sqlStr = @"create table if not exists t_student(id integer primary key autoincrement, name text not null, age integer not null)";
    BOOL result = [db executeUpdate:sqlStr];
    if(result) {
        NSLog(@"创建数据库成功");
    } else {
        NSLog(@"创建数据库失败");
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
