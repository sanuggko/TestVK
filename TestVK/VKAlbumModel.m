//
//  VKModel.m
//  TestVK
//
//  Created by user on 16.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKAlbumModel.h"

@implementation VKAlbumModel

- (instancetype)initWithProperties:(NSDictionary *)temp
{
    self = [super init];
    if (self){
        self.nameOfAlbum = [temp valueForKey:@"title"];
        self.urlOfAlbumThumbnail = [NSURL URLWithString:[temp valueForKey:@"thumb_src"]];
        self.albumId = [temp valueForKey:@"id"];
    }
    return self;
}
@end
