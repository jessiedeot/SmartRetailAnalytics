//
//  SuggestionDetailViewController.h
//  SmartRetailAnalytics
//
//  Created by Macintosh User on 12/9/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Suggestion.h"

@interface SuggestionDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) Suggestion *selectedItemSet;

@end
