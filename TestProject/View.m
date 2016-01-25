//
//  View.m
//  TestProject
//
//  Created by limx on 16/1/23.
//  Copyright © 2016年 limx. All rights reserved.
//

#import "View.h"

@implementation View

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil];
        
        self.view.frame = frame;
        [self addSubview:self.view];

    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil];
        
        [self addSubview:self.view];
    }
    return self;
}





@end
