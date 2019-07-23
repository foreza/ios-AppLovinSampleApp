//
//  FirstViewController.h
//  AppLovinSample
//
//  Created by Jason Chiu on 7/18/19.
//  Copyright © 2019 Jason Chiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AppLovinSDK/AppLovinSDK.h>

@interface FirstViewController : UIViewController <ALAdLoadDelegate, ALAdDisplayDelegate, ALAdViewEventDelegate, ALAdVideoPlaybackDelegate>


@property (strong, nonatomic) ALAdView *adView;     // Banner adView            1f4255944afd12df
@property (strong, nonatomic) ALAd *adIntZone1;     // Interstitial Ad Zone     7317b8287164ccb9
@property (strong, nonatomic) ALAd *adIntZone2;     // Interstitial Ad Zone     855c5b0b8889a103

@property (weak, nonatomic) IBOutlet UIButton *buttonLoadShow;      // Unused
@property (weak, nonatomic) IBOutlet UIButton *buttonPreload;
@property (weak, nonatomic) IBOutlet UIButton *buttonShow;

@end

