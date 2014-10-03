//
//  PhotoView.m
//  TestVK
//
//  Created by user on 18.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "PhotoViewController.h"
#import "UIKit+AFNetworking.h"
#import "VKChangeRootViewController.h"
#import "VKSdk.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(logout:)];
    
    NSURL* url = self.currentPhoto.urlOfBigPhoto;
    [self.scrollView setMaximumZoomScale:3.0f];
    [self.scrollView setClipsToBounds:YES];
    [self setImageWithURL:url];
}

- (void)setImageWithURL:(NSURL *) url
{
    NSURLRequest* imageReq = [NSURLRequest requestWithURL:url];
    [self.photoView setImageWithURLRequest:imageReq
                          placeholderImage:nil
                                   success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
    {
        [self.spinner stopAnimating];
        self.photoView.image = image;
        
    }
                                   failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
    {
       [self.spinner stopAnimating];
        NSLog(@"error");
    }];
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.photoView;
}

- (void)logout:(id) sender {
    [VKSdk forceLogout];
    [VKChangeRootViewController changeToLoginViewController];
}

@end
