//
//  SWRTableViewController.m
//  JianshuMyPage
//
//  Created by Weiran Shi on 2015-12-06.
//  Copyright (c) 2015 Vera Shi. All rights reserved.
//

#import "SWRTableViewController.h"
#import "SWRAvatarView.h"
#import "SWREditButton.h"
#import "UIView+Extension.h"
#import "SWRTableViewCell.h"
#import "SWRArticle.h"
#import "SWRTabButton.h"
#import "SWRTabBarView.h"

@interface SWRTableViewController ()
{
    CGFloat _tabBarViewInitialY;
    NSMutableArray *_allArticles;
}

@property (nonatomic, strong) SWRAvatarView *avatarView;
@property (nonatomic, strong) SWRTabBarView *tabBarView;
@property (weak, nonatomic) IBOutlet UIView *headerView;

@end

@implementation SWRTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self avatarConfiguration];
    [self addEditButton];
    [self addData];
    [self addCustomTabBar];
    
    self.navigationItem.title = nil;
}

- (void)addCustomTabBar
{
    CGFloat tabBarViewH = 50;
    SWRTabBarView *tabBarView = [[SWRTabBarView alloc] initWithFrame:CGRectMake(0, self.headerView.height - tabBarViewH, self.view.width, tabBarViewH)];
    NSDictionary *buttonDict = @{
                                 @"动态": @NO,
                                 @"更多": @NO,
                                 @"文章": @YES
                                 };
    tabBarView.buttonDict = buttonDict;
    [self.headerView addSubview:tabBarView];
    _tabBarView = tabBarView;
    _tabBarViewInitialY = tabBarView.y;
}

- (void)addData
{
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"articles" ofType:@"plist"]];
    _allArticles = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in array){
        SWRArticle *article = [[SWRArticle alloc] initWithDict: dict];
        [_allArticles addObject:article];
    }
}

- (void)addEditButton
{
    SWREditButton *editButton = [[SWREditButton alloc] initWithButtonTitle:@"编辑个人资料" frame:CGRectMake(0, 0, 110, 36)];
    editButton.center = CGPointMake(self.view.width / 2, self.headerView.height - 100);
    [self.headerView addSubview:editButton];
}

- (void)avatarConfiguration
{
    CGFloat avatarRadiusMin = 16;
    CGFloat avatarHW = 78;
    CGFloat avatarX = self.view.center.x - avatarHW / 2;
    CGFloat avatarY = 44 - avatarHW / 2;
    
    SWRAvatarView *avatarView = [[SWRAvatarView alloc] initWithAvatar:@"luyou.jpeg" minRadius:avatarRadiusMin frame:CGRectMake(avatarX, avatarY, avatarHW, avatarHW)];
    [self.navigationController.navigationBar addSubview:avatarView];
    _avatarView = avatarView;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_avatarView scaleWhenScroll:scrollView];
    [_tabBarView shiftWhenScroll:scrollView headerViewHeight:self.headerView.height initialPositionY:_tabBarViewInitialY];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _allArticles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SWRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil){
        cell = [SWRTableViewCell cell];
    }
    SWRArticle *article = _allArticles[indexPath.row];
    cell.article = article;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

@end
