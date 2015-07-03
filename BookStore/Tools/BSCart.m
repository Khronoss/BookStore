//
//  BSCart.m
//  BookStore
//
//  Created by Anthony MERLE on 03/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import "BSCart.h"

static NSString * const kCartKey = @"sharedCard";

@implementation BSCart

static BSCart *sharedCart;

+ (instancetype)sharedCart {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedCart = [[BSCart alloc] init];
	});
	return sharedCart;
}

- (void)addBookIdToCart:(NSString*)bookId {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	NSMutableArray *bookIds = [NSMutableArray arrayWithArray:[userDefaults arrayForKey:kCartKey]];
	
	[bookIds addObject:bookId];
	
	[userDefaults setObject:bookIds forKey:kCartKey];
	[userDefaults synchronize];
}

- (void)removeBookIdToCart:(NSString*)bookId {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	NSMutableArray *bookIds = [NSMutableArray arrayWithArray:[userDefaults arrayForKey:kCartKey]];

	[bookIds removeObject:bookId];
	
	[userDefaults setObject:bookIds forKey:kCartKey];
	[userDefaults synchronize];
}

- (NSArray*)savedBookIds {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	return [userDefaults arrayForKey:kCartKey];
}

- (void)removeAllBooks {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	[userDefaults removeObjectForKey:kCartKey];
	[userDefaults synchronize];
}

@end
