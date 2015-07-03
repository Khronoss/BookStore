//
//  BSCart.m
//  BookStore
//
//  Created by Anthony MERLE on 03/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import "BSCart.h"
#import "BSBook.h"

static NSString * const kCartKey = @"sharedCard";

@interface BSCart ()

@property (nonatomic, strong) NSMutableArray *books;

@end

@implementation BSCart

static BSCart *sharedCart;

+ (instancetype)sharedCart {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedCart = [[BSCart alloc] init];
	});
	return sharedCart;
}

- (instancetype)init {
	if (self = [super init]) {
		NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
		
		self.books = [userDefaults objectForKey:kCartKey];
	}
	return self;
}

#pragma mark - Books management

- (void)addBookToCart:(NSString*)bookId {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	[self.books addObject:bookId];
	
	[userDefaults setObject:self.books forKey:kCartKey];
	[userDefaults synchronize];
}

- (void)removeBookToCart:(NSString*)bookId {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	[self.books removeObject:bookId];
	
	[userDefaults setObject:self.books forKey:kCartKey];
	[userDefaults synchronize];
}

- (NSArray*)savedBooks {
	return [self.books copy];
}

- (void)removeAllBooks {
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	self.books = nil;
	[userDefaults removeObjectForKey:kCartKey];
	[userDefaults synchronize];
}

#pragma mark - Getter and Setter

- (NSMutableArray *)books {
	if (!_books) {
		_books = [NSMutableArray array];
	}
	return _books;
}

@end
