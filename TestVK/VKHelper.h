//
//  VKHelper.h
//  TestVK
//
//  Created by Alexandr Shevchuk on 02.10.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <VKSdk.h>

@interface VKHelper : NSObject 

-(void)authorizeInController:(UIViewController *)controller
                     success:(void(^)())success
                     failure:(void(^)(VKError * error))failure;

@end
