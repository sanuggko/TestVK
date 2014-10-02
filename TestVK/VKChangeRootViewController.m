//
//  VKChangeRootViewController.m
//  TestVK
//
//  Created by Alexandr Shevchuk on 02.10.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKChangeRootViewController.h"

@implementation VKChangeRootViewController

+ (void)changeToTabBarViewController
{
    UIWindow * rootWindow = [[UIApplication sharedApplication] keyWindow];
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Vk" bundle:nil];
    UITabBarController * controller = [storyboard instantiateViewControllerWithIdentifier:@"TabBarViewController"];
    rootWindow.rootViewController = controller;
}

+ (void)changeToLoginViewController
{
    UIWindow *rootWindow = [[UIApplication sharedApplication] keyWindow];
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Vk" bundle:nil];
    UIViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"Login"];
    rootWindow.rootViewController = controller;
}

@end
