//
//  ViewController.m
//  TestProject
//
//  Created by limx on 15/7/20.
//  Copyright (c) 2015年 limx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIImageView *headerView;

@property (nonatomic, strong) UIImageView *shareImageView;

@property (nonatomic, strong) UIView *statusBarBackgroundView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.shareImageView];
    [self.view addSubview:self.statusBarBackgroundView];
    
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    //  记得remove Observer
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    cell.backgroundColor = [UIColor blackColor];
    
    return cell;
}





- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    CGFloat offset = self.tableView.contentOffset.y;
    NSLog(@"tableView.offset = %f", offset);
    CGFloat height = offset > 160 ? 10 : (170-offset);
    self.shareImageView.frame = CGRectMake(300, height, 60, 60);
    if (offset > 180) {
        [UIView animateWithDuration:0.3 animations:^{
            self.statusBarBackgroundView.backgroundColor = [UIColor whiteColor];
        }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.statusBarBackgroundView.backgroundColor = [UIColor clearColor];
        }];
    }
    if (offset > 0) {
        //  向上滑动
        self.headerView.frame = CGRectMake(0, -offset, self.view.frame.size.width, 200);
    } else {
        self.headerView.frame = CGRectMake(offset, 0, self.view.frame.size.width - 2*offset, 200 - offset);
    }
}



- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _tableView.backgroundColor = [UIColor yellowColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}



- (UIImageView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        _headerView.backgroundColor = [UIColor blackColor];
        _headerView.image = [UIImage imageNamed:@"111.jpg"];
        _headerView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _headerView;
}

- (UIImageView *)shareImageView
{
    if (!_shareImageView) {
        _shareImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 170, 60, 60)];
        _shareImageView.image = [UIImage imageNamed:@"111.jpg"];
        _shareImageView.layer.cornerRadius = 30;
        _shareImageView.layer.masksToBounds = YES;
        _shareImageView.layer.borderColor = [UIColor grayColor].CGColor;
        _shareImageView.layer.borderWidth = 1;
        
    }
    return _shareImageView;
}

- (UIView *)statusBarBackgroundView
{
    if (!_statusBarBackgroundView) {
        _statusBarBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
        _statusBarBackgroundView.backgroundColor = [UIColor clearColor];
    }
    return _statusBarBackgroundView;
}



@end
