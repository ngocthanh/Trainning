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
#define numberMaximumZoonScale 4.0
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
                    self.image.image = image;
                     _frame= image.size.height/image.size.width;
                    
                    
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
    [self.image setUserInteractionEnabled:NO];
}
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    if (scale == numberMinimumZoomScale) {
        [self.image setUserInteractionEnabled:YES];

    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)rotation:(UIGestureRecognizer *)sender {
    [self.scrollViewZoom setScrollEnabled:NO];
    [self.scrollViewZoom.pinchGestureRecognizer setEnabled:NO];
    CGFloat rotation = [ (UIRotationGestureRecognizer*)sender rotation];
    CGAffineTransform transform = CGAffineTransformMakeRotation(rotation + _netRotation);
    sender.view.transform = transform;
    if (sender.state == UIGestureRecognizerStateEnded) {
        _netRotation += rotation;
    }
    
}
- (IBAction)tapAction:(id)sender {
    [self returnDefault];
}
- (IBAction)tapActionForScrollview:(id)sender {
    [self returnDefault];
}
-(void)returnDefault{
    [self.scrollViewZoom setScrollEnabled:YES];
    [self.scrollViewZoom.pinchGestureRecognizer setEnabled:YES];
        self.scrollViewZoom.zoomScale = numberMinimumZoomScale;
        [self.image setUserInteractionEnabled:YES];
        _netRotation = numberNetRotaion;
        [self setFrameForImage];    
}
-(void)initForClass{
    self.scrollViewZoom.minimumZoomScale=numberMinimumZoomScale;
    self.scrollViewZoom.maximumZoomScale=numberMaximumZoonScale;
    _netRotation = numberNetRotaion;

}
-(void)setFrameForImage{
    
    CGFloat heightView = self.view.frame.size.height;
    CGFloat widthView = self.view.frame.size.width;
    self.image.center = self.scrollViewZoom.center;
    CGRect size = self.image.frame ;
    size.size.height =  widthView*_frame;
    size.size.width = widthView;
    self.image.frame = size;
    self.scrollViewZoom.contentSize=self.image.image.size;

}
@end
