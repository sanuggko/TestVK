//
//  VKHelper.m
//  TestVK
//
//  Created by Alexandr Shevchuk on 02.10.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKHelper.h"

@interface VKHelper() <VKSdkDelegate>

@property (nonatomic,weak) UIViewController * presentingController;
@property (nonatomic,copy) void (^successBlock)();
@property (nonatomic,copy) void (^failureBlock)(VKError * error);
@property (nonatomic,strong) NSArray * permissions;
@end

@implementation VKHelper

-(void)authorizeInController:(UIViewController *)controller success:(void (^)())success failure:(void (^)(VKError *))failure
{
    self.presentingController = controller;
    self.successBlock = success;
    self.failureBlock = failure;
    self.permissions = @[VK_PER_PHOTOS, VK_PER_NOHTTPS];
    [VKSdk initializeWithDelegate:self andAppId:@"4544554"];
    
    if ([VKSdk wakeUpSession])
    {
        [self userAuthorized];
        return;
    }
    
    [self authorize];
}

-(void)authorize
{
    [VKSdk authorize:self.permissions revokeAccess:YES forceOAuth:YES inApp:YES display:VK_DISPLAY_IOS];
}

-(void)userAuthorized
{
    if (self.successBlock)
    {
        self.successBlock();
    }
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError {
	VKCaptchaViewController *vc = [VKCaptchaViewController captchaControllerWithError:captchaError];
	[vc presentIn:self.presentingController];
}

- (void)vkSdkReceivedNewToken:(VKAccessToken *)newToken {
    [self userAuthorized];
}

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller {
	[self.presentingController presentViewController:controller animated:YES completion:nil];
}

- (void)vkSdkAcceptedUserToken:(VKAccessToken *)token {
    [self userAuthorized];
}

- (void)vkSdkUserDeniedAccess:(VKError *)authorizationError {
	if (self.failureBlock)
    {
        self.failureBlock(authorizationError);
    }
}

- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken {
	[self authorize];
}

@end
