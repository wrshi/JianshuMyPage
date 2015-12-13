//
//  SWRTabBarView.h
//  JianshuMyPage
//
//  Created by Weiran Shi on 2015-12-10.
//  Copyright © 2015 Vera Shi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWRTabBarView : UIView

// [NSSting: BOOL] -> [title: selected]
@property (nonatomic, strong) NSDictionary *buttonDict;

- (void)shiftWhenScroll:(UIScrollView *)scrollView headerViewHeight:(CGFloat)headerViewHeight initialPositionY:(CGFloat)initialPositionY;

@end
