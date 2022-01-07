//
//  AppModelView.m
//  ios_container_zgm
//
//  Created by 张国铭 on 2022/1/8.
//  Copyright © 2022 zgm. All rights reserved.
//

#import "AppModelView.h"
#import "AppModel.h"

@interface AppModelView()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UIButton *btDownload;

@end

@implementation AppModelView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 重写model属性的set方法
- (void)setModel:(AppModel *)model {
    _model = model;
    self.imageViewIcon.image = [UIImage imageNamed:model.appIcon];
    self.nameLabel.text = model.appName;
}

@end
