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
    [self setDataForSelf];
    
}
-(void)setDataForSelf{
    NSString *linkImage = _photoUser.linkOriPhoto;
    NSString *idImage = _photoUser.idPhoto;
    [[[Helper alloc] init] lazyLoadingForImage:linkImage IDImage:idImage Success:^(NSData *dataImage) {
        if (dataImage) {
            UIImage *image = [UIImage imageWithData:dataImage];
            //NSLog(@"%f ---------- %f",,image.size.width);
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.image.image = image;
                    CGFloat frame= image.size.height/image.size.width;
                    if (frame > 1) {
                        [self.image setFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) ]  ;
                    }else{

                    }
                    
                });
            }
        }
        
    } Failure:^(NSError *error) {
        
    }];
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



@end
