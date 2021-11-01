//
//  ViewController03.m
//  ios_container_zgm
//
//  Created by 张国铭 on 2021/11/1.
//  Copyright © 2021 zgm. All rights reserved.
//

#import "ViewController03.h"

@interface ViewController03 ()

@property(nonatomic, strong)NSArray *pic;

@property(nonatomic, assign)int index;

@end

@implementation ViewController03

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self pic];
    self.pic;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSArray *) pic
{
    if(_pic == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"pic.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSLog(@"count: %ld", array.count);
    }
    return _pic;
}

- (IBAction)prePic {
    
}

- (IBAction)nextPic {
    self.index++;
    self.pic[self.index]
}

@end
