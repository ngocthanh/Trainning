//
//  ProfileUserViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "ProfileUserViewController.h"

@interface ProfileUserViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *videoAbout;
@property (weak, nonatomic) IBOutlet UIImageView *avaterUser;

@end

@implementation ProfileUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_videoAbout loadRequest:[[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:@"https://www.youtube.com/watch?v=MHG3n_-Y33A"]]];
    _avaterUser.layer.borderColor = [UIColor whiteColor].CGColor;
    _avaterUser.layer.borderWidth = 4;
    _avaterUser.layer.cornerRadius = _avaterUser.frame.size.width/2;
    _avaterUser.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
