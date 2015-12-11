//
//  SuggestionModel.m
//  SmartRetailAnalytics
//
//  Created by Macintosh User on 12/9/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import "SuggestionModel.h"
#import "Suggestion.h"

@interface SuggestionModel()
{
    NSMutableData *_downloadedData;
}
@end

@implementation SuggestionModel

- (void)downloadItems
{
    // Download the json file
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://smartretail.bitnamiapp.com/Retail/suggestions.php"];
    
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
    NSMutableArray *_suggestions = [[NSMutableArray alloc] init];
    
    // Parse the JSON that came in
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    // Loop through Json objects, create question objects and add them to our questions array
    for (int i = 0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        // Create a new location object and set its props to JsonElement properties
        Suggestion *newSuggestion = [[Suggestion alloc] init];
        newSuggestion.count = jsonElement[@"freq_count"];
        newSuggestion.itemSet = jsonElement[@"freq_grouped_items"];
        
        
        // Add this question to the locations array
        [_suggestions addObject:newSuggestion];
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:_suggestions];
    }
}

@end
