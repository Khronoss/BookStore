//
//  XEBook.m
//  BookStore
//
//  Created by Anthony MERLE on 01/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import "BSBook.h"

@implementation BSBook

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			 @"bookId": @"isbn",
			 @"title": @"title",
			 @"coverURL": @"cover",
			 @"price": @"price"
			 };
}

#pragma mark - MTLManagedObjectSerializing

+ (NSString *)managedObjectEntityName {
	return @"BSBook";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
	return @{};
}

@end
