//
//  VKViewAlbumsTableViewController.m
//  TestVK
//
//  Created by user on 15.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "VKViewAlbumsTableViewController.h"
#import <VKSdk.h>
#import <AFNetworking.h>
#import "VKLoader.h"
#import "VKAppDelegate.h"
#import "UIKit+AFNetworking.h"
#import "VKCustomAlbumViewCell.h"
#import "VKAlbumModel.h"
#import "VKPhotoModel.h"
#import "VKPhotosThrumbnailViewController.h"
#import "VKStartScreenViewController.h"
#import "VKHelper.h"
#import "VKChangeRootViewController.h"

@interface VKViewAlbumsTableViewController ()

@property NSMutableArray *albumsNameArray;
@property VKAlbumModel *vkAlbum;

@end

@implementation VKViewAlbumsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout"
                                                                             style:UIBarButtonItemStyleDone
                                                                            target:self
                                                                            action:@selector(logout:)];
    self.albumsNameArray = [[NSMutableArray alloc] init];
    
    UINib * nib = [UINib nibWithNibName:NSStringFromClass([VKCustomAlbumViewCell class])
                                 bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:NSStringFromClass([VKCustomAlbumViewCell class])];
    [self loadAlbums];
}

- (void)loadAlbums
{
    [VKLoader loadAlbumsWithSuccessBlock:^(NSArray *albums)
    {
        [self.albumsNameArray addObjectsFromArray:albums];
        [self.spinner stopAnimating];
        [self.tableView reloadData];
    }
                                 failure:^(NSError *error)
    {
        NSLog(@"Error in loadAlbums");
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.albumsNameArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	VKCustomAlbumViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([VKCustomAlbumViewCell class]) forIndexPath:indexPath];

    [cell updateWithAlbum:[self.albumsNameArray objectAtIndex:indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toPhotoList" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    VKPhotosThrumbnailViewController* photosThrumbnailViewController = segue.destinationViewController;
    NSIndexPath *selectedPath = [self.tableView indexPathForSelectedRow];
    photosThrumbnailViewController.currentAlbum = [self.albumsNameArray objectAtIndex:selectedPath.row];
}

- (void)logout:(id) sender {
    [VKSdk forceLogout];
    [VKChangeRootViewController changeToLoginViewController];
}

@end
