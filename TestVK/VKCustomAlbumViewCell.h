//
//  CustomViewCell.h
//  TestVK
//
//  Created by user on 16.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIKit+AFNetworking.h"
#import "VKAlbumModel.h"

@interface VKCustomAlbumViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property (weak, nonatomic) IBOutlet UILabel *customLabel;


- (void)updateWithAlbum:(VKAlbumModel *)vkAlbum;

@end
