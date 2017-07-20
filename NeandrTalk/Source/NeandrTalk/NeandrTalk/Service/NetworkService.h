//
//  NetworkService.h
//  NeandrTalk
//
//  Created by KterKC on 7/20/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "ConstantSystem.h"

@interface NetworkService : NSObject
-(void)getImageOnline:(NSString*) linkURL Success:(void(^)(NSData* dataImage))success Failure:(void (^)(NSError* error))failure;

@end
