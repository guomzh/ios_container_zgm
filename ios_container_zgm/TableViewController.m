//
//  UITableViewController.m
//  ios_container_zgm
//
//  Created by 张国铭 on 2022/1/2.
//  Copyright © 2022 zgm. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TableViewController

/**
 1，数据源对象
 2，数据源对象实现协议
 3，实行协议必须的方法
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
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
    return 3;
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
