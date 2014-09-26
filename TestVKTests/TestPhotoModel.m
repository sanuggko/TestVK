//
//  TestPhotoModel.m
//  TestVK
//
//  Created by Alexandr Shevchuk on 26.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DTFixtureLoader.h"
#import "VKPhotoModel.h"

@interface TestPhotoModel : XCTestCase

@property (nonatomic, strong) NSDictionary *tempDictionary;
@property (nonatomic, strong) VKPhotoModel *vkPhoto;

@end

@implementation TestPhotoModel

- (void)setUp
{
    [super setUp];
    NSString *filename = @"jsonResponseOfPhotos.json";
    DTFixtureLoader *ficture = [DTFixtureLoader loaderInBundle:[NSBundle bundleForClass:[self class]]];
    id jsonParsedObject = [ficture jsonObjectFromFileNamed:filename];
    self.tempDictionary = jsonParsedObject;
    self.vkPhoto = [[VKPhotoModel alloc] initWithProperties:self.tempDictionary];
     
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testURLsOfBigPhoto
{
    XCTAssertEqualObjects(self.vkPhoto.urlOfBigPhoto,
                          [NSURL URLWithString:[self.tempDictionary valueForKey:@"photo_807"]],
                          @"urls of big photo not equal");
}

- (void)testURLsOfSmallPhoto
{
    XCTAssertEqualObjects(self.vkPhoto.urlOfSmallPhoto,
                          [NSURL URLWithString:[self.tempDictionary valueForKey:@"photo_604"]],
                          @"urls of small photo is not equal");
}
@end
