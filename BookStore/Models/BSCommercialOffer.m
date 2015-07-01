//
//  BSCommercialOffer.m
//  BookStore
//
//  Created by Anthony MERLE on 02/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import "BSCommercialOffer.h"

@implementation BSCommercialOffer

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return @{
			 @"type": @"type",
			 @"value": @"value",
			 @"sliceValue": @"sliceValue"
			 };
}

@end
