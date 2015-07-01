//
//  BSCommercialOffer.h
//  BookStore
//
//  Created by Anthony MERLE on 02/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

@interface BSCommercialOffer : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSNumber *value;
@property (nonatomic, strong) NSNumber *sliceValue;

@end
