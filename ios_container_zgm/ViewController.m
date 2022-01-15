//
//  ViewController.m
//  ios_container_zgm
//
//  Created by 张国铭 on 2021/10/2.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *argOne;

@property (weak, nonatomic) IBOutlet UITextField *argTwo;

@property (weak, nonatomic) IBOutlet UILabel *computeResult;

@property (weak, nonatomic) IBOutlet UIButton *pyy;


- (IBAction)btCompute;

- (IBAction)remove:(UIButton *)sender;

- (IBAction)resize:(UIButton *)sender;

// qq登录
- (IBAction)login;

@property (weak, nonatomic) IBOutlet UITextField *txtQQ;

@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

- (IBAction)tranMove;

- (IBAction)tranTransform;

- (IBAction)scale;

- (IBAction)resetRotate;

- (IBAction)jumpToSecondPage;

- (IBAction)jumpToThirdPage;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [[UIButton alloc]init];
    
    [button setBackgroundImage:[UIImage imageNamed:@"brain"] forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:@"body"] forState:UIControlStateHighlighted];
    
    [button setTitle:@"手动添加" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(logButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect frame = CGRectMake(10, 350, 100, 50);
    
    button.frame = frame;
    
    [self.view addSubview:button];
    
    }

-(void) logButtonClick {
    NSLog(@"手动添加点击事件，不用连线的方式");
}

- (IBAction)login {
    NSString *qq = self.txtQQ.text;
    NSString *pwd = self.txtPassword.text;
    
    NSLog(@"QQ: %@, password: %@", qq, pwd);
    [self.view endEditing:YES];
    
}


- (IBAction)resize:(UIButton *)sender {
    CGRect frame = self.pyy.frame;
    // CGRect frame = self.pyy.bounds;
    switch(sender.tag) {
        case 50:
            frame.size.width *= 1.1;
            frame.size.height *= 1.1;
            break;
        case 60:
            frame.size.width *= 0.9;
            frame.size.height *= 0.9;
            break;
    }
    [UIView animateWithDuration:1 animations:^{
        self.pyy.frame = frame;
    }];
}

- (IBAction)remove:(UIButton *)sender {
    // CGRect frame = self.pyy.frame;
    CGPoint frame = self.pyy.center;
    
    switch(sender.tag) {
        case 10:
            // frame.origin.y -= 10;
            frame.y -= 10;
            break;
        case 20:
            // frame.origin.x += 10;
            frame.x += 10;
            break;
        case 30:
            // frame.origin.y += 10;
            frame.y += 10;
            break;
        case 40:
            // frame.origin.x -= 10;
            frame.x -= 10;
            break;
        default:
            break;
    }
    // self.pyy.frame = frame;
    [UIView animateWithDuration:1 animations:^{
        self.pyy.center = frame;
    }];
}

- (IBAction)btCompute {
    NSString *numOne = _argOne.text;
    NSString *numTwo = _argTwo.text;
    
    int n1 = numOne.intValue;
    int n2 = [numTwo intValue];
    
    NSString *result = [NSString stringWithFormat:@"%d", n1+n2];
    _computeResult.text = result;
    
    [self.view endEditing:YES];
}

- (IBAction)learnUITableView {
}

- (IBAction)jumpToThirdPage {
//    ViewController02 *vc = [[ViewController02 alloc] initWithNibName:@"ViewController02" bundle:nil];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)jumpToSecondPage {
    NSLog(@"执行了跳转");

    // 不带任何布局文件的跳转可以采用下面这种方式
    //    ViewController01 *secondView = [[ViewController01 alloc] init];
//    [self.navigationController pushViewController:secondView animated:YES];
}

- (IBAction)resetRotate {
    self.pyy.transform = CGAffineTransformIdentity;
}

- (IBAction)scale {
    [UIView animateWithDuration:1 animations:^{
            self.pyy.transform = CGAffineTransformScale(self.pyy.transform, 1.5, 1.5);
    }];
}

- (IBAction)tranTransform {
    [UIView animateWithDuration:1 animations:^{
            self.pyy.transform = CGAffineTransformRotate(self.pyy.transform, M_PI_4);
    }];
}

- (IBAction)tranMove {
    [UIView animateWithDuration:1 animations:^{
            self.pyy.transform = CGAffineTransformTranslate(self.pyy.transform, 10, 10);
    }];
}

- (IBAction)setLocalNotification {
    NSDate *now = [NSDate date];
    UILocalNotification *reminderNotification = [[UILocalNotification alloc] init];
    [reminderNotification setFireDate:[now dateByAddingTimeInterval:15]];
    [reminderNotification setTimeZone:[NSTimeZone defaultTimeZone]];
    [reminderNotification setAlertBody:@"开始同步轨迹数据"];
    [reminderNotification setAlertAction:@"同步"];
    [reminderNotification setSoundName:UILocalNotificationDefaultSoundName];
    [reminderNotification setApplicationIconBadgeNumber:1];
    [[UIApplication sharedApplication] scheduleLocalNotification:reminderNotification];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Reminder" message:@"提醒已设置" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"OK thanks" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
    
    [alert addAction:dismissAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}


@end
