//
//  BooksCollectionViewController.m
//  BookStore
//
//  Created by Anthony MERLE on 01/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import <UIImageView+AFNetworking.h>

#import "BooksCollectionViewController.h"
#import "BookCollectionViewCell.h"
#import "CommercialOffersViewController.h"

#import "BSRestClient.h"
#import "BSBook.h"
#import "BSCart.h"

@interface BooksCollectionViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *errorView;
@property (weak, nonatomic) IBOutlet UIView *loadingView;

@property (nonatomic, strong) NSArray *books;

@property (nonatomic, getter=isLoading) BOOL loading;
@property (nonatomic, getter=hasLoadError) BOOL loadError;

@end

@implementation BooksCollectionViewController

static NSString * const reuseIdentifier = @"BookCell";

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self initBooks];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initBooks {
	[self setLoading:YES];
	WEAKSELF(self);
	[[BSRestClient sharedClient] getBooksOnSuccess:^(NSArray *books) {
		[weakSelf setBooks:books];
		[weakSelf setLoading:NO];
	} onFailure:^(NSError *error) {
		NSLog(@"Error loading books: %@", error);
		[weakSelf setLoadError:YES];
	}];
}

- (IBAction)reloadBooks {
	[self initBooks];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"show_buyVC"]) {
		CommercialOffersViewController *commercialOfferVC = (CommercialOffersViewController*)segue.destinationViewController;
		
		CGFloat total;
		for (BSBook *book in self.books) {
			if ([[[BSCart sharedCart] savedBooks] containsObject:book.bookId]) {
				total += [book.price floatValue];
			}
		}
		commercialOfferVC.totalPrice = total;
	}
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [self.books count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    BookCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
	BSBook *book = [self.books objectAtIndex:indexPath.item];
	
	cell.titleLabel.text = book.title;
	cell.priceLabel.text = [NSString stringWithFormat:@"%@ €", book.price];
	[cell.bookCoverImageView setImageWithURL:[NSURL URLWithString:book.coverURL] placeholderImage:[UIImage imageNamed:@"book-icon"]];
	[cell.selectedImageView setHidden:!book.isSelected];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	BSBook *book = [self.books objectAtIndex:indexPath.item];
	
	book.selected = !book.selected;
	
	if (book.selected) {
		[[BSCart sharedCart] addBookToCart:book.bookId];
	} else {
		[[BSCart sharedCart] removeBookToCart:book.bookId];
	}
	
	[self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
}

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake(CGRectGetWidth([self.view bounds]) / 2.0f, CGRectGetHeight([self.view bounds]) / 2.0f);
}

#pragma mark - Getter and Setter

- (void)setBooks:(NSArray *)books {
	_books = books;
	
	BSCart *cart = [BSCart sharedCart];
	for (BSBook *book in _books) {
		if ([[cart savedBooks] containsObject:book.bookId])
			[book setSelected:YES];
	}
	[self.collectionView reloadData];
}

- (void)setLoading:(BOOL)loading {
	_loading = loading;
	
	if (loading) {
		[self.view bringSubviewToFront:self.loadingView];
	} else {
		[self.view bringSubviewToFront:self.collectionView];
	}
}

- (void) setLoadError:(BOOL)loadError {
	_loadError = loadError;
	
	if (loadError) {
		[self.view bringSubviewToFront:self.errorView];
	}
}

@end
