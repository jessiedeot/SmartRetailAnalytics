//
//  HomeViewController.m
//  SmartRetailAnalytics
//
//  Created by Macintosh User on 12/2/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import "HomeViewController.h"
#import "Deals.h"

@interface HomeViewController ()
{
    HomeModel *_homeModel;
    NSArray *_feedItems;
    
}

@end

@implementation HomeViewController
 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBarController.delegate = self;
  
  //  AppDelegate *deg = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Do any additional setup after loading the view.
    _usernameLabel.text = _labelText;
    NSString *username=self.labelText;
    
    self.userName=username;
    
    // Set this view controller object as the delegate and data source for the table view
    self.listTableView.delegate = self;
    self.listTableView.dataSource = self;
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    _homeModel = [[HomeModel alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    _homeModel.delegate = self;
    
    // Call the download items method of the home model object
    [_homeModel downloadItems:username];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)itemsDownloaded:(NSArray *)items
{
    // This delegate method will get called when the items are finished downloading
    
    // Set the downloaded items to the array
    _feedItems = items;
    
    // Reload the table view
    [self.listTableView reloadData];
}
#pragma mark Table View Delegate Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of feed items (initially 0)
    return _feedItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Retrieve cell
    NSString *cellIdentifier = @"BasicCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get the location to be shown
    Deals *item = _feedItems[indexPath.row];
    
    // Get references to labels of cell
    myCell.textLabel.text = item.product_name;
    
    return myCell;
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([viewController isKindOfClass:[ShopViewController class]]){
        ShopViewController *svc = (ShopViewController *) viewController;
        
        svc.userId = self.userName;
        NSLog(svc.userId);
        
    }
    return TRUE;
}
    //This will change the text of the label in controller B


@end