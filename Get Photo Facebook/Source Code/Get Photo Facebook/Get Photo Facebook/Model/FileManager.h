//
//  FileManager.h
//  Get Photo Facebook
//
//  Created by dankhanh on 7/4/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject
-(NSString*) createDirectoryPath;
-(BOOL) checkExistImageInMemory : (NSString *)imageName;
-(void) storeImageFileToMemory: (NSString *)imageName ImagaData:(NSData *)imageData;
-(NSData *) loadImageFileFromMemory: (NSString *)imageName;

@end
