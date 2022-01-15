//
//  ViewController01.m
//  ios_container_zgm
//
//  Created by 张国铭 on 2021/10/11.
//  Copyright © 2021 zgm. All rights reserved.
//

#import "HttpRequestController.h"

@interface HttpRequestController ()

@property (weak, nonatomic) IBOutlet UIButton *getButton;

@property (weak, nonatomic) IBOutlet UIButton *postButton;

@end

@implementation HttpRequestController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self testHttp];
}

- (void)testHttp {
    [_getButton addTarget:self action:@selector(httpGetRequest) forControlEvents:UIControlEventTouchUpInside];
}

- (void)httpGetRequest {
    NSLog(@"开始进行http get 请求");
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
