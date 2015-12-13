//
//  SWRTableViewCell.m
//  JianshuMyPage
//
//  Created by Weiran Shi on 2015-12-10.
//  Copyright © 2015 Vera Shi. All rights reserved.
//

#import "SWRTableViewCell.h"
#import "SWRArticle.h"

@implementation SWRTableViewCell

+ (instancetype)cell
{
    return [[[NSBundle mainBundle] loadNibNamed:@"SWRTableViewCell" owner:nil options:nil] firstObject];
}

- (void)setArticle:(SWRArticle *)article
{
    _article = article;
    if (article.photo){
        self.photoView.image = [UIImage imageNamed:article.photo];
        self.photoView.contentMode = UIViewContentModeScaleAspectFill;
    }
    else{
        self.photoView.backgroundColor = [UIColor clearColor];
    }
    self.titleLabel.text = article.title;
    self.timeLabel.text = article.time;
}

- (void)layoutSubviews
{
    self.photoView.layer.cornerRadius = 5.0f;
    self.photoView.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
