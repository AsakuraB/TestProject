//
//  ViewController.m
//  TestProject
//
//  Created by limx on 15/7/20.
//  Copyright (c) 2015年 limx. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+Awesome.h"
#import "ViewController2.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"XY夺宝";
    
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTitleTextAttributes:      @{NSForegroundColorAttributeName:[UIColor clearColor]}];

    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 35)];
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    iv.image = [UIImage imageNamed:@"category_nav"];
    [button addSubview:iv];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 25, 10)];
    label.text = @"分类";
    label.font = [UIFont systemFontOfSize:9];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithCustomView:button];
    [self.navigationItem setLeftBarButtonItem:left];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 35)];
    UIImageView *iv2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    iv2.image = [UIImage imageNamed:@"question"];
    [button2 addSubview:iv2];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 25, 10)];
    label2.text = @"疑问";
    label2.font = [UIFont systemFontOfSize:9];
    label2.textColor = [UIColor whiteColor];
    label2.textAlignment = NSTextAlignmentCenter;
    [button2 addSubview:label2];
    [button2 addTarget:self action:@selector(buttonPressed2) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:button2];
    [self.navigationItem setRightBarButtonItem:right];

    
//    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"321" style:UIBarButtonItemStyleBordered target:self action:@selector(showSomething:)];
//    [self.navigationItem setBackBarButtonItem:left];
    
    
}

- (void)buttonPressed
{
    NSLog(@"左边点击");
}

- (void)buttonPressed2
{
    NSLog(@"右边点击");
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ViewController2 *vc = [[ViewController2 alloc] init];
    vc.title = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.y + 64;
    NSLog(@"offset = %f", offset);
    
    if (offset > 30 && offset < 300) {
        CGFloat alpha = offset/300;
        [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor colorWithRed:236.0/255.0 green:84.0/255.0 blue:83.0/255.0 alpha:alpha]];
        [self.navigationController.navigationBar setTitleTextAttributes:      @{NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:alpha]}];
    } else if (offset < 30) {
        [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
        [self.navigationController.navigationBar setTitleTextAttributes:      @{NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:0]}];
    } else if (offset > 300) {
        [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor colorWithRed:236.0/255.0 green:84.0/255.0 blue:83.0/255.0 alpha:1]];
        [self.navigationController.navigationBar setTitleTextAttributes:      @{NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:1]}];
    }
    
    
}







@end
