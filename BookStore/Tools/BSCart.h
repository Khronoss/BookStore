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

- (void)addBookIdToCart:(NSString*)bookId;
- (void)removeBookIdToCart:(NSString*)bookId;
- (NSArray*)savedBookIds;
- (void)removeAllBooks;

@end
