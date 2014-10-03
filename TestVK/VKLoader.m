//
//  VKLoader.m
//  TestVK
//
//  Created by user on 12.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKLoader.h"
#import <VKSdk.h>
#import "VKAlbumModel.h"
#import "VKPhotoModel.h"
#import "VKParsingResponse.h"

@interface VKLoader()

@end

@implementation VKLoader

static NSString *const VK_API_NEED_SYSTEM          = @"need_system";
static NSString *const VK_API_NO_SERVICE_ALBUMS    = @"no_service_albums";
static NSString *const VK_API_NEED_COVERS    = @"need_covers";
static NSInteger const wall = -7;
static NSInteger const saved = -15;
static NSInteger const profile = -6;

+ (void)loadAlbumsWithSuccessBlock:(void (^)(NSArray *))success
                          failure:(void (^)(NSError *))failure
{
    
    VKRequest *req = [VKRequest requestWithMethod:@"photos.getAlbums"
                                    andParameters:@{VK_API_PHOTO:@1,VK_API_NEED_SYSTEM:@1, VK_API_NEED_COVERS: @1}
                                    andHttpMethod:@"GET"];
    
    [req executeWithResultBlock:^(VKResponse *response) {
    success([VKParsingResponse arrayOfAlbumsFromVKResponse:response]);
    } errorBlock:^(NSError *error) {
        if (failure)
        {
            failure(error);
        }
    }];
}


+ (void)loadPhotosWithIdOfAlbum:(NSInteger) idOfAlbum andWithSuccessBlock:(void (^) (NSArray *)) success failure:(void (^) (NSError *)) failure
{
    VKRequest *request = [[VKRequest alloc]init];
    
    if (idOfAlbum == saved)
    {
        request = [VKRequest requestWithMethod:@"photos.get"
                                         andParameters:@{VK_API_ALBUM_ID:@"saved"}
                                         andHttpMethod:@"GET"];
    }
    else if (idOfAlbum == wall)
    {
        request  = [VKRequest requestWithMethod:@"photos.get"
                                             andParameters:@{VK_API_ALBUM_ID:@"wall"}
                                             andHttpMethod:@"GET"];
    }
    else if (idOfAlbum == profile)
    {
        request  = [VKRequest requestWithMethod:@"photos.get"
                                             andParameters:@{VK_API_ALBUM_ID:@"profile"}
                                             andHttpMethod:@"GET"];
    }
    else
    {
        NSString *idOfAlbumStr = [NSString stringWithFormat: @"%d", (int) idOfAlbum];
        
        request = [VKRequest requestWithMethod:@"photos.get"
                                             andParameters:@{VK_API_ALBUM_ID:idOfAlbumStr}
                                             andHttpMethod:@"GET"];
    }
        
        [request executeWithResultBlock:^(VKResponse *response) {
            success([VKParsingResponse arrayOfPhotosFromVKResponse:response]);
            
        } errorBlock:^(NSError *error) {
            if(failure){
                failure(error);
            }
        }];
}

+ (void)loadPhotoCoordinateWithSuccessBlock:(void(^)(NSArray *array))success
                                    failure:(void(^)(NSError *error))failure
{
    VKRequest *req  = [VKRequest requestWithMethod:@"photos.get"
                                     andParameters:nil
                                     andHttpMethod:@"GET"];
    
    [req executeWithResultBlock:^(VKResponse *response) {
        
        success([VKParsingResponse arrayOfPhotoGeoCoordinateFromVKresponse:response]);
        
    } errorBlock:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];


}

@end
