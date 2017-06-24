//
//  DisplayedNewsViewController.m
//  DiscoverCollectionView
//
//  Created by KterKC on 6/23/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "DisplayedNewsViewController.h"
@interface DisplayedNewsViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webNewsView;

@end

@implementation DisplayedNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = titleSubView;
    [self getLinkNews];
}
-(void)getLinkNews{
    Helper *help = [[Helper alloc] init];
    [help loadWebViewWithURL:_url WebView:_webNewsView];


}




@end
