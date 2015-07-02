//
//  XEBook.h
//  BookStore
//
//  Created by Anthony MERLE on 01/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

@interface BSBook : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *bookId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *coverURL;
@property (nonatomic, strong) NSNumber *price;

@property (nonatomic, getter=isSelected) BOOL selected;

@end
