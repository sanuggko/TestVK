//
//  VKPhotoGeoCoordinateModel.h
//  TestVK
//
//  Created by Alexandr Shevchuk on 29.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface VKPhotoGeoCoordinateModel : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, strong) NSURL *urlOfThumbnail;
@property (nonatomic, strong) NSURL *urlOfBigPhoto;
@property (nonatomic) NSUInteger index;

- (instancetype)initWithProperties:(NSDictionary *)dictionary;

@end
