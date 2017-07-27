//
//  MarketPlaceFeaturedPostCollectionViewCell.m
//  NeandrTalk
//
//  Created by dankhanh on 7/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "MarketPlaceFeaturedPostCollectionViewCell.h"
#import "TagsPostTableViewCell.h"
@implementation MarketPlaceFeaturedPostCollectionViewCell
-(void)getData:(PostModel *)post{
    self.featuredMarketImage.image = [UIImage imageNamed:post.primaryImage];
    self.featuredMarketTitle.text = post.title;
    self.featuredMarketType.text=[NSString stringWithFormat:@" %@ ",post.marketType];
    self.featuredMarketPrice.text=[NSString stringWithFormat:@" $%@ ",post.price];
    self.arrayTag = post.arrayTags;

    [self setStyle];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = _height/5;
    return height;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TagsPostTableViewCell *cell = [_tableTags dequeueReusableCellWithIdentifier:@"tagCellF" forIndexPath:indexPath];
    [cell getData:_arrayTag[indexPath.section]];
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_arrayTag count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view  = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
-(void)setStyle{
    _tableTags.backgroundColor = nil;
    _height = self.tableTags.frame.size.height;
    
    
}
@end
