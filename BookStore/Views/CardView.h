//
//  CardView.h
//  BookStore
//
//  Created by Anthony MERLE on 02/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CardView : UIView

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, assign) IBInspectable UIColor *shadowColor;
@property (nonatomic, assign) IBInspectable CGSize shadowOffset;
@property (nonatomic, assign) IBInspectable CGFloat shadowOpacity;

@end
