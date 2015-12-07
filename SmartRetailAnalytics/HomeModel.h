//
//  HomeModel.h
//  SmartRetailAnalytics
//
//  Created by Macintosh User on 12/6/15.
//  Copyright © 2015 JessieDeot. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HomeModelProtocol <NSObject>

- (void)itemsDownloaded:(NSArray *)items;

@end

@interface HomeModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<HomeModelProtocol> delegate;

- (void)downloadItems:( NSString *) cust_id;

@end
