//
//  CustomViewCell.m
//  TestVK
//
//  Created by user on 16.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "CustomViewCell.h"
#import "VKLoader.h"
#import "UIKit+AFNetworking.h"
@implementation CustomViewCell

-(void) setAlbumURL:(NSURL*) url
{
    NSURLRequest* imageRequest = [NSURLRequest requestWithURL:url];
    [self.albumImageView setImageWithURLRequest:imageRequest
                                    placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                        [self.spinner stopAnimating];
                                        self.albumImageView.image = image;
                                    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                        [self.spinner stopAnimating];
                                    }
     ];
    
}

-(void)updateWithAlbum:(VKAlbumModel *)album
{
    self.customLabel.text = album.namesOfAlbum;
    [self setAlbumURL:album.urls];
}

@end
