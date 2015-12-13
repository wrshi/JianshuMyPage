//
//  SWRArticle.h
//  JianshuMyPage
//
//  Created by Weiran Shi on 2015-12-10.
//  Copyright © 2015 Vera Shi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWRArticle : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *photo;

- (instancetype)initWithDict: (NSDictionary *)dict;

@end
