//
//  NetwokingService.h
//  Get Photo Facebook
//
//  Created by KterKC on 7/5/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetwokingService : NSObject
+(NetwokingService*)sharedInstance;
-(void)getImageOnline:(NSString*) linkURL Success:(void(^)(NSData* dataImage))success Failure:(void (^)(NSError* error))failure;
@end
