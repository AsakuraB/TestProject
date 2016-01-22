//
//  ViewController1.m
//  TestProject
//
//  Created by limx on 16/1/8.
//  Copyright © 2016年 limx. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController2.h"

@interface ViewController1 ()<UIGestureRecognizerDelegate>

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.interactivePopGestureRecognizer.delegate  = self;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"ViewController1" forState:UIControlStateNormal];
    
    button.frame = self.view.bounds;
    [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)push
{
    NSLog(@"asdfsadf");
    ViewController2 *vc2 = [[ViewController2 alloc] init];
    [self.navigationController pushViewController:vc2 animated:YES];
}



@end
