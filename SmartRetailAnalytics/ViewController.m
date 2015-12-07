//
//  ViewController.m
//  SmartRetailAnalytics
//
//  Created by Macintosh User on 12/2/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    HomeViewController *vc = [[HomeViewController alloc] init];
    UITabBarController* tbc = [segue destinationViewController];
    vc = (HomeViewController *)[[tbc customizableViewControllers] objectAtIndex:0];
    
    
    
    //HomeViewController *destination = [segue destinationViewController];
    //[[destination customizableViewControllers] objectAtIndex:0] = _username.text;
    vc.labelText = _username.text;
}

@end
