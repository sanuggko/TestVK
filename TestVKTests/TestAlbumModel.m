//
//  TestVKTests.m
//  TestVKTests
//
//  Created by user on 11.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DTFixtureLoader.h"
#import "VKAlbumModel.h"
#import "VKPhotoModel.h"

@interface TestAlbumModel : XCTestCase

@property (nonatomic, strong) NSDictionary *tempDictionary;
@property (nonatomic, strong) VKAlbumModel *vkAlbum;

@end

@implementation TestAlbumModel

- (void)setUp
{
    NSString *fileName = @"jsonResponseOfAlbums.json";
    DTFixtureLoader *ficture = [DTFixtureLoader loaderInBundle:[NSBundle bundleForClass:[self class]]];
    id parsedObject = [ficture jsonObjectFromFileNamed:fileName];
    self.tempDictionary = parsedObject;
    self.vkAlbum = [[VKAlbumModel alloc]initWithProperties:self.tempDictionary];
    
}

- (void)tearDown
{
    
}

- (void)testAlbumsUrls
{
    XCTAssertEqualObjects(self.vkAlbum.urlOfAlbumThumbnail, [NSURL URLWithString:[self.tempDictionary valueForKeyPath:@"thumb_src"]], @"objects  is not equal");
}

- (void)testAlbumsNames
{
    XCTAssertEqualObjects(self.vkAlbum.nameOfAlbum, [self.tempDictionary valueForKey:@"title"], @"names not equal");
}

- (void)testAlbumId
{
    XCTAssertEqual(self.vkAlbum.albumId, [self.tempDictionary valueForKey:@"id"], @"albumsId not eqial");
}
@end
