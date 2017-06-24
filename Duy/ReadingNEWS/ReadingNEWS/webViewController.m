//
//  webViewController.m
//  ReadingNEWS
//
//  Created by dankhanh on 6/23/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import "webViewController.h"
#import "defineApp.h"

@interface webViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation webViewController

- (void)viewDidLoad {
    self.title = detailsTitle;
    [super viewDidLoad];
    if (_url != nil) {
        NSURL *url = [[NSURL alloc] initWithString:_url];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        [_webView loadRequest:request];
    }
}



@end
