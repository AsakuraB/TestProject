//
//  ViewController.m
//  TestProject
//
//  Created by limx on 15/7/20.
//  Copyright (c) 2015年 limx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"321" style:UIBarButtonItemStyleBordered target:self action:@selector(showSomething:)];
//    [self.navigationItem setBackBarButtonItem:left];
    
    self.title = @"111";

    
}

- (IBAction)buttonPressed:(UIButton *)sender
{
    UIStoryboard *sb1 = [UIStoryboard storyboardWithName:@"sb1" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [sb1 instantiateViewControllerWithIdentifier:@"ViewController2"];
    [self.navigationController pushViewController:vc animated:YES];
}



- (IBAction)showSomething:(UIButton *)sender
{
    NSLog(@"showSomethingPressed");
    
    
}




@end
