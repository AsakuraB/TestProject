//
//  ViewController.m
//  TestProject
//
//  Created by limx on 15/7/20.
//  Copyright (c) 2015年 limx. All rights reserved.
//

#import "ViewController.h"
#import "View.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"321" style:UIBarButtonItemStyleBordered target:self action:@selector(showSomething:)];
//    [self.navigationItem setBackBarButtonItem:left];
    
    self.title = @"111";
    View *v = [[View alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    v.backgroundColor = [UIColor yellowColor];
    v.center = CGPointMake(100, 100);
    [self.view addSubview:v];
    

    
}

- (IBAction)buttonPressed:(UIButton *)sender
{
    UIStoryboard *sb1 = [UIStoryboard storyboardWithName:@"sb1" bundle:[NSBundle mainBundle]];
    UIViewController *vc = [sb1 instantiateViewControllerWithIdentifier:@"ViewController2"];
    [self.navigationController pushViewController:vc animated:YES];
}



- (IBAction)showSomething:(UIButton *)sender
{

    
    
    
    
    
    
    
    
}




@end
