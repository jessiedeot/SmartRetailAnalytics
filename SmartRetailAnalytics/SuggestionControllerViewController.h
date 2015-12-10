//
//  SuggestionControllerViewController.h
//  SmartRetailAnalytics
//
//  Created by Mansi Modi on 12/8/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuggestionModel.h"

@interface SuggestionControllerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, SuggestionModelProtocol>

{
    NSMutableArray  *arrayForBool;
    NSArray *sectionTitleArray;
    
}

@property (strong, nonatomic) IBOutlet UITableView *suggestionTableView;

@end
