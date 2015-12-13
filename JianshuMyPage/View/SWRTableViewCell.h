//
//  SWRTableViewCell.h
//  JianshuMyPage
//
//  Created by Weiran Shi on 2015-12-10.
//  Copyright © 2015 Vera Shi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SWRArticle;

@interface SWRTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (nonatomic, strong) SWRArticle *article;

+ (instancetype)cell;

@end
