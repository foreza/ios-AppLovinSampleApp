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

Boolean interstitial2Loaded = false;        // The 2nd interstitial will be load + show

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initAndLoadBanner];
    [self changeUIStateForInterstitialNotReady];
}


// Method to init and load the banner for a zone
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



// Method to load an interstitial with a provided zone ID
- (void) loadInterstitialFor:(NSString *)zoneID {
    // Load an interstitial ad and be notified when the ad request is finished.
    [[ALSdk shared].adService loadNextAdForZoneIdentifier:zoneID andNotify: self];
    [ALInterstitialAd shared].adDisplayDelegate = self;
    [ALInterstitialAd shared].adVideoPlaybackDelegate = self;
}




#pragma mark - <IBAction Methods>

- (IBAction)actionLoadAndShowInterstitial:(id)sender {
    [self loadInterstitialFor:int1ZoneID];
}

- (IBAction)actionPreloadInterstitial:(id)sender {
    [self loadInterstitialFor:int2ZoneID];
}

- (IBAction)actionShowPreloadedInterstitial:(id)sender {
    if (interstitial2Loaded) {
        [[ALInterstitialAd shared] showAd: self.adIntZone2];
    }
}




#pragma mark - <UI Methods Methods>

- (void) changeUIStateForInterstitialNotReady {
    [self.buttonShow setHidden:true];
    [self.buttonPreload setHidden:false];
}

- (void) changeUIStateForInterstitialIsReady {
    [self.buttonShow setHidden:false];
    [self.buttonPreload setHidden:true];
}

#pragma mark - <ALAdLoadDelegate Methods>

- (void)adService:(ALAdService *)adService didLoadAd:(ALAd *)ad {
    
    
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag, @" adService didLoadAd for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
    
    // If this is the first interstitial, show it immediately
    if ([ad.zoneIdentifier isEqualToString:int1ZoneID]) {
        self.adIntZone1 = ad;
        [[ALInterstitialAd shared] showAd: ad];
    }
    
    // If this is the second interstitial, indicate it is ready to be shown
    else if ([ad.zoneIdentifier isEqualToString:int2ZoneID]) {
        self.adIntZone2 = ad;
        interstitial2Loaded = true;
        [self changeUIStateForInterstitialIsReady];
//        [[ALInterstitialAd shared] showAd: ad];
    }
    
}

- (void)adService:(ALAdService *)adService didFailToLoadAdWithError:(int)code {
    NSString *msg = [NSString stringWithFormat:@"%@%@%d", kLogTag, @" adService didFailToLoadAdWithError with: ", code];
    NSLog(@"%@", msg);

}



#pragma mark - <ALAdDisplayDelegate Methods>


- (void)ad:(ALAd *)ad wasDisplayedIn:(UIView *)view {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag, @" wasDisplayedIn for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
    
    // Control hide/show behavior
    if ([ad.zoneIdentifier isEqualToString:int2ZoneID]) {
        interstitial2Loaded = false;                        // Set this to false
        [self changeUIStateForInterstitialNotReady];
    }
    
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


#pragma mark - <ALAdVideoPlaybackDelegate Methods>


- (void)videoPlaybackBeganInAd:(ALAd *)ad{
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag, @" videoPlaybackBeganInAd for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
}

- (void)videoPlaybackEndedInAd:(ALAd *)ad atPlaybackPercent:(NSNumber *)percentPlayed fullyWatched:(BOOL)wasFullyWatched {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag, @" videoPlaybackEndedInAd: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
    
}



@end
