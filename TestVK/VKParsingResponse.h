//
//  VKParsingResponse.h
//  TestVK
//
//  Created by Alexandr Shevchuk on 26.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKLoader.h"
#import <VKSdk.h>
#import "VKAlbumModel.h"
#import "VKPhotoModel.h"

@interface VKParsingResponse : NSObject

+ (NSArray *)arrayOfAlbumsFromVKResponse:(VKResponse *)response;

+ (NSArray *)arrayOfPhotosFromVKResponse:(VKResponse *)response andAlbumId:(NSInteger) idOfAlbum;

@end
