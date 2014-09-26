//
//  XYZStartScreen.m
//  TestVK
//
//  Created by user on 11.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKStartScreen.h"
#import <VKSdk.h>

static NSString *const TOKEN_KEY = @"my_application_access_token";
static NSString *const SEGUE_ID = @"START";
static NSArray  * SCOPE = nil;


@implementation VKStartScreen

- (void)viewDidLoad {
    SCOPE = @[VK_PER_PHOTOS, VK_PER_NOHTTPS];
	[super viewDidLoad];
	[VKSdk initializeWithDelegate:self andAppId:@"4544554"];
    if ([VKSdk wakeUpSession])
    {
        [self startWorking];
    }
}

- (void)startWorking {
    [self performSegueWithIdentifier:SEGUE_ID sender:self];
}

- (IBAction)authorize:(id)sender {
	[VKSdk authorize:SCOPE revokeAccess:YES];
}

- (IBAction)authorizeForceOAuthInApp:(id)sender {
	[VKSdk authorize:SCOPE revokeAccess:YES forceOAuth:YES inApp:YES display:VK_DISPLAY_IOS];
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
	VKCaptchaViewController *vc = [VKCaptchaViewController captchaControllerWithError:captchaError];
	[vc presentIn:self];
}

- (void)vkSdkReceivedNewToken:(VKAccessToken *)newToken {
    [self startWorking];
}

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
	[self presentViewController:controller animated:YES completion:nil];
}

- (void)vkSdkAcceptedUserToken:(VKAccessToken *)token {
    [self startWorking];
}

- (void)vkSdkUserDeniedAccess:(VKError *)authorizationError {
	[[[UIAlertView alloc] initWithTitle:nil message:@"Access denied" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
}

- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken {
	[self authorize:nil];
}

@end