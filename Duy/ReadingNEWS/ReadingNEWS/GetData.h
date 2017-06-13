//
//  GetData.h
//  ReadingNEWS
//
//  Created by dankhanh on 6/12/17.
//  Copyright © 2017 duy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetData : NSObject  <NSURLSessionDelegate>


-(void)connectWithLink:(NSString *)urlLink;
@end
