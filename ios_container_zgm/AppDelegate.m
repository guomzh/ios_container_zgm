//
//  AppDelegate.m
//  ios_container_zgm
//
//  Created by 张国铭 on 2021/10/2.
//

#import "AppDelegate.h"

@interface AppDelegate ()

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


@end
