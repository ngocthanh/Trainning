//
//  CommentViewController.m
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentTableViewCell.h"
#import "CommentModel.h"
#import "ParserService.h"
#define kOFFSET_FOR_KEYBOARD 80.0
@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_tbvComment registerNib:[UINib nibWithNibName:@"CommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyCell"];
    [self parser];

    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    numberToolbar.items = [NSArray arrayWithObjects:
                           
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(keyboardWillHide)],
                           nil];
    [numberToolbar sizeToFit];
    _txtvComment.inputAccessoryView = numberToolbar;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}
-(void)viewDidAppear:(BOOL)animated {

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_CommentArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CommentTableViewCell" owner:self options:nil] firstObject];
    }
    NSDictionary *itemAtIndexPath=[_CommentArray objectAtIndex:indexPath.row];
    cell.lblUserName.text=[itemAtIndexPath valueForKey:@"userName"];
    cell.userImage.image=[UIImage imageNamed:[itemAtIndexPath valueForKey:@"imageName"]];
    cell.lblTime.text=[itemAtIndexPath valueForKey:@"time"];
    cell.lblContent.text=[itemAtIndexPath valueForKey:@"content"];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) parser {
    ParserService *parse=[[ParserService alloc] init];
    _CommentArray =[[NSMutableArray alloc] initWithArray:[parse getList:@"comment"]];
    
}

- (IBAction)postComment:(id)sender {
    if (![_txtvComment.text isEqualToString:@""]) {
        [self saveComment];
        [_tbvComment reloadData];
        _txtvComment.text=@"";
    }

}
-(void) saveComment{
    CommentModel *newComment=[[CommentModel alloc] init];
    long idComment =[_CommentArray count]+1;
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    
    newComment.idComment=[NSString stringWithFormat:@"%ld",idComment];
    newComment.imageName=@"us395";
    newComment.userName=@"Jackson Do";
    newComment.time=[NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:[NSDate date]]];
    newComment.content=_txtvComment.text;
    NSMutableArray *arrayComment=[[NSMutableArray alloc] initWithArray:_CommentArray];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"comment.plist"];
    [arrayComment addObject:newComment];
    [arrayComment writeToFile:path atomically:YES];
    [_CommentArray addObject:newComment];
    NSLog(@"%@",arrayComment);
}


-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:_txtvComment])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
    [self.view endEditing:YES];
}
-(void)keyboardWillShow {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
    [self textFieldDidBeginEditing:_txtvComment];
}
-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}


@end
