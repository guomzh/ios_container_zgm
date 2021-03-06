//
//  AppDelegate.m
//  ios_container_zgm
//
//  Created by 张国铭 on 2021/10/2.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate () <UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_01" bundle:nil];
//    UIViewController *rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"ViewController_01"];
//    self.window.rootViewController = rootViewController;
//    self.viewController = [[ViewController_01 alloc] initWithNibName:@"ViewController_01" bundle:nil];
//    self.window.rootViewController = self.viewController;
    //注册本地推送
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound)
                          completionHandler:^(BOOL granted, NSError * _Nullable error) {
                              
                          }];
    
    //获取当前的通知设置
    [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
        
    }];
        
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSString *message = [notification alertBody];
    
    NSString *appState = ([application applicationState] == UIApplicationStateActive) ? @"app Active": @"app in background";
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"接受到通知内容： %@ , 此时app状态： %@", message, appState);
        for(int i = 0; i < 5; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"======异步线程中睡眠%ds=======", i+1);
        }
        
        if([appState isEqualToString:@"app Active"]) {
            NSLog(@"app Active , 开始异步线程切主线程更新UI");
            dispatch_async(dispatch_get_main_queue(), ^{
                UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
                UIViewController *topVC = appRootVC;
                if (topVC.presentedViewController) {
                    NSLog(@"根控制器上面还有控制器");
                    topVC = topVC.presentedViewController;
                  
                }
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"异步线程中" message:@"更新UI" preferredStyle:UIAlertControllerStyleAlert];
                
                UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Ok， 更新成功！" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                    [topVC dismissViewControllerAnimated:YES completion:nil];
                }];
                
                [alert addAction:dismissAction];
                
                [topVC presentViewController:alert animated:YES completion:nil];
            });
        }
    });
}

@end
