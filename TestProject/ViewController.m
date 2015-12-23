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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 200;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.textColor = [UIColor blackColor];
    
    NSInteger index = indexPath.row % 7;
    switch (index) {
        case 0:
            cell.contentView.backgroundColor = [UIColor redColor];
            break;
            
        case 1:
            cell.contentView.backgroundColor = [UIColor orangeColor];
            break;
            
        case 2:
            cell.contentView.backgroundColor = [UIColor yellowColor];
            break;
            
        case 3:
            cell.contentView.backgroundColor = [UIColor greenColor];
            break;
            
        case 4:
            cell.contentView.backgroundColor = [UIColor blueColor];
            break;
            
        case 5:
            cell.contentView.backgroundColor = [UIColor purpleColor];
            break;
            
        case 6:
            cell.contentView.backgroundColor = [UIColor blackColor];
            break;
            
        default:
            break;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", cell.contentView.backgroundColor];

    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGAffineTransform transformScale = CGAffineTransformMakeScale(0.8, 0.8);
    CGAffineTransform transformTranslate = CGAffineTransformMakeTranslation(0, 0);
    
    cell.contentView.transform = CGAffineTransformConcat(transformScale, transformTranslate);
    cell.contentView.alpha = 0.65;
    
    [self.tableView bringSubviewToFront:cell.contentView];
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.contentView.alpha = 1;
                         //clear the transform
                         cell.contentView.transform = CGAffineTransformIdentity;
                     } completion:nil];

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


@end
