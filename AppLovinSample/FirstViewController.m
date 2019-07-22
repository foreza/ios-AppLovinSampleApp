//
//  FirstViewController.m
//  AppLovinSample
//
//  Created by Jason Chiu on 7/18/19.
//  Copyright © 2019 Jason Chiu. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

NSString* kLogTag = @"FirstViewController";

NSString *bannerZoneID = @"1f4255944afd12df";
NSString *int1ZoneID = @"7317b8287164ccb9";
NSString *int2ZoneID = @"855c5b0b8889a103";

Boolean interstitial1Loaded = false;
Boolean interstitial2Loaded = false;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initAndLoadBanner];
}


- (void) initAndLoadBanner {
    
    self.adView = [[ALAdView alloc] initWithSize: [ALAdSize sizeBanner] zoneIdentifier: bannerZoneID];
    self.adView.frame = CGRectMake((self.view.bounds.size.width - 320) / 2, self.view.bounds.size.height - 150, 320, 50);

    // Attach delegates
    self.adView.adLoadDelegate = self;
    self.adView.adDisplayDelegate = self;
    self.adView.adEventDelegate = self;
    
    // Load an ad into the ad view
    [self.adView loadNextAd];
    
    // Add it to the view
    [self.view addSubview: self.adView];
}


#pragma mark - <ALAdLoadDelegate Methods>

- (void)adService:(ALAdService *)adService didLoadAd:(ALAd *)ad {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag, @" adService didLoadAd for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);

}

- (void)adService:(ALAdService *)adService didFailToLoadAdWithError:(int)code {
    NSString *msg = [NSString stringWithFormat:@"%@%@%d", kLogTag, @" adService didFailToLoadAdWithError with: ", code];
    NSLog(@"%@", msg);
}



#pragma mark - <ALAdDisplayDelegate Methods>


- (void)ad:(ALAd *)ad wasDisplayedIn:(UIView *)view {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag, @" wasDisplayedIn for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
}

- (void)ad:(ALAd *)ad wasHiddenIn:(UIView *)view {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag, @" wasHiddenIn for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
}

- (void)ad:(ALAd *)ad wasClickedIn:(UIView *)view {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag, @" wasClickedIn for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
}



#pragma mark - <ALAdViewEventDelegate Methods>

- (void)ad:(ALAd *)ad didPresentFullscreenForAdView:(ALAdView *)adView {
    
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag, @" didPresentFullscreenForAdView for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);

}

- (void)ad:(ALAd *)ad willDismissFullscreenForAdView:(ALAdView *)adView {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag, @" willDismissFullscreenForAdView for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
}

- (void)ad:(ALAd *)ad didDismissFullscreenForAdView:(ALAdView *)adView {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag, @" didDismissFullscreenForAdView for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
}

- (void)ad:(ALAd *)ad willLeaveApplicationForAdView:(ALAdView *)adView {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag, @" willLeaveApplicationForAdView for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
}

- (void)ad:(ALAd *)ad didFailToDisplayInAdView:(ALAdView *)adView withError:(ALAdViewDisplayErrorCode)code {
    NSString *msg = [NSString stringWithFormat:@"%@%@%ld", kLogTag, @" didFailToDisplayInAdView with: ", (long)code];
    NSLog(@"%@", msg);
}



@end
