//
//  AppModel.h
//  ios_container_zgm
//
//  Created by 张国铭 on 2022/1/7.
//  Copyright © 2022 zgm. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AppModel : NSObject

@property (nonatomic, copy) NSString *appIcon;
@property (nonatomic, copy) NSString *appName;

- (instancetype)initWithDic:(NSDictionary *) dic;
+ (instancetype)appWithDic:(NSDictionary *) dic;

@end

NS_ASSUME_NONNULL_END
