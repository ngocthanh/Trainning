//
//  DetailPhotoViewController.m
//  Photo Design
//
//  Created by KterKC on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "DetailPhotoViewController.h"

#define frameState 1
#define originalX 0
#define originalY 0
#define numberMinimumZoomScale 1.0
#define numberMaximumZoonScale 2.0
#define numberNetRotaion 0.0
#define valueTotalHeightOfNavibarAndTabbar 108
#define numberSpaceOfBetweenViewAndImage 2
@interface DetailPhotoViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewZoom;
@property  CGFloat netRotation;
@property CGFloat frame;
@end

@implementation DetailPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollViewZoom.delegate=self;
    [self initForClass];
    [self setDataForSelf];
    
}
-(void)setDataForSelf{
    NSString *linkImage = _photoUser.linkOriPhoto;
    NSString *idImage = _photoUser.idPhoto;
    [[[Helper alloc] init] lazyLoadingForImage:linkImage IDImage:idImage Success:^(NSData *dataImage) {
        if (dataImage) {
            UIImage *image = [UIImage imageWithData:dataImage];
            if (image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    _image = [[UIImageView alloc] initWithImage:image];
                    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
                    [_image addGestureRecognizer:rotationGesture];
                    [_image setUserInteractionEnabled:YES];
                    [self setFrameForImage];
                        
                    
                });
            }
        }
        
    } Failure:^(NSError *error) {
        
    }];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _image;
}
-(void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
    [_image setUserInteractionEnabled:NO];
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    if (scale == numberMinimumZoomScale) {
        [_image setUserInteractionEnabled:YES];

    }
}
- (IBAction)tapActionForScrollview:(id)sender {
    [self returnDefault];
}
-(void)returnDefault{
    [self.scrollViewZoom setScrollEnabled:YES];
    [self.scrollViewZoom.pinchGestureRecognizer setEnabled:YES];
    self.scrollViewZoom.zoomScale = numberMinimumZoomScale;
    [_image setUserInteractionEnabled:YES];
    _netRotation = numberNetRotaion;
    [self setFrameForImage];
}
-(void)initForClass{
    self.scrollViewZoom.minimumZoomScale=numberMinimumZoomScale;
    self.scrollViewZoom.maximumZoomScale=numberMaximumZoonScale;
    _netRotation = numberNetRotaion;
}
-(void)setFrameForImage{
    
    CGFloat heightView = self.scrollViewZoom.frame.size.height;
    CGFloat widthView = self.scrollViewZoom.frame.size.width;
    self.scrollViewZoom.frame = self.view.frame;
    [self.scrollViewZoom setClipsToBounds:YES];
    [_image setContentMode:UIViewContentModeScaleAspectFit];
    [_image setFrame:CGRectMake(originalX, originalY, widthView,heightView)];
    [_scrollViewZoom addSubview:_image];
}
- (void)rotation:(UIRotationGestureRecognizer *)sender {
    [self.scrollViewZoom setScrollEnabled:NO];
    [self.scrollViewZoom.pinchGestureRecognizer setEnabled:NO];
    sender.view.transform = CGAffineTransformRotate(sender.view.transform, sender.rotation);
    sender.rotation = 0;
    
}
@end
