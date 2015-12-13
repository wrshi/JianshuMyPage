//
//  SWRArticle.m
//  JianshuMyPage
//
//  Created by Weiran Shi on 2015-12-10.
//  Copyright © 2015 Vera Shi. All rights reserved.
//

#import "SWRArticle.h"

@implementation SWRArticle

- (instancetype)initWithDict: (NSDictionary *)dict
{
    if (self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
