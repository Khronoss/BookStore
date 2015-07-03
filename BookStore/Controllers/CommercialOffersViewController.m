//
//  CommercialOffersViewController.m
//  BookStore
//
//  Created by Anthony MERLE on 03/07/2015.
//  Copyright (c) 2015 Anthony. All rights reserved.
//

#import "CommercialOffersViewController.h"

#import "BSRestClient.h"
#import "BSBook.h"
#import "BSCart.h"
#import "BSCommercialOffers.h"
#import "BSCommercialOffer.h"

@interface CommercialOffersViewController ()

@property (weak, nonatomic) IBOutlet UIView *offerView;
@property (weak, nonatomic) IBOutlet UIView *errorView;
@property (weak, nonatomic) IBOutlet UIView *loadingView;

@property (weak, nonatomic) IBOutlet UILabel *offerTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalOfferedPriceLabel;

@property (nonatomic, strong) BSCommercialOffers *offers;

@property (nonatomic, getter=isLoading) BOOL loading;
@property (nonatomic, getter=hasLoadError) BOOL loadError;

@end

@implementation CommercialOffersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	
	[self initOffers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initOffers {
	[self setLoading:YES];
	WEAKSELF(self);
	[[BSRestClient sharedClient] getOffersForBooks:[[BSCart sharedCart] savedBooks] onSuccess:^(BSCommercialOffers *offers) {
		weakSelf.offers = offers;
		[weakSelf setLoading:NO];
	} onFailure:^(NSError *error) {
		NSLog(@"Error: %@", error);
		[weakSelf setLoadError:YES];
	}];
}

- (void)displayBestOffer {
	BSCommercialOffer *bestOffer = nil;
	CGFloat bestOfferPrice = 0.0f;
	for (BSCommercialOffer *offer in self.offers.offers) {
		if ([offer priceWithOffer:self.totalPrice] > bestOfferPrice) {
			bestOffer = offer;
			bestOfferPrice = [offer priceWithOffer:self.totalPrice];
		}
	}
	
	self.offerTypeLabel.text = bestOffer.type;
	self.totalPriceLabel.text = [NSString stringWithFormat:@"%.2f", self.totalPrice];
	self.totalOfferedPriceLabel.text = [NSString stringWithFormat:@"%.2f", bestOfferPrice];
}

#pragma mark - IBActions

- (IBAction)reloadButtonTapped {
	[self initOffers];
}

- (IBAction)buyBooks:(UIBarButtonItem *)sender {
	[[BSCart sharedCart] removeAllBooks];
	
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Getter and Setter

- (void)setOffers:(BSCommercialOffers *)offers {
	_offers = offers;
	
	[self displayBestOffer];
}

- (void)setLoading:(BOOL)loading {
	_loading = loading;
	
	if (loading) {
		[self.view bringSubviewToFront:self.loadingView];
	} else {
		[self.view bringSubviewToFront:self.offerView];
	}
}

- (void) setLoadError:(BOOL)loadError {
	_loadError = loadError;
	
	if (loadError) {
		[self.view bringSubviewToFront:self.errorView];
	}
}

@end
