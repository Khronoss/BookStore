//
//  BSCart.h
//  BookStore
//
//  Created by Anthony MERLE on 03/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSCart : NSObject

+ (instancetype)sharedCart;

- (BOOL)isBookInCart:(NSString*)bookId;

#pragma mark - Books management
- (void)addBookToCart:(NSString*)bookId;
- (void)removeBookToCart:(NSString*)bookId;
- (NSArray*)savedBooks;
- (void)removeAllBooks;

@end
