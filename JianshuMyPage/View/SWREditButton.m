//
//  SWREditButton.m
//  JianshuMyPage
//
//  Created by Weiran Shi on 2015-12-09.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

#import "SWREditButton.h"


@implementation SWREditButton


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        UIColor *tintGreen = [UIColor colorWithRed:98/255.0 green:197/255.0 blue:80/255.0 alpha:0.9];
        [self setTitleColor:tintGreen forState:UIControlStateNormal];
    }
    return self;
}

- (instancetype)initWithButtonTitle:(NSString *)buttonTitle frame:(CGRect)frame
{
    [self setTitle:buttonTitle forState:UIControlStateNormal];
    return [self initWithFrame:frame];
}


- (void)drawRect:(CGRect)rect {
    self.layer.cornerRadius = 4.0f;
    self.layer.borderWidth = 0.8f;
    UIColor *tintGreen = [UIColor colorWithRed:98/255.0 green:197/255.0 blue:80/255.0 alpha:0.9];
    self.layer.borderColor = tintGreen.CGColor;
}

@end
