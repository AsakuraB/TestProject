//
//  ViewController.m
//  TestProject
//
//  Created by limx on 15/7/20.
//  Copyright (c) 2015年 limx. All rights reserved.
//

#import "ViewController.h"
#import "LXReorderableCollectionViewFlowLayout.h"

@interface ViewController () 

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *xyLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *array = [NSArray arrayWithObjects:@"手电筒", @"计时器", @"计算器", @"XY助手", @"相机", @"手机加速", @"快速启动", @"添加", nil];
//    NSArray *array = [NSArray arrayWithObjects:@"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", @"1", nil];
    
    CGFloat leftPadding = 26;
    CGFloat margin = (self.view.frame.size.width - 52 - 240)/3;
    
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 100)];
    self.scrollView.backgroundColor = [UIColor yellowColor];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.xyLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 80, -30, 60, 30)];
    self.xyLabel.text = @"XY苹果助手";
    self.xyLabel.textAlignment = NSTextAlignmentCenter;
    self.xyLabel.textColor = [UIColor darkGrayColor];
    self.xyLabel.font = [UIFont systemFontOfSize:11.0];
    [self.scrollView addSubview:self.xyLabel];
    self.scrollView.clipsToBounds = NO;
    
    NSInteger pageCount;
    if (array.count != 0) {
        pageCount = (array.count - 1)/4 + 1;
    }
    CGSize contentSize = CGSizeMake(self.view.frame.size.width * pageCount, 100);
    self.scrollView.contentSize = contentSize;
    
    for (int i = 0; i < array.count; i++) {
        
        NSString *buttonTitle = array[i];
        
        UIButton *b = [[UIButton alloc] init];
        b.frame = CGRectMake(leftPadding + (i / 4) * self.view.frame.size.width + (i % 4) * (margin + 60), 20, 60, 60);
        b.backgroundColor = [UIColor greenColor];
//        [b setTitle:array[i] forState:UIControlStateNormal];
//        [b setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [b.titleLabel setFont:[UIFont systemFontOfSize:10]];
        
        [b.titleLabel setText:array[i]];
//        b.titleLabel.textColor = [UIColor blackColor];
//        NSLog(@"b.frame = %@", NSStringFromCGRect(b.frame));
        UIImageView *ivbg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        ivbg.backgroundColor = [UIColor clearColor];
        [ivbg setImage:[UIImage imageNamed:@"quick_toolbar_content_background_gray"]];
        [ivbg setHighlightedImage:[UIImage imageNamed:@"quick_toolbar_content_background_white"]];
        ivbg.alpha = 0.9;
        ivbg.tag = 9999;
        [b addSubview:ivbg];
        
        NSString *key = array[i];
        NSString *value = [[self defaultToolbarContentImageNameDic] objectForKey:key];
        NSString *imageName = [value stringByAppendingString:@"@2x"];
        
        UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
        iv.backgroundColor = [UIColor clearColor];
        [iv setImage:[UIImage imageNamed:value]];
        [b addSubview:iv];
        
        
//        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(-10, 47, 65, 15)];
//        l.text = key;
//        l.textColor = [UIColor darkGrayColor];
//        l.font = [UIFont systemFontOfSize:10.0];
//        l.textAlignment = NSTextAlignmentCenter;
//        [b addSubview:l];
//        [b setImage:[UIImage imageNamed:normalImageName] forState:UIControlStateNormal];
//        [b setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
        
        [b addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        [self.scrollView addSubview:b];
    }
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.scrollView];

}


- (void)buttonPressed:(UIButton *)sender
{
    BOOL enabled = YES;
    
    NSString *buttonTitle = sender.titleLabel.text;
    
    if ([sender.titleLabel.text isEqualToString:@""]) {
        
    }
//    UIImageView *ivbg = [sender viewWithTag:9999];
    
    for (UIView *v in sender.subviews) {
        if (v.tag == 9999) {
            UIImageView *iv = (UIImageView *)v;
            enabled = iv.isHighlighted;
            if (iv.isHighlighted) {
                NSLog(@"%@关闭", sender.titleLabel.text);
            } else {
                NSLog(@"%@打开", sender.titleLabel.text);
            }
            if (![[self arrayShouldNotHighlighted] containsObject:buttonTitle]) {
                iv.highlighted = !iv.highlighted;
            }
        }
//        if ([v isKindOfClass:[UIImageView class]]) {
//        }
    }
//    sender.selected = !sender.selected;
}







- (NSDictionary *)defaultToolbarContentImageNameDic
{
    NSDictionary *dic = @{
                          @"手电筒"        :@"quick_toolbar_content_flashlight",
                          @"计时器"        :@"quick_toolbar_content_timer",
                          @"计算器"        :@"quick_toolbar_content_calculator",
                          @"XY助手"       :@"quick_toolbar_content_xyjb",
                          @"相机"         :@"quick_toolbar_content_camera",
                          @"手机加速"       :@"quick_toolbar_content_accelerator",
                          @"快速启动"       :@"quick_toolbar_content_quickstart",
                          @"添加"         :@"quick_toolbar_content_add",
                          @"空"         :@"quick_toolbar_content_empty",
                          };
    return dic;
}

- (NSArray *)arrayShouldNotHighlighted
{
    return @[@"主屏幕", @"均衡器", @"音量增强", @"音量减弱", @"关机", @"注销", @"重启", @"锁屏", @"VPN"];
}





@end
