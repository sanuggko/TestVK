//
//  VKPhotoGeoCoordinateViewController.m
//  TestVK
//
//  Created by Alexandr Shevchuk on 29.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKPhotoGeoCoordinateViewController.h"

@interface VKPhotoGeoCoordinateViewController ()

@property (nonatomic) NSUInteger index;
@property (nonatomic, strong) NSMutableArray *annotationArray;

@end

@implementation VKPhotoGeoCoordinateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.annotationArray = [[NSMutableArray alloc] init];
    self.localization.showsUserLocation = YES;
    
    [self loadCoordinates];
    //[self.localization addAnnotations:self.annotationArray];
    
}

- (void)loadCoordinates
{
    [VKLoader loadPhotoCoordinateWithSuccessBlock:^(NSArray *array)
    {
        [self.annotationArray addObjectsFromArray:array];
        
        [self showAnnotations:self.annotationArray animated:YES];
        
    } failure:^(NSError *error) {
        NSLog(@"%@", error);
    }];
}

- (void)showAnnotations:(NSArray *)annotations
               animated:(BOOL)animated
{
    [self.localization addAnnotations:annotations];
    
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [rightButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    view.rightCalloutAccessoryView = rightButton;
    
    VKPhotoGeoCoordinateModel *annotationObj = view.annotation;
    UIImageView *thumnailView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    
    [thumnailView setImageWithURL:annotationObj.urlOfThumbnail placeholderImage:nil];
    view.leftCalloutAccessoryView = thumnailView;
    
    self.index = annotationObj.index;
}

- (IBAction)button:(id)sender
{
   [self performSegueWithIdentifier:@"toPhotoView" sender:sender];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PhotoViewController* photoViewController = segue.destinationViewController;
    VKPhotoModel *photoModel = [[VKPhotoModel alloc]init];
    VKPhotoGeoCoordinateModel *geoModel = [self.annotationArray objectAtIndex:self.index];
    
    photoModel.urlOfBigPhoto = geoModel.urlOfBigPhoto;
    photoViewController.currentPhoto = photoModel;
}

@end
