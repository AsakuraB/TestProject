//
//  ViewController2.m
//  TestProject
//
//  Created by limx on 16/1/22.
//  Copyright © 2016年 limx. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad
{
    [super viewDidLoad];
//    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"123" style:UIBarButtonItemStyleBordered target:self action:@selector(showSomething2:)];
//    [self.navigationItem setLeftBarButtonItem:left];
//    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithTitle:@"12333" style:UIBarButtonItemStyleBordered target:self action:@selector(showSomething2:)];
//    [self.navigationItem setBackBarButtonItem:back];
    self.title = @"222";
    
}





- (IBAction)buttonPressed:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)showSomething2:(id)sender
{
    NSLog(@"showSomething2Pressed");
    self.title = @"askdjf;";
}











@end
