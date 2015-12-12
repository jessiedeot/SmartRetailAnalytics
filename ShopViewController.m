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
    
    NSString *custId=[NSString stringWithFormat:@"%@", self.cust_id.text];
    
    
    NSString *downloadUrl1 = [NSString stringWithFormat:@"%@%@%",
                              @"http://smartretail.bitnamiapp.com/Retail/checkout.php?cust_id=",custId];
    NSString *downloadUrl= [NSString stringWithFormat:@"%@%@%@",downloadUrl1,@"&product_name=",productName]  ;
    
    NSString* encodedUrl = [downloadUrl stringByAddingPercentEscapesUsingEncoding:
                            NSUTF8StringEncoding];
 
    
    
    NSURL *jsonFileUrl = [NSURL URLWithString:encodedUrl];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];

    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    
    NSLog(@"Did recv response");
    
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
 
    
    NSLog(@"Enter");
    [self.nextItemSuggestion setHidden:YES];
    [self.nextitemLbl setHidden:YES];
      // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:downloadedData options:NSJSONReadingAllowFragments error:&error];
    NSString *textAppnd=@"";
    
  
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        if(![jsonElement[@"final_product_name"] isEqual: @""])
        
        {
        
        
        // Create a new location object and set its props to JsonElement properties
        textAppnd= [NSString stringWithFormat:@" %@ \n %@", textAppnd,jsonElement[@"final_product_name"]];
        
        }
       
        else{
        
             textAppnd= [NSString stringWithFormat:@" %@%", @"There are no suggestions to display for the product selected"];
        
        }
        
        // Add this question to the locations array
       
    }
    
     NSLog(textAppnd);
    
    self.nextItemSuggestion.text=textAppnd;
    
    
    // Set the suggestion label to visible
        [self.nextItemSuggestion setHidden:NO];
        [self.nextitemLbl setHidden:NO];
    
}



@end
