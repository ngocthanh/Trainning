//
//  DetailPhotoViewController.h
//  Photo Design
//
//  Created by KterKC on 6/26/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "Helper.h"
#import "PhotoOfUser.h"
@interface DetailPhotoViewController : UIViewController<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet  UIImageView *image;

@property (strong, nonatomic) PhotoOfUser *photoUser;
@end


//In your ViewController A
//
//1) Declare a typedef for block say typedef void (^simpleBlock)(NSString*);
//
//2) Create a block variable like
//
//@property(nonatomic,strong)simpleBlock  aSimpleBlock;
//3) Define this block in viewDidAppear / viewDidLoad
//
//aSimpleBlock = ^(NSString* str){
//    NSLog(@"Str is the string passed on tableView Cell Click..!!");
//};
//In your ViewController B Where you have tableView
//
//1) In -(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//
//just call your block as
//
//your_VC_A_Object.aSimpleBlock("Your_Label_String_here");
