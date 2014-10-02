//
//  VKViewAlbumsTableViewController.h
//  TestVK
//
//  Created by user on 15.09.14.
//  Copyright (c) 2014 MLSDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VKViewAlbumsTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
