//
//  SWRAvatarView.h
//  JianshuMyPage
//
//  Created by Weiran Shi on 2015-12-06.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWRAvatarView : UIView

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, assign) CGFloat avatarRadiusMin;

- (instancetype)initWithAvatar:(NSString *)avatar minRadius:(CGFloat)minRadius frame:(CGRect)frame;
- (void)scaleWhenScroll: (UIScrollView *)scrollView;

@end
