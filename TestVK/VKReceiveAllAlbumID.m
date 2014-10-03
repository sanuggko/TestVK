//
//  VKReceiveAllAlbumID.m
//  TestVK
//
//  Created by Alexandr Shevchuk on 03.10.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKReceiveAllAlbumID.h"

@implementation VKReceiveAllAlbumID

+ (NSArray *)loadArraysOfAlbumIds:(NSMutableArray *)arraysOfAlbums
{
    NSMutableArray *arraysOfAlbumIds = [[NSMutableArray alloc]init];
    
    for (VKAlbumModel *albumModel in arraysOfAlbums) {
        NSString *albumIdStr = [albumModel.albumId stringValue];
        [arraysOfAlbumIds addObject:albumIdStr];
    }
    return arraysOfAlbumIds;
}

@end
