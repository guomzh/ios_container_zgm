//
//  AppModelView.h
//  ios_container_zgm
//
//  Created by 张国铭 on 2022/1/8.
//  Copyright © 2022 zgm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class AppModel;
@interface AppModelView : UIView

@property (nonatomic, strong) AppModel *model;

@end

NS_ASSUME_NONNULL_END
