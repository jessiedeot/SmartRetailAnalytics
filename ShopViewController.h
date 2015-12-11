//
//  ShopViewController.h
//  SmartRetailAnalytics
//
//  Created by Mansi Modi on 12/7/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopViewController : UIViewController<NSURLConnectionDataDelegate>
@property (strong, nonatomic) IBOutlet UITextField *productName;

@property (strong, nonatomic) IBOutlet UITextField *productQty;

@property (strong, nonatomic) IBOutlet UITextView *nextItemSuggestion;

@property (strong, nonatomic) IBOutlet UILabel *nextitemLbl;
- (IBAction)suggestionBtn:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *cust_id;
@property(strong,nonatomic)NSString *userId;



@end
