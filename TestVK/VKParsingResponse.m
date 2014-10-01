//
//  VKParsingResponse.m
//  TestVK
//
//  Created by Alexandr Shevchuk on 26.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKParsingResponse.h"

@implementation VKParsingResponse

+ (NSArray *)arrayOfAlbumsFromVKResponse:(VKResponse *)response
{
    NSMutableArray *albums = [[NSMutableArray alloc] init];
    NSDictionary *dictonary = response.json;
    NSArray *items = [dictonary valueForKey:@"items"];
    for (int i =0; i < [items count]; i++){
        NSDictionary *temp = items[i];
        VKAlbumModel *vkAlbums = [[VKAlbumModel alloc]initWithProperties:temp];
        [albums addObject:vkAlbums];
    }
    return albums;
}

+ (NSArray *)arrayOfPhotosFromVKResponse:(VKResponse *)response andAlbumId:(NSInteger) idOfAlbum
{
    NSMutableArray* photoAlbum = [[NSMutableArray alloc]init];
    NSDictionary* dic = response.json;
    
    NSArray* items = [dic valueForKey:@"items"];
    for (int i =0; i < [items count]; i++) {
        NSDictionary* temp = items[i];
        VKPhotoModel* vkPhoto = [[VKPhotoModel alloc]initWithProperties:temp];
        NSInteger idAlbum = [[temp valueForKey:@"album_id"] intValue];
        if (idOfAlbum == idAlbum) {
            [photoAlbum addObject:vkPhoto];
        }
    }
    return photoAlbum;
}

+ (NSArray *)arrayOfPhotoGeoCoordinateFromVKresponse:(VKResponse *)response
{
    NSMutableArray *arrayOfPhotoGeoCoordinate = [[NSMutableArray alloc]init];
    NSDictionary *dictionary = response.json;
    
    NSArray *items = [dictionary valueForKeyPath:@"items"];
    
    NSUInteger currentIndex = 0;
    
    for (int index = 0; index < [items count]; index++)
    {
        NSDictionary *temp = items[index];
        VKPhotoGeoCoordinateModel *geoCoordinate = [[VKPhotoGeoCoordinateModel alloc]initWithProperties:temp];
        if (geoCoordinate)
        {
            geoCoordinate.index = currentIndex++;
          [arrayOfPhotoGeoCoordinate addObject:geoCoordinate];
        }
    }
    return arrayOfPhotoGeoCoordinate;
}

@end
