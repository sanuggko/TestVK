//
//  VKPhotoGeoCoordinateModel.m
//  TestVK
//
//  Created by Alexandr Shevchuk on 29.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKPhotoGeoCoordinateModel.h"

@implementation VKPhotoGeoCoordinateModel

- (instancetype)initWithProperties:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        if ([dictionary valueForKey:@"lat"])
        {
            NSNumber *latitude = [dictionary valueForKey:@"lat"];
            NSNumber *longtitude = [dictionary valueForKey:@"long"];
            self.coordinate = CLLocationCoordinate2DMake([latitude doubleValue], [longtitude doubleValue]);
            self.urlOfThumbnail = [NSURL URLWithString:[dictionary valueForKey:@"photo_75"]];
            self.urlOfBigPhoto = [NSURL URLWithString:[dictionary valueForKey:@"photo_807"]];
            self.title = @"Photo";
            self.subtitle = @"";
        }
    }
    return self;
}

@end
