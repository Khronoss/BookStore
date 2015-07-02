//
//  BookCollectionViewCell.h
//  BookStore
//
//  Created by Anthony MERLE on 02/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bookCoverImageView;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;

@end
