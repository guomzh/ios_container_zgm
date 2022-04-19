//
//  UITableViewController.m
//  ios_container_zgm
//
//  Created by 张国铭 on 2022/1/2.
//  Copyright © 2022 zgm. All rights reserved.
//

#import "TableViewController.h"
#import "AppModel.h"
#import "AppModelView.h"

@interface TableViewController ()<UITableViewDataSource>

@property(nonatomic, assign)int tableSections;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *apps;

@end

@implementation TableViewController

/**
 1，数据源对象
 2，数据源对象实现协议
 3，实行协议必须的方法
 */
- (NSArray *) apps {
    if(_apps == nil) {
        NSString * path = [[NSBundle mainBundle]pathForResource:@"appInfo.plist" ofType:nil];
        NSArray *arrayDic = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [NSMutableArray array];
        for(NSDictionary *dic in arrayDic) {
            // 创建模型
            AppModel *model = [AppModel appWithDic:dic];
            [arrayModels addObject:model];
        }
        _apps = arrayModels;
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableSections = 3;
    
    self.tableView.dataSource = self;
    
    [self loadAppInfo];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:5];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.tableSections = 2;
            [self.tableView reloadData];
        });
    });
}

- (void)loadAppInfo {
    // 每行应用个数
    int columns = 3;
    CGFloat viewWith = self.view.frame.size.width;
    CGFloat appW = 75;
    CGFloat appH = 90;
    CGFloat marginTop = 30;
    CGFloat marginX = (viewWith - columns * appW) / (columns + 1);
    CGFloat marginY = marginX;
    
    for(int i = 0; i < self.apps.count; i++) {
        // 获取当前应用的数据
        AppModel *model = self.apps[i];
        
        NSLog(@"-------------");
        
        // 加载xib文件
        AppModelView *appView = [AppModelView appModelView];
        
        CGFloat appX = marginX + (appW + marginX) * (i % 3);
        CGFloat appY = marginTop + (appH + marginY) * (i / 3);
        appView.frame = CGRectMake(appX, appY, appW, appH);
        [self.view addSubview:appView];
        
        appView.model = model;
        // appView.imageViewIcon.image = [UIImage imageNamed:model.appIcon];
        // appView.nameLabel.text = model.appName;
        // appView.backgroundColor = [UIColor orangeColor];
    }
}

- (void) loadAppInfoWithCode {
    // 每行应用个数
    int columns = 3;
    CGFloat viewWith = self.view.frame.size.width;
    CGFloat appW = 75;
    CGFloat appH = 90;
    CGFloat marginTop = 30;
    CGFloat marginX = (viewWith - columns * appW) / (columns + 1);
    CGFloat marginY = marginX;
    for(int i = 0; i < self.apps.count; i++) {
        // 获取当前应用的数据
        AppModel *model = self.apps[i];
        
        NSLog(@"-------------");
        UIView *appView = [[UIView alloc] init];
        
        // appView.backgroundColor = [UIColor orangeColor];
        
        CGFloat appX = marginX + (appW + marginX) * (i % 3);
        CGFloat appY = marginTop + (appH + marginY) * (i / 3);
        appView.frame = CGRectMake(appX, appY, appW, appH);
        
        [self.view addSubview:appView];
    
        // 创建一个icon
        UIImageView *imageViewIcon = [[UIImageView alloc] init];
        imageViewIcon.backgroundColor = [UIColor yellowColor];
        CGFloat iconW = 65;
        CGFloat iconH = 45;
        CGFloat iconX = (appView.frame.size.width - iconW) * 0.5;
        CGFloat iconY = 0;
        imageViewIcon.frame = CGRectMake(iconX, iconY, iconW, iconH);
        imageViewIcon.image = [UIImage imageNamed:model.appIcon];
        [appView addSubview:imageViewIcon];

        
        // 创建一个label
        UILabel * name = [[UILabel alloc] init];
        // name.backgroundColor = [UIColor redColor];
        CGFloat nameW = appView.frame.size.width;
        CGFloat nameH = 20;
        CGFloat nameY = iconH;
        CGFloat nameX = 0;
        name.frame = CGRectMake(nameX, nameY, nameW, nameH);
        name.text = model.appName;
        name.font = [UIFont systemFontOfSize:12];
        name.textAlignment = NSTextAlignmentCenter;
        [appView addSubview:name];
        
        // 创建一个button
        UIButton *btDownload = [[UIButton alloc] init];
        btDownload.backgroundColor = [UIColor greenColor];
        CGFloat btnW = iconW;
        CGFloat btnH = 20;
        CGFloat btnX = iconX;
        // CGFloat btnY = nameY + nameH;
        CGFloat btnY = CGRectGetMaxY(name.frame);
        btDownload.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btDownload setTitle:@"下载" forState:UIControlStateNormal];
        [btDownload setTitle:@"已安装" forState:UIControlStateDisabled];
        btDownload.titleLabel.font = [UIFont systemFontOfSize:14];
        [btDownload addTarget:self action:@selector(btDownloadClick) forControlEvents:UIControlEventTouchUpInside];
        [appView addSubview:btDownload];
    }
}

- (void) btDownloadClick {
    NSLog(@"点击了按钮");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - /** UITableView的数据源方法*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // 1、亚洲 2、欧洲 3、非洲
    return _tableSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 3;
    } else if(section == 1) {
        return 2;
    } else {
        return 1;
    }
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // indexPath.section
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.imageView.image = [UIImage imageNamed:@"beauty"];
    cell.detailTextLabel.text = @"萨勒芬妮";
    // indexPath.row
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            cell.textLabel.text = @"中国🇨🇳";
        } else if(indexPath.row == 1) {
            cell.textLabel.text = @"日本🇯🇵";
        } else {
            cell.textLabel.text = @"韩国🇰🇷";
        }
    } else if(indexPath.section == 1) {
        if(indexPath.row == 0) {
            cell.textLabel.text = @"德国🇩🇪";
        } else {
            cell.textLabel.text = @"法国🇫🇷";
        }
    } else {
        cell.textLabel.text = @"南非🇿🇦";
    }
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return @"亚洲";
    } else if(section == 1) {
        return @"欧洲";
    } else {
        return @"非洲";
    }
}

@end
