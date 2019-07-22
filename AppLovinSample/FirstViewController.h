//
//  FirstViewController.h
//  AppLovinSample
//
//  Created by Jason Chiu on 7/18/19.
//  Copyright © 2019 Jason Chiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AppLovinSDK/AppLovinSDK.h>

@interface FirstViewController : UIViewController <ALAdLoadDelegate, ALAdDisplayDelegate, ALAdViewEventDelegate>

@property (strong, nonatomic) ALAdView *adView;     // Banner adView

@end

