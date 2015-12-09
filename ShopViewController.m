//
//  ShopViewController.m
//  SmartRetailAnalytics
//
//  Created by Mansi Modi on 12/7/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import "ShopViewController.h"

@interface ShopViewController()
{
    NSMutableData *downloadedData;
   
}


@end

@implementation ShopViewController

-(void)viewDidAppear{
 
  //  self.cust_id.text=self.userId;


}

- (void)viewDidLoad {

    [super viewDidLoad];

    
    self.cust_id.text=self.userId;
    
    [self.nextitemLbl setHidden:YES];
    [self.nextItemSuggestion setHidden:YES];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)suggestionBtn:(id)sender {
    
    

    NSString *productName=[NSString stringWithFormat:@"%@", self.productName.text];
    
    NSString *custId=[NSString stringWithFormat:@"%@", self.productName.text];
    
    
    NSString *downloadUrl = [NSString stringWithFormat:@"%@%@", @"http://localhost/retail/deals.php?cust_id=5542"];
    
    NSURL *jsonFileUrl = [NSURL URLWithString:downloadUrl];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];

    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_locations = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
       
      //  self.nextItemSuggestion.text= jsonElement[@"suggestion"];
        
        // Add this question to the locations array
       
    }
    
    // Set the suggestion label to visible
        [self.nextItemSuggestion setHidden:NO];
        [self.nextitemLbl setHidden:NO];
    
}



@end
