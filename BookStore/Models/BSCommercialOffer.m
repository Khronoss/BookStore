//
//  BSCommercialOffer.m
//  BookStore
//
//  Created by Anthony MERLE on 02/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import "BSCommercialOffer.h"

static NSString * const kCommercialOfferTypePercentage = @"percentage";
static NSString * const kCommercialOfferTypeMinus = @"minus";
static NSString * const kCommercialOfferTypeSlice = @"slice";

@implementation BSCommercialOffer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			 @"type": @"type",
			 @"value": @"value",
			 @"sliceValue": @"sliceValue"
			 };
}

- (CGFloat)priceWithOffer:(CGFloat)price {
	CGFloat offerPrice;
	if ([self.type isEqualToString:kCommercialOfferTypePercentage]) {
		offerPrice = price * (1.0f - ([self.value floatValue] / 100.0f));
	} else if ([self.type isEqualToString:kCommercialOfferTypeMinus]) {
		offerPrice = price - [self.value floatValue];
	} else if ([self.type isEqualToString:kCommercialOfferTypeSlice]) {
		CGFloat totalSliceValue = (price / 100) * [self.value floatValue];
		
		offerPrice = price - totalSliceValue;
	}
	return offerPrice;
}

@end
