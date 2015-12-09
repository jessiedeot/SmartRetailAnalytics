//
//  HomeViewController.h
//  SmartRetailAnalytics
//
//  Created by Macintosh User on 12/2/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "ShopViewController.h"

@interface HomeViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, HomeModelProtocol,UITabBarControllerDelegate,UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) NSString *labelText;
@property (strong, nonatomic) IBOutlet UITableView *listTableView;
@property(strong, nonatomic) ShopViewController *controllerB;


@end
