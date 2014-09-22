//
//  CustomViewCell.m
//  TestVK
//
//  Created by user on 16.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKCustomAlbumViewCell.h"
#import "VKLoader.h"
#import "UIKit+AFNetworking.h"

@implementation VKCustomAlbumViewCell

- (void) setAlbumThumnailWithURL:(NSURL*) urlOfAlbumThrumbnail
{
    NSURLRequest* imageRequest = [NSURLRequest requestWithURL:urlOfAlbumThrumbnail];
    [self.albumImageView setImageWithURLRequest:imageRequest
                               placeholderImage:nil
                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image)
    {
        [self.spinner stopAnimating];
        self.albumImageView.image = image;
    }
                                        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error)
    {
        [self.spinner stopAnimating];
    }];
}

- (void)updateWithAlbum:(VKAlbumModel *)vkAlbum
{
    self.customLabel.text = vkAlbum.nameOfAlbum;
    [self setAlbumThumnailWithURL:vkAlbum.urlOfAlbumThumbnail];
}

@end
