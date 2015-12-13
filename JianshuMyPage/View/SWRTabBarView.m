//
//  SWRTabBarView.m
//  JianshuMyPage
//
//  Created by Weiran Shi on 2015-12-10.
//  Copyright © 2015 Vera Shi. All rights reserved.
//

#import "SWRTabBarView.h"
#import "SWRTabButton.h"

@interface SWRTabBarView ()

@end

@implementation SWRTabBarView

- (void)shiftWhenScroll:(UIScrollView *)scrollView headerViewHeight:(CGFloat)headerViewHeight initialPositionY:(CGFloat)initialPositionY
{
    if (scrollView.contentOffset.y + 64 >= headerViewHeight - self.frame.size.height){
        CGRect frame = self.frame;
        frame.origin.y = initialPositionY + scrollView.contentOffset.y + 64 - (headerViewHeight - self.frame.size.height);
        self.frame = frame;
    }
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor *tintGray = [UIColor colorWithWhite:0.8 alpha:1.0];
    CGContextSetStrokeColorWithColor(context, tintGray.CGColor);
    CGContextSetLineWidth(context, 1.0f);
    CGContextMoveToPoint(context, 0.0f, 0.0f);
    CGContextAddLineToPoint(context, self.frame.size.width, 0.0f);
    CGContextStrokePath(context);
    CGContextMoveToPoint(context, 0.0f, self.frame.size.height);
    CGContextAddLineToPoint(context, self.frame.size.width, self.frame.size.height);
    CGContextStrokePath(context);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setButtonDict:(NSDictionary *)buttonDict
{
    _buttonDict = buttonDict;
    int buttonNum = buttonDict.count;
    CGFloat margin = 50;
    CGFloat buttonWidth = (self.frame.size.width - 2 * margin) / buttonNum;
    
    for (int i = 0; i < buttonDict.count; i++){
        NSString *buttonTitle = buttonDict.allKeys[i];
        SWRTabButton *button = [[SWRTabButton alloc] initWithButtonTitle:buttonTitle frame:CGRectMake(0, 0, 50, 50)];
        button.center = CGPointMake(margin + i * buttonWidth + buttonWidth / 2, button.frame.size.height / 2);
        button.selected = [(NSNumber *)buttonDict[buttonTitle] boolValue];
        [self addSubview:button];
    }
}

@end
