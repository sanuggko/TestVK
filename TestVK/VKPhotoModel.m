//
//  VKPhotoModel.m
//  TestVK
//
//  Created by user on 17.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKPhotoModel.h"

@implementation VKPhotoModel

- (instancetype)initWithProperties:(NSDictionary *)temp
{
    self = [super init];
    
    if (self)
    {
        self.urlOfSmallPhoto = [NSURL URLWithString:[temp valueForKey:@"photo_130"]];
        if ([NSURL URLWithString:[temp valueForKey:@"photo_807"]])
        {
            self.urlOfBigPhoto = [NSURL URLWithString:[temp valueForKey:@"photo_807"]];
            
        }else {
            
            self.urlOfBigPhoto = [NSURL URLWithString:[temp valueForKey:@"photo_604"]];
        }
    }
    
    return self;
}
@end
