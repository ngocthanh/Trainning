//
//  FileManager.m
//  Get Photo Facebook
//
//  Created by dankhanh on 7/4/17.
//  Copyright © 2017 KterKC. All rights reserved.
//

#import "FileManager.h"

@implementation FileManager

-(NSString*) createDirectoryPath {
    NSString *path;
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    path=[[paths objectAtIndex:0]stringByAppendingPathComponent:@"ImageFile"];
    NSError * error;
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        if (![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:
              &error]) {
            NSLog(@"create error %@",error);
            return nil;

        }
        else{
            return path;
        }
    }
    else{
        return path;
    }
}

-(BOOL) checkExistImageInMemory : (NSString *)imageName {
    NSString * path;
    path=[self createDirectoryPath];
    path=[path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",imageName]];
    if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
        return YES;
    }
    else{
        return NO;
    }
}
-(void) storeImageFileToMemory: (NSString *)imageName ImagaData:(NSData *)imageData{
    NSString * path;
    path=[self createDirectoryPath];
    path = [path stringByAppendingPathComponent:imageName];
    if (![self checkExistImageInMemory:imageName]) {
        [[NSFileManager defaultManager] createFileAtPath:path contents:imageData attributes:nil];
    }   
    
}
-(NSData *) loadImageFileFromMemory: (NSString *)imageName{

    NSString * path;
    path=[self createDirectoryPath];
    path=[path stringByAppendingPathComponent:imageName];
    if([[NSFileManager defaultManager]fileExistsAtPath:path]){
        NSData * imageData=[[NSData alloc] initWithContentsOfFile:path];
        if (imageData) {
            return imageData;
        }
    }
    return nil;
}
@end
