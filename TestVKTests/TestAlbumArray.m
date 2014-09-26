//
//  TestAlbumArray.m
//  TestVK
//
//  Created by Alexandr Shevchuk on 26.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <VK-ios-sdk/VKSdk.h>
#import "VKParsingResponse.h"
#import "VKResponse.h"
#import "DTFixtureLoader.h"
#import "VKAlbumModel.h"

@interface TestAlbumArray : XCTestCase

@property (nonatomic, strong) NSArray *albumArray;

@end

@implementation TestAlbumArray

- (void)setUp
{
    [super setUp];
    
    NSString *fileName = @"jsonResponseOfAlbumArray.json";
    
    VKResponse *response = [[VKResponse alloc]init];
    DTFixtureLoader *ficture = [DTFixtureLoader loaderInBundle:[NSBundle bundleForClass:[self class]]];
    id parsedObject = [ficture jsonObjectFromFileNamed:fileName];
    
    response.json = parsedObject;
    self.albumArray = [VKParsingResponse arrayOfAlbumsFromVKResponse:response];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testLengthOfArray
{
    XCTAssertEqual([self.albumArray count], 5, @"length not equal");
}

- (void)testTypeOfObjectsInArray
{
    for (int index = 0; index < [self.albumArray count]; index++){
        XCTAssertTrue([[self.albumArray objectAtIndex:index] isKindOfClass:([VKAlbumModel class])], @"object at index %d not VKAlbumModel object", index);
    }
}

@end
