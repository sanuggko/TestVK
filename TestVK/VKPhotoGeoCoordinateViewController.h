//
//  VKPhotoGeoCoordinateViewController.h
//  TestVK
//
//  Created by Alexandr Shevchuk on 29.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "VKLoader.h"
#import "UIKit+AFNetworking.h"
#import "VKPhotoGeoCoordinateModel.h"
#import "PhotoViewController.h"
#import "VKPhotoModel.h"
#import "VKViewAlbumsTableViewController.h"

@interface VKPhotoGeoCoordinateViewController : UIViewController <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *localization;

@end
