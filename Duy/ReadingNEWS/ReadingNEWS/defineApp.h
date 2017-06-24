//
//  defineApp.h
//  ReadingNEWS
//
//  Created by dankhanh on 6/21/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define heightForRow 250
#define numberOfSection 5

#define blank @""
#define oneCell 1
#define itemRightSide 1
#define doubleRowToGetItemLeftSide 2
#define numberDivideToGetNumberOfCell 2

#define titleApp @"VN Express"
#define detailsTitle @"Details"
#define stringHomePage @"Trang chủ"
#define stringNews @"Thời sự"
#define stringWorld @"Thế giới"
#define stringHeathy @"Sức khoẻ"
#define stringEducation @"Giáo dục"
#define urlHomePage @"http://vnexpress.net/rss/tin-moi-nhat.rss"
#define urlNews @"http://vnexpress.net/rss/so-hoa.rss"
#define urlWorld @"http://vnexpress.net/rss/the-gioi.rss"
#define urlHeathy @"http://vnexpress.net/rss/suc-khoe.rss"
#define urlEducation @"http://vnexpress.net/rss/giao-duc.rss"
#define urlLogoVnexpress @"https://s.vnecdn.net/vnexpress/i/v44/logo_default.jpg"

#define indexOfHomePage 0
#define indexOfNews 1
#define indexOfWorld 2
#define indexOfHeathy 3
#define indexOfEducation 4

#define customCellIdentifier @"cell"
#define locationOfItemTag 0
/* 
 -  in a group should use Enum
 -
 
 */
#define indexOfTitle 0
#define indexOfDescription 1
#define indexOfImageUrl 2
#define indexOfDate 3
#define indexOfUrl 4

#define progressBarStateFull 1
#define progressBarLastState 10

#define alphaOne 1
#define alphaZero 0

#define timerChange 0.05
#define timerThree 3

#define animateDurationOne 1
#define animateDurationTwo 2

#define formatString @"%@"
#define formatFloat @"%f"
#define formatCustomDate @"%@/%@/%@"

#define elementRss @"rss"
#define elementItem @"item"
#define elementTitle @"title"
#define elementDescription @"description"
#define elementPudDate @"pubDate"

#define month1String @"Jan"
#define month1Number @"01"
#define month2String @"Feb"
#define month2Number @"02"
#define month3String @"Mar"
#define month3Number @"03"
#define month4String @"Apr"
#define month4Number @"04"
#define month5String @"May"
#define month5Number @"05"
#define month6String @"Jun"
#define month6Number @"06"
#define month7String @"Jul"
#define month7Number @"07"
#define month8String @"Aug"
#define month8Number @"08"
#define month9String @"Sep"
#define month9Number @"09"
#define month10String @"Oct"
#define month10Number @"10"
#define month11String @"Nov"
#define month11Number @"11"
#define month12String @"Dec"
#define month12Number @"12"

#define patternOfImageUrl @"src=\"([^\"]+)"
#define patternOfDescription @"</br>([^&]+)"

#define indexAt0InString 0
#define indexAt2InString 2
#define indexAt3InString 3
#define indexAt5InString 5
#define indexAt7InString 7
#define indexAt11InString 11
#define firstLocationAtArray 1
#define numberOfOption 0
#define indexStartup 0
#define noExistValue 0
#define borderState 1

#define numberRepresentLeftView 0
#define numberRepresentRightView 1


@interface defineApp : NSObject

@end
