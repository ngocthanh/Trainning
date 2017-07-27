
//
//  ProfileRestaurantUserViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "ProfileRestaurantUserViewController.h"

@interface ProfileRestaurantUserViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *videoAbout;
@property (weak, nonatomic) IBOutlet UIImageView *avatarUserRestaurant;

@end

@implementation ProfileRestaurantUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_videoAbout loadRequest:[[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"https://www.youtube.com/embed/MHG3n_-Y33A"]]];
    _avatarUserRestaurant.layer.borderColor = [UIColor whiteColor].CGColor;
    _avatarUserRestaurant.layer.borderWidth = 4;
    _avatarUserRestaurant.layer.cornerRadius = _avatarUserRestaurant.frame.size.width/2;
    _avatarUserRestaurant.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
