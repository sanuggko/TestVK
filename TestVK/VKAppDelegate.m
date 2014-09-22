//
//  XYZAppDelegate.m
//  TestVK
//
//  Created by user on 11.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKAppDelegate.h"
#import <VKSdk.h>

@implementation VKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
                                       sourceApplication:(NSString *)sourceApplication
                                              annotation:(id)annotation
{
    [VKSdk processOpenURL:url fromApplication:sourceApplication];
    return YES;
}

@end
