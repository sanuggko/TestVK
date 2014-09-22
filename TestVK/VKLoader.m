//
//  VKLoader.m
//  TestVK
//
//  Created by user on 12.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKLoader.h"
#import <VKSdk.h>
#import "AlbumModel.h"
#import "VKAlbumModel.h"
#import "VKPhotoModel.h"

@implementation VKLoader


+(void)loadAlbumsWithSuccessBlock:(void (^)(NSArray *))success
                          failure:(void (^)(NSError *))failure
{
    
    VKRequest* req = [VKRequest requestWithMethod:@"photos.getAlbums"
                                    andParameters:@{VK_API_PHOTO:@1,VK_API_NEED_SYSTEM:@1, VK_API_NEED_COVERS: @1}
                                    andHttpMethod:@"GET"]; // параметры VK_API_NEED_SYSTEM и VK_API_NEED_COVERS добавлялись вручную, так в VKSDK их не было
    
    [req executeWithResultBlock:^(VKResponse *response) {
        NSMutableArray* albums = [[NSMutableArray alloc] init];
        NSDictionary* dictonary = response.json;
        NSArray * items = [dictonary valueForKey:@"items"];
        for (int i =0; i < [items count]; i++){
            NSDictionary* temp = items[i];
            VKAlbumModel* vkAlbums = [[VKAlbumModel alloc]init];
            vkAlbums.nameOfAlbum = [temp valueForKey:@"title"];
            vkAlbums.urlOfAlbumThumbnail = [NSURL URLWithString:[temp valueForKey:@"thumb_src"]];
            vkAlbums.albumId = [temp valueForKey:@"id"];
            [albums addObject:vkAlbums];
        }
        success(albums);        
    } errorBlock:^(NSError *error) {
        if (failure)
        {
            failure(error);
        }
    }];
}
+(void) loadPhotosWithIdOfAlbum:(NSInteger) idOfAlbum andWithSuccessBlock:(void (^) (NSArray*)) success failure:(void (^) (NSError*)) failure
{
    VKRequest* req  = [VKRequest requestWithMethod:@"photos.getAll" andParameters:@{VK_API_NO_SERVICE_ALBUMS:@0, VK_API_COUNT:@200} andHttpMethod:@"GET"];
    [req executeWithResultBlock:^(VKResponse *response) {
        NSMutableArray* photoAlbum = [[NSMutableArray alloc]init];
        NSDictionary* dic = response.json;
        NSArray* items = [dic valueForKey:@"items"];
        for (int i =0; i < [items count]; i++) {
            NSDictionary* temp = items[i];
            VKPhotoModel* vkPhoto = [[VKPhotoModel alloc]init];
            NSInteger idAlbum = [[temp valueForKey:@"album_id"] intValue];
            if (idOfAlbum == idAlbum) {
                vkPhoto.urlOfSmallPhoto = [NSURL URLWithString:[temp valueForKey:@"photo_604"]];
                vkPhoto.urlOfBigPhoto = [NSURL URLWithString:[temp valueForKey:@"photo_807"]];
                [photoAlbum addObject:vkPhoto];
            }
        }
        success(photoAlbum);
    } errorBlock:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];

}

@end
