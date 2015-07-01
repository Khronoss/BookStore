//
//  BSCommercialOffer.m
//  BookStore
//
//  Created by Anthony MERLE on 02/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import "BSCommercialOffers.h"
#import "BSCommercialOffer.h"

@implementation BSCommercialOffers

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			 @"offers": @"offers"
			 };
}

+ (NSValueTransformer*)offersJSONTransformer {
	return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[BSCommercialOffer class]];
}

@end
