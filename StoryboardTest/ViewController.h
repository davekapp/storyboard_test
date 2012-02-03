//
//  ViewController.h
//  StoryboardTest
//
//  Created by David Kapp on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPopoverControllerDelegate>

// currently ARC doesn't really understand popoverControllers very well, so we need a way to make sure this gets retained
// while we are using it, hence making it a property
@property (strong, nonatomic) UIPopoverController *popoverController;

- (IBAction)goToYonderManually:(id)sender;
- (IBAction)leftPop:(id)sender;
- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController;

@end
