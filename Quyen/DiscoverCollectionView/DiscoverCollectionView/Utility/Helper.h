//
//  Helper.h
//  DiscoverCollectionView
//
//  Created by KterKC on 6/22/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "DefineColor.h"
@interface Helper : NSObject
-(NSString*)strimString:(NSString*) stringNeedToStrim Pattern:(NSString*) patternString ;
-(NSString*)formatDateDDMMYYY:(NSString*) stringDate;
-(NSInteger)setNumberOfRowsInSection:(NSInteger) number;
-(void)loadWebViewWithURL:(NSString*) stringURL WebView:(UIWebView*) webview;
@end
