//
//  FileManager.h
//  Get Photo Facebook
//
//  Created by dankhanh on 7/4/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileManager : NSObject
-(NSString*) createDirectoryPath :(NSString *)folderName;
-(BOOL) checkExistImageInMemory : (NSString *)imageName FolderName: (NSString *)folderName;
-(void) storeImageFileToMemory: (NSString *)imageName FolderName: (NSString *)folderName ImagaData:(NSData *)imageData;
-(NSData *) loadImageFileFromMemory: (NSString *)imageName FolderName:(NSString *)folderName;
@end
