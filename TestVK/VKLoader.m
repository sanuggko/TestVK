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
    if (idOfAlbum == (-15))
    {
        VKRequest *req  = [VKRequest requestWithMethod:@"photos.get"
                                         andParameters:@{VK_API_ALBUM_ID:@"saved"}
                                         andHttpMethod:@"GET"];
        [req executeWithResultBlock:^(VKResponse *response) {
            success([VKParsingResponse arrayOfPhotosFromVKResponse:response andAlbumId:idOfAlbum]);
            
        } errorBlock:^(NSError *error) {
            if(failure){
                failure(error);
            }
        }];
    } else{
    
    VKRequest *req  = [VKRequest requestWithMethod:@"photos.getAll"
                                     andParameters:@{VK_API_NO_SERVICE_ALBUMS:@0, VK_API_COUNT:@200}
                                     andHttpMethod:@"GET"];
    
    [req executeWithResultBlock:^(VKResponse *response) {
        
    success([VKParsingResponse arrayOfPhotosFromVKResponse:response andAlbumId:idOfAlbum]);
        
    } errorBlock:^(NSError *error) {
        if(failure){
            failure(error);
        }
    }];
    }
}

+ (void)loadPhotoCoordinateWithSuccessBlock:(void(^)(NSArray *array))success
                                    failure:(void(^)(NSError *error))failure
{
    VKRequest *req  = [VKRequest requestWithMethod:@"photos.getAll"
                                     andParameters:@{VK_API_NO_SERVICE_ALBUMS:@0, VK_API_COUNT:@200}
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
