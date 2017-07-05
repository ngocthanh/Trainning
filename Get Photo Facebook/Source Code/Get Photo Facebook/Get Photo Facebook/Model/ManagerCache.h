//
//  ManagerCache.h
//  Get Photo Facebook
//
//  Created by dankhanh on 7/4/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ManagerCache : NSObject
@property (strong,nonatomic) NSCache *cache;
+(ManagerCache*)sharedInstance ;
- (void)cacheImage:(NSData*)imageData forKey:(NSString*)key;
- (NSData*)getCachedImageForKey:(NSString*)key ;
@end
