//
//  XEBookStoreClient.m
//  BookStore
//
//  Created by Anthony MERLE on 01/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import "BSRestClient.h"

#import "BSBook.h"
#import "BSCommercialOffers.h"

@implementation BSRestClient

static BSRestClient *sharedClient;

+ (instancetype)sharedClient {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedClient = [[BSRestClient alloc] initWithBaseURL:[NSURL URLWithString:API_BASE_URL]];
	});
	return sharedClient;
}

#pragma mark - REST calls methods

- (void)getBooksOnSuccess:(void (^)(NSArray *books))success onFailure:(void (^)(NSError *error))failure {
	[self GET:@"books" parameters:nil success:^(NSURLSessionDataTask *task, OVCResponse *responseObject) {
		success(responseObject.result);
	} failure:^(NSURLSessionDataTask *task, NSError *error) {
		failure(error);
	}];
}

- (void)getOffersForBooks:(NSArray *)books onSuccess:(void (^)(NSArray *books))success onFailure:(void (^)(NSError *error))failure {
	NSMutableString *booksIds = [NSMutableString string];
	for (BSBook *book in books) {
		NSString *comma = [booksIds isEqualToString:@""] ? @"" : @",";
		
		[booksIds appendFormat:@"%@%@", comma, book.bookId];
	}
	
	NSString *urlPath = [NSString stringWithFormat:@"books/%@/commercialOffers", booksIds];
	[self GET:urlPath parameters:nil success:^(NSURLSessionDataTask *task, OVCResponse *responseObject) {
		success(responseObject.result);
	} failure:^(NSURLSessionDataTask *task, NSError *error) {
		failure(error);
	}];
}

#pragma mark - OVCHTTPSessionManager overrided methods

+ (NSDictionary *)modelClassesByResourcePath {
	return @{
			 @"books": [BSBook class],
			 @"books/*/commercialOffers": [BSCommercialOffers class]
			 };
}

@end
