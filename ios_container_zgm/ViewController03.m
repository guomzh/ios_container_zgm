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

@property (weak, nonatomic) IBOutlet UILabel *indexLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, assign)int allCount;


@end

@implementation ViewController03

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setContentImage:[self pic][_index]];
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
        _pic = array;
        _allCount = (int)array.count;
        NSLog(@"count: %ld", array.count);
    }
    return _pic;
}

- (IBAction)prePic {
    self.index--;
    if(_index == -1) {
        _index = 2;
    }
    NSDictionary *dic = self.pic[self.index];
    [self setContentImage:dic];
}

- (IBAction)nextPic {
    self.index++;
    if(_index == 3) {
        _index = 0;
    }
    NSDictionary *dic = self.pic[self.index];
    [self setContentImage:dic];
}

-(void) setContentImage: (NSDictionary *)dic {
    NSString *title = [dic valueForKey:@"title"];
    NSString *icon = [dic valueForKey:@"icon"];
    NSString *index = [NSString stringWithFormat:@"%d/%d",_index+1, _allCount];
    _imageView.image = [UIImage imageNamed:icon];
    _indexLabel.text = index;
    _titleLabel.text = title;
}

@end
