//
//  SuggestionDetailViewController.m
//  SmartRetailAnalytics
//
//  Created by Macintosh User on 12/9/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import "SuggestionDetailViewController.h"

@interface SuggestionDetailViewController ()

@end

@implementation SuggestionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *items = [_selectedItemSet.itemSet componentsSeparatedByString:@","];
    NSString *stringToDisplay = [items componentsJoinedByString:@"\n"];
    
    _textView.text = stringToDisplay;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
