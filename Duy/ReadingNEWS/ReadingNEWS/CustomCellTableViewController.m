//
//  CustomCellTableViewController.m
//  ReadingNEWS
//
//  Created by dankhanh on 6/11/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import "CustomCellTableViewController.h"
#import "CustomTableViewCell.h"
#import "GetData.h"
#import "parserData.h"
#import "CustomString.h"

@interface CustomCellTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableViewNews;
@property (strong, nonatomic) CustomTableViewCell *cell;
@property (strong, nonatomic) parserData *parse;
@property (strong,nonatomic) GetData *getdata;
@property (strong,nonatomic) CustomString *custom;
@end

@implementation CustomCellTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"VN Express";
    _cell = [CustomTableViewCell alloc];
    [self.tableViewNews registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellhome"];
    _parse =[parserData alloc];
    [_parse startParsing:@"http://vnexpress.net/rss/tin-moi-nhat.rss"];
    
    _custom=[CustomString alloc];
//    _getdata =[GetData alloc];
//    [_getdata connectWithLink:@"http://vnexpress.net/rss/thoi-su.rss"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_parse.arrayXMLData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _cell = [tableView dequeueReusableCellWithIdentifier:@"cellhome" forIndexPath:indexPath];
    

    
    NSString *subdate=[NSString stringWithFormat:@"%@",[[[_parse.arrayXMLData objectAtIndex:indexPath.row] valueForKey:@"pubDate"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    subdate=[_custom customDate:subdate];
    NSString *descriptionString=[[[_parse.arrayXMLData objectAtIndex:indexPath.row] valueForKey:@"description"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    NSString *imageString=[_custom getImageLinkInString:descriptionString];
//    NSLog(@"%@",imageString);
    _cell.titleCell.text=[[[_parse.arrayXMLData objectAtIndex:indexPath.row] valueForKey:@"title"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    _cell.dateCell.text= [NSString stringWithFormat:@"%@",subdate];
    _cell.decriptionCell.text=descriptionString;
    
    return _cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"Trang chủ"];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 210.0f;
}

-(void)viewDidAppear:(BOOL)animated{
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
