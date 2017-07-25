//
//  LandingPagePostCollectionViewCell.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "LandingPagePostCollectionViewCell.h"

@implementation LandingPagePostCollectionViewCell
-(void)getData:(PostModel *)post{
    self.img.image = [UIImage imageNamed:post.primaryImage];
    self.titlePost.text = post.title;
    if (post.descriptionPost != nil) {
        self.descriptionPost.text = post.descriptionPost;
    }
}
@end
