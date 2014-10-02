//
//  XYZStartScreen.m
//  TestVK
//
//  Created by user on 11.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKStartScreenViewController.h"
#import "VKHelper.h"
#import "VKChangeRootViewController.h"

static NSString *const TOKEN_KEY = @"my_application_access_token";
static NSString *const SEGUE_ID = @"START_WORKING";

@interface VKStartScreenViewController()
@property (nonatomic,strong) VKHelper * vkHelper;
@end

@implementation VKStartScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
	self.vkHelper = [VKHelper new];
}

- (void)userAuthorized {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(300 * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^(void) {
        [VKChangeRootViewController changeToTabBarViewController];
    });
}

- (IBAction)authorizeForceOAuthInApp:(id)sender {
    [self.vkHelper authorizeInController:self
                                 success:^{
                                     [self userAuthorized];
                                 } failure:^(VKError *error) {
                                     [[[UIAlertView alloc] initWithTitle:nil
                                                                 message:@"Access denied"
                                                                delegate:nil
                                                       cancelButtonTitle:@"Ok"
                                                       otherButtonTitles:nil] show];
                                 }];
}

@end