//
//  AppModel.m
//  ios_container_zgm
//
//  Created by 张国铭 on 2022/1/7.
//  Copyright © 2022 zgm. All rights reserved.
//

#import "AppModel.h"

@implementation AppModel

- (instancetype)initWithDic:(NSDictionary *) dic {
    if(self = [super init]) {
        self.appName = dic[@"appName"];
        self.appIcon = dic[@"appIcon"];
    }
    return self;
}

+ (instancetype)appWithDic:(NSDictionary *) dic {
    return [[self alloc] initWithDic:dic];
}

@end
