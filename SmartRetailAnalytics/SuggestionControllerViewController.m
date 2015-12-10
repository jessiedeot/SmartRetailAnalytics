//
//  SuggestionControllerViewController.m
//  SmartRetailAnalytics
//
//  Created by Mansi Modi on 12/8/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import "SuggestionControllerViewController.h"
#import "Suggestion.h"
#import "SuggestionDetailViewController.h"

@interface SuggestionControllerViewController ()

{
    SuggestionModel *_suggestionModel;
    NSArray *_feedItems;
    Suggestion *_selectedItemSet;
}

@end

@implementation SuggestionControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Set this view controller object as the delegate and data source for the table view
    self.suggestionTableView.delegate = self;
    self.suggestionTableView.dataSource = self;
    
    // Create array object and assign it to _feedItems variable
    _feedItems = [[NSArray alloc] init];
    
    // Create new HomeModel object and assign it to _homeModel variable
    _suggestionModel = [[SuggestionModel alloc] init];
    
    // Set this view controller object as the delegate for the home model object
    _suggestionModel.delegate = self;
    
    // Call the download items method of the home model object
    [_suggestionModel downloadItems];
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
    [self.suggestionTableView reloadData];
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
    NSString *cellIdentifier = @"SuggestionBasicCell";
    UITableViewCell *myCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get the location to be shown
    Suggestion *item = _feedItems[indexPath.row];
    
    // Get references to labels of cell
    myCell.textLabel.text = item.itemSet;
    
    return myCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Set selected location to var
    _selectedItemSet = _feedItems[indexPath.row];
    
    // Manually call segue to detail view controller
    [self performSegueWithIdentifier:@"detailSegue" sender:self];
}

#pragma mark Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get reference to the destination view controller
    SuggestionDetailViewController *detailVC = segue.destinationViewController;
    
    // Set the property to the selected location so when the view for
    // detail view controller loads, it can access that property to get the feeditem obj
    detailVC.selectedItemSet = _selectedItemSet;
}

@end

