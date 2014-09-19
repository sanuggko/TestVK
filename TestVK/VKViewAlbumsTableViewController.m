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
#import "XYZAppDelegate.h"
#import "UIKit+AFNetworking.h"
#import "CustomViewCell.h"
#import "VKAlbumModel.h"
#import "VKPhotoModel.h"
#import "VKPhotoViewController.h"

@interface VKViewAlbumsTableViewController ()

@property NSMutableArray* albumsNamesArray;
@property VKAlbumModel* vkAlbums;
@end

@implementation VKViewAlbumsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleDone target:self action:@selector(logout:)];
    self.albumsNamesArray = [[NSMutableArray alloc] init];
    
    UINib * nib = [UINib nibWithNibName:NSStringFromClass([CustomViewCell class])
                                 bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:NSStringFromClass([CustomViewCell class])];
    [self loadAlbums];
}

- (void)loadAlbums
{
    [VKLoader loadAlbumsWithSuccessBlock:^(NSArray *albums) {
        [self.albumsNamesArray addObjectsFromArray:albums];
        [self.tableView reloadData];
    }
     failure:^(NSError *error) {
        
    }];

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
  
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.albumsNamesArray count];
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	CustomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CustomViewCell class]) forIndexPath:indexPath];

    [cell updateWithAlbum:[self.albumsNamesArray objectAtIndex:indexPath.row]];
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        [self performSegueWithIdentifier:@"toPhotoList" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   VKPhotoViewController* vkPhotoVC = segue.destinationViewController;
    NSIndexPath * selectedPath = [self.tableView indexPathForSelectedRow];
    vkPhotoVC.currentAlbum = [self.albumsNamesArray objectAtIndex:selectedPath.row];
}

- (void) logout:(id) sender {
    [VKSdk forceLogout];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
