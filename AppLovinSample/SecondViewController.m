//
//  SecondViewController.m
//  AppLovinSample
//
//  Created by Jason Chiu on 7/18/19.
//  Copyright © 2019 Jason Chiu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

NSString* kLogTag2 = @"SecondViewController";

Boolean rewarded2Loaded = false;

NSString *rewarded1ZoneID = @"5e7c668be1a26ca5";
NSString *rewarded2ZoneID = @"b7054b025dec1fc8";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)actionLoadAndShowRewarded:(id)sender {
    [self loadAndShowRewarded];
}

- (IBAction)actionPreloadRewarded:(id)sender {
    // TODO
}

- (IBAction)actionShowRewarded:(id)sender {
    // TODO
}


- (void) changeUIStateForRewardedNotReady {
    // TODO
}

- (void) changeUIStateForRewardedIsReady {
    // TODO
}


- (void) loadAndShowRewarded {
    self.incentivizedInterstitial1 = [[ALIncentivizedInterstitialAd alloc] initWithZoneIdentifier: rewarded1ZoneID];
    [self.incentivizedInterstitial1 preloadAndNotify:self];
}

#pragma mark - <ALAdLoadDelegate Methods>

- (void)adService:(nonnull ALAdService *)adService didFailToLoadAdWithError:(int)code {
    NSString *msg = [NSString stringWithFormat:@"%@%@%d", kLogTag2, @" adService didFailToLoadAdWithError with: ", code];
    NSLog(@"%@", msg);
}

- (void)adService:(nonnull ALAdService *)adService didLoadAd:(nonnull ALAd *)ad {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag2, @" adService didLoadAd for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
    
    if ([ad.zoneIdentifier isEqualToString:rewarded1ZoneID]){
        self.incentivizedInterstitial1.adDisplayDelegate = self;
        self.incentivizedInterstitial1.adVideoPlaybackDelegate = self;
        [self.incentivizedInterstitial1 showAndNotify: self];
    }
    
}

#pragma mark - <ALAdDisplayDelegate Methods>


- (void)ad:(nonnull ALAd *)ad wasClickedIn:(nonnull UIView *)view {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag2, @" wasClickedIn for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
}

- (void)ad:(nonnull ALAd *)ad wasDisplayedIn:(nonnull UIView *)view {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag2, @" wasDisplayedIn for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
    
    // Control hide/show behavior
    if ([ad.zoneIdentifier isEqualToString:rewarded2ZoneID]) {
        rewarded2Loaded = false;                        // Set this to false
        [self changeUIStateForRewardedNotReady];
    }
}

- (void)ad:(nonnull ALAd *)ad wasHiddenIn:(nonnull UIView *)view {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag2, @" wasHiddenIn for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
}

#pragma mark - <ALAdVideoPlaybackDelegate Methods>


- (void)videoPlaybackBeganInAd:(nonnull ALAd *)ad {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag2, @" videoPlaybackBeganInAd for: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
}

- (void)videoPlaybackEndedInAd:(nonnull ALAd *)ad atPlaybackPercent:(nonnull NSNumber *)percentPlayed fullyWatched:(BOOL)wasFullyWatched {
    NSString *msg = [NSString stringWithFormat:@"%@%@%@", kLogTag2, @" videoPlaybackEndedInAd: ", ad.zoneIdentifier];
    NSLog(@"%@", msg);
}


#pragma mark - <ALAdRewardDelegate Methods>

- (void)rewardValidationRequestForAd:(nonnull ALAd *)ad didExceedQuotaWithResponse:(nonnull NSDictionary *)response {
    // TODO
}

- (void)rewardValidationRequestForAd:(nonnull ALAd *)ad didFailWithError:(NSInteger)responseCode {
    // TODO
}

- (void)rewardValidationRequestForAd:(nonnull ALAd *)ad didSucceedWithResponse:(nonnull NSDictionary *)response {
    // TODO
}

- (void)rewardValidationRequestForAd:(nonnull ALAd *)ad wasRejectedWithResponse:(nonnull NSDictionary *)response {
    // TODO
}


@end
