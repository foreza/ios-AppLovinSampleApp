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


// Todo: implement
// banner 1f4255944afd12df
// interstitial     7317b8287164ccb9 and 855c5b0b8889a103
// rewarded 27207f2172b864c1 and 49557b5ae8beb006

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    // Put the banner near the bottom
    self.adView = [[ALAdView alloc] initWithFrame: CGRectMake((self.view.bounds.size.width - 320) / 2, self.view.bounds.size.height - 150, 320, 50)
                                         size: [ALAdSize sizeBanner]
                                          sdk: [ALSdk shared]];
    
    // Load an ad into the ad view
    [self.adView loadNextAd];
    
    // Add it to the view
    [self.view addSubview: self.adView];
    
  
}


@end
