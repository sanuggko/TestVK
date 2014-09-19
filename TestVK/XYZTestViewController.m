//
//  XYZTestViewController.m
//  TestVK
//
//  Created by user on 11.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import "XYZTestViewController.h"
#import <VKSdk.h>
#import "AlbumModel.h"
#import <AFNetworking.h>
#import "VKLoader.h"

@interface XYZTestViewController()

@property AlbumModel* modelVar;
@property NSMutableArray* albumsNamesArray;
@property (weak, nonatomic) IBOutlet UILabel *content;

@end

@implementation XYZTestViewController



- (void)viewDidLoad
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleDone target:self action:@selector(logout:)];
    [super viewDidLoad];
        self.albumsNamesArray = [[NSMutableArray alloc] init];
    [self loadAlbums];

   
}
- (void)loadAlbums
{
    [VKLoader loadAlbumsWithSuccessBlock:^(NSArray *albums) {
        [self.albumsNamesArray addObjectsFromArray:albums];
        
    } failure:^(NSError *error) {
        
    }];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.albumsNamesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"photoAlbumsTable"];
	UILabel *label = (UILabel *)[cell viewWithTag:1];
	label.text = self.albumsNamesArray[indexPath.row];
	return cell;
}

- (void) logout:(id) sender {
    [VKSdk forceLogout];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
