//
//  RequestDataFB.h
//  Get Photo Facebook
//
//  Created by KterKC on 6/29/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestDataFB : NSObject
-(void)requestInformation: (NSString *) nameFields success:(void (^)(id data))success  failure:(void(^)(NSError* error))failure;

@end
