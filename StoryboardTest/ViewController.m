//
//  ViewController.m
//  StoryboardTest
//
//  Created by David Kapp on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "OtherGreatController.h"
#import "GreatPopover.h"

@implementation ViewController
@synthesize popoverController;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (IBAction)goToYonderManually:(id)sender {
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
  OtherGreatController *other = [storyboard instantiateViewControllerWithIdentifier:@"yonderViewController"];
  other.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
  [self presentViewController:other animated:YES completion:nil];
}

- (IBAction)leftPop:(id)sender {
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil];
  GreatPopover *popover = [storyboard instantiateViewControllerWithIdentifier:@"happyPopover"];
  self.popoverController = [[UIPopoverController alloc] initWithContentViewController:popover];
  //popoverController.popoverContentSize = CGSizeMake(320, 200);
  self.popoverController.delegate = self;
  [self.popoverController presentPopoverFromRect:((UIView*)sender).frame
                     inView:self.view 
                     permittedArrowDirections:UIPopoverArrowDirectionRight 
                     animated:YES];
} 

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([segue isKindOfClass:[UIStoryboardPopoverSegue class]]) {
    ((UIStoryboardPopoverSegue*)segue).popoverController.delegate = self;
  }
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController {
  NSLog(@"NOES POPOVER TEH GONES");
}

@end
