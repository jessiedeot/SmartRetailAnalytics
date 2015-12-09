//
//  HomeModel.m
//  SmartRetailAnalytics
//
//  Created by Macintosh User on 12/6/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import "HomeModel.h"
#import "Deals.h"

@interface HomeModel()
{
    NSMutableData *_downloadedData;
}
@end

@implementation HomeModel

- (void)downloadItems :( NSString *) cust_id
{
    // Download the json file
    NSString * downloadUrl = [NSString stringWithFormat:@"%@%@", @"http://smartretail.bitnamiapp.com/Retail/deals.php?cust_id=", cust_id];
    
    NSLog(downloadUrl);
    
    NSURL *jsonFileUrl = [NSURL URLWithString:downloadUrl];
    
    // Create the request
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    // Create the NSURLConnection
    [NSURLConnection connectionWithRequest:urlRequest delegate:self];
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Initialize the data object
    _downloadedData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the newly downloaded data
    [_downloadedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Create an array to store the locations
    NSMutableArray *_locations = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
        Deals *newDeal = [[Deals alloc] init];
        newDeal.custID = jsonElement[@"cust_id"];
        newDeal.product_name = jsonElement[@"prd_name"];
        newDeal.count = jsonElement[@"KOUNT"];
        
        // Add this question to the locations array
        [_locations addObject:newDeal];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:_locations];
    }
}

@end