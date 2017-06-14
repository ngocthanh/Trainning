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
    
    //Create customTableViewCell
    _cell = [CustomTableViewCell alloc];
    [self.tableViewNews registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"cellhome"];
    
    //create ơarserData by Link;
    _parse =[parserData alloc];
    
    //[_parse startParsing:@"http://vnexpress.net/rss/tin-moi-nhat.rss"];

    _custom=[CustomString alloc];
    _getdata =[GetData alloc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *url;
    switch (section) {
        case 0:
            url=@"http://vnexpress.net/rss/tin-moi-nhat.rss";
            break;
        case 1:
            url=@"http://vnexpress.net/rss/thoi-su.rss";
            break;
        case 2:
            url=@"http://vnexpress.net/rss/the-gioi.rss";
            break;
        case 3:
            url=@"http://vnexpress.net/rss/kinh-doanh.rss";
            break;
        case 4:
            url=@"http://vnexpress.net/rss/giai-tri.rss";
            break;
        default:
            //[_parse startParsing:@"http://vnexpress.net/rss/tin-moi-nhat.rss"];
            break;
    }
    [_parse startParsing:url];
    return [_parse.arrayXMLData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    _cell = [tableView dequeueReusableCellWithIdentifier:@"cellhome" forIndexPath:indexPath];
    //Load information to Cell
    NSString *url;
    switch (indexPath.section) {
        case 0:
            url=@"http://vnexpress.net/rss/tin-moi-nhat.rss";
            break;
        case 1:
            url=@"http://vnexpress.net/rss/thoi-su.rss";
            break;
        case 2:
            url=@"http://vnexpress.net/rss/the-gioi.rss";
            break;
        case 3:
            url=@"http://vnexpress.net/rss/kinh-doanh.rss";
            break;
        case 4:
            url=@"http://vnexpress.net/rss/giai-tri.rss";
            break;
        default:
            break;
    }
    [_parse startParsing:url];
    

    
    //Get data
    NSString *subdate=[NSString stringWithFormat:@"%@",[[[_parse.arrayXMLData objectAtIndex:indexPath.row] valueForKey:@"pubDate"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    NSString *descriptionString=[[[_parse.arrayXMLData objectAtIndex:indexPath.row] valueForKey:@"description"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *imageString=[_custom getImageLinkInString:descriptionString];
    NSData *imageData=[_getdata dataImageFromUrl:imageString];
    
    subdate=[_custom customDate:subdate];

    if (indexPath.row %2==1) {
        _cell.imageCell.image=[UIImage imageWithData:imageData];
        _cell.titleCell.text=[[[_parse.arrayXMLData objectAtIndex:indexPath.row] valueForKey:@"title"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        _cell.dateCell.text= [NSString stringWithFormat:@"%@",subdate];
        _cell.decriptionCell.text=[_custom getDescriptionInString:descriptionString];
    }
    else{
        _cell.imageCell1.image=[UIImage imageWithData:imageData];
        _cell.titleCell1.text=[[[_parse.arrayXMLData objectAtIndex:indexPath.row] valueForKey:@"title"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        _cell.dateCell1.text= [NSString stringWithFormat:@"%@",subdate];
        _cell.decriptionCell1.text=[_custom getDescriptionInString:descriptionString];
        }
    
    return _cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Trang chủ";
            break;
        case 1:
            return @"Thời sự";
            break;
        case 2:
            return @"Thế giới";
            break;
        case 3:
            return @"Kinh doanh";
            break;
        case 4:
            return @"Giải trí";
            break;
        default:return @"";
            break;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 250;
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
