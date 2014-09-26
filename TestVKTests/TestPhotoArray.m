//
//  TestPhotoArray.m
//  TestVK
//
//  Created by Alexandr Shevchuk on 26.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <VK-ios-sdk/VKSdk.h>
#import "VKParsingResponse.h"
#import "DTFixtureLoader.h"
#import "VKPhotoModel.h"

@interface TestPhotoArray : XCTestCase

@property (nonatomic, strong) NSArray *photoArray;

@end

@implementation TestPhotoArray

- (void)setUp
{
    [super setUp];
    
    NSString *fileName = @"jsonResponseOfPhotoArray.json";
    NSInteger idOfAlbum = -7;
    
    VKResponse *response = [[VKResponse alloc]init];
    DTFixtureLoader *ficture = [DTFixtureLoader loaderInBundle:[NSBundle bundleForClass:[self class]]];
    id parsedObject = [ficture jsonObjectFromFileNamed:fileName];
    
    response.json = parsedObject;
    self.photoArray = [VKParsingResponse arrayOfPhotosFromVKResponse:response andAlbumId:idOfAlbum];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testLengthOfArray
{
    XCTAssertEqual([self.photoArray count], 7, @"length not equal");
}

- (void)testTypeOfObjectsInArray
{
    for (int index = 0; index < [self.photoArray count]; index++){
        XCTAssertTrue([[self.photoArray objectAtIndex:index] isKindOfClass:([VKPhotoModel class])], @"object at index %d not VKPhotoModel object", index);
    }
}

@end
