//
//  DefineObject.h
//  DiscoverCollectionView
//
//  Created by KterKC on 6/21/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define floatNumberZero 0.0
#define intZero 0
#define intTen 10
#define intOne 1
#define intTotalSpaceBetween2Rows 30
#define intTwo 2
#define intThree 3
#define frontSizeMinium 11

#define floatRed 0.6
#define floatGreen 0.01
#define floatBlue 0.3

#define timeRepeatForProgress 0.05

#define objectTitle 0
#define objectTime 1
#define objectDescription 2
#define objectLinkImage 3

#define titleVNExpress @"VN Express"
#define titleFirst @"Trang Chủ"
#define titleSecond @"Số Hoá"
#define titleThird @"Thể Thao"
#define titleFourth @"Giáo Dục"
#define titleFifth @"Xe"
#define titleDownloadData @"Tải Dữ Liệu"
#define textNil @""
#define titleLoginFB @"Login Facebook"

#define urlBase @"http://vnexpress.net/rss/"
#define urlFirst @"tin-moi-nhat.rss"
#define urlSecond @"so-hoa.rss"
#define urlThird @"the-thao.rss"
#define urlFourth @"giao-duc.rss"
#define urlFifth @"oto-xe-may.rss"

#define idCell @"homecell"
#define idSuplementary @"supplementHome"

#define nameCell @"DiscoverCollectionViewCell"
#define nameSuplementary @"CollectionReusableView"

#define permissionFBProfile @"public_profile"

#define formatInteger  @"%ld"
#define formatFloatAndDouble  @"%f"
#define formatDate @"EE, d LLLL yyyy HH:mm:ss Z"
#define formatDateVN @"dd/MM/yyyy HH:mm"
#define patternStringLink @"src=\"([^\"]+)"
#define patternStringDescription @"</br>([^&]+)"

#define stringAddString @"%@%@"
#define firstCheckString @"rss"
#define secondCheckString @"item"
#define thirdCheckString @"title"
#define fourthCheckString @"pubDate"
#define fifthCheckString @"description"


@interface DefineObject : NSObject
@property UIColor* colorPrimary ;
@end
