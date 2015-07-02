//
//  CardView.m
//  BookStore
//
//  Created by Anthony MERLE on 02/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import "CardView.h"

@implementation CardView

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		[self initView];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self initView];
	}
	return self;
}

- (void)initView {
	self.layer.cornerRadius = self.cornerRadius;
	self.layer.shadowColor = [self.shadowColor CGColor];
	self.layer.shadowOffset = self.shadowOffset;
	self.layer.shadowOpacity = self.shadowOpacity;
}

#pragma mark - Getter and Setter

- (void)setCornerRadius:(CGFloat)cornerRadius {
	_cornerRadius = cornerRadius;
	
	self.layer.cornerRadius = cornerRadius;
}

- (void)setShadowColor:(UIColor *)shadowColor {
	_shadowColor = shadowColor;
	
	self.layer.shadowColor = [shadowColor CGColor];
}

- (void)setShadowOffset:(CGSize)shadowOffset {
	_shadowOffset = shadowOffset;
	
	self.layer.shadowOffset = shadowOffset;
}

- (void)setShadowOpacity:(CGFloat)shadowOpacity {
	_shadowOpacity = shadowOpacity;
	
	self.layer.shadowOpacity = shadowOpacity;
}

@end
