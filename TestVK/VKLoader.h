//
//  VKLoader.h
//  TestVK
//
//  Created by user on 12.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKSdk.h"

@interface VKLoader : NSObject

+(void)loadAlbumsWithSuccessBlock:(void(^)(NSArray * albums))success
                          failure:(void(^)(NSError * error))failure;

+(void) loadPhotosWithIdOfAlbum:(NSInteger) idOfAlbum
            andWithSuccessBlock:(void (^) (NSArray* photos)) success
                        failure:(void (^) (NSError* error)) failure;
@end
