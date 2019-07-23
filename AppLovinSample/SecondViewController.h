//
//  SecondViewController.h
//  AppLovinSample
//
//  Created by Jason Chiu on 7/18/19.
//  Copyright © 2019 Jason Chiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AppLovinSDK/AppLovinSDK.h>


@interface SecondViewController : UIViewController <ALAdLoadDelegate,ALAdDisplayDelegate, ALAdViewEventDelegate, ALAdVideoPlaybackDelegate, ALAdRewardDelegate>

@property (weak, nonatomic) IBOutlet UIButton *buttonLoadShowRewarded;
@property (weak, nonatomic) IBOutlet UIButton *buttonPreloadRewarded;
@property (weak, nonatomic) IBOutlet UIButton *buttonShowRewarded;

@property (nonatomic, strong) ALIncentivizedInterstitialAd *incentivizedInterstitial1;
@property (nonatomic, strong) ALIncentivizedInterstitialAd *incentivizedInterstitial2;


@end

