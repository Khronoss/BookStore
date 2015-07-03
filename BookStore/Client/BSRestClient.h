//
//  XEBookStoreClient.h
//  BookStore
//
//  Created by Anthony MERLE on 01/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

@class BSCommercialOffers;

@interface BSRestClient : OVCHTTPSessionManager

+ (instancetype)sharedClient;

- (void)getBooksOnSuccess:(void (^)(NSArray *books))success onFailure:(void (^)(NSError *error))failure;
- (void)getOffersForBooks:(NSArray *)books onSuccess:(void (^)(BSCommercialOffers *offers))success onFailure:(void (^)(NSError *error))failure;

@end
