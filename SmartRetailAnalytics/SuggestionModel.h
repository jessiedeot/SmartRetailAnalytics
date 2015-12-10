//
//  SuggestionModel.h
//  SmartRetailAnalytics
//
//  Created by Macintosh User on 12/9/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SuggestionModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface SuggestionModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<SuggestionModelProtocol> delegate;

- (void)downloadItems;

@end