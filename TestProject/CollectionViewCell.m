//
//  CollectionViewCell.m
//  TestProject
//
//  Created by limx on 16/1/6.
//  Copyright © 2016年 limx. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.label];
    }
    return self;
}


- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
        _label.textColor = [UIColor blackColor];
    }
    return _label;
}


@end
