//
//  XEBook.m
//  BookStore
//
//  Created by Anthony MERLE on 01/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import "BSBook.h"

@implementation BSBook

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			 @"bookId": @"isbn",
			 @"title": @"title",
			 @"coverURL": @"cover",
			 @"price": @"price"
			 };
}

@end
