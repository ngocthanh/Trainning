//
//  NewFeedViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "NewFeedViewController.h"
#import "NewFeedsHomeTableViewCell.h"
#import "NewFeedsPostTableViewCell.h"
#define idHomeCell @"homeTableViewCell"
#define idPostCell @"postTableViewCell"
#define idOrderByCell @"oderByCell"


@interface NewFeedViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableNewFeeds;

@end

@implementation NewFeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        NewFeedsHomeTableViewCell *cell=[_tableNewFeeds dequeueReusableCellWithIdentifier:idHomeCell forIndexPath:indexPath];
        
        return  cell;
    }
    else if (indexPath.row==2){
        NewFeedsPostTableViewCell *cell=[_tableNewFeeds dequeueReusableCellWithIdentifier:idPostCell forIndexPath:indexPath];
        [cell getData:self];
        return cell;
    }
    else
    {
        NewFeedsHomeTableViewCell *cell=[_tableNewFeeds dequeueReusableCellWithIdentifier:idOrderByCell forIndexPath:indexPath];
        return cell;
        
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return _tableNewFeeds.frame.size.height/2.5;
    }
    else if (indexPath.row==2)
    {
        return _tableNewFeeds.frame.size.height/1.4;
    }
    else
    {
        return 45;
    }
}

@end
