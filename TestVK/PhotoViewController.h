//
//  PhotoView.h
//  TestVK
//
//  Created by user on 18.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VKPhotoModel.h"
#import "UIKit+AFNetworking.h"

@interface PhotoViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) VKPhotoModel *currentPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
