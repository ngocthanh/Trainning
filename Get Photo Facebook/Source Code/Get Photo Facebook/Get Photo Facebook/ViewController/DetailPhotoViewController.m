//
//  DetailPhotoViewController.m
//  Photo Design
//
//  Created by KterKC on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "DetailPhotoViewController.h"

@interface DetailPhotoViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewZoom;
@property  CGFloat netRotation;

@end

@implementation DetailPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _scrollViewZoom.delegate=self;
    self.scrollViewZoom.minimumZoomScale=1.0;
    self.scrollViewZoom.maximumZoomScale=4.0;
    _netRotation = 0.0;
    _image.image = [UIImage imageWithData:_dataImage];
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)rotation:(UIGestureRecognizer *)sender {
    CGFloat rotation = [ (UIRotationGestureRecognizer*)sender rotation];
    CGAffineTransform transform = CGAffineTransformMakeRotation(rotation + _netRotation);
    sender.view.transform = transform;
    if (sender.state == UIGestureRecognizerStateEnded) {
        _netRotation += rotation;
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
