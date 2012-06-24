//
//  lastWorkUnitStepViewController.m
//  xrono
//
//  Created by Adam Gamble on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "lastWorkUnitStepViewController.h"

@interface lastWorkUnitStepViewController ()

@end

@implementation lastWorkUnitStepViewController
@synthesize hourGlassView;
@synthesize hourGlassHolderView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setHourGlassView:nil];
    [self setHourGlassHolderView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (IBAction)finishCreatingWorkUnit:(UIButton *)sender {
    
    hourGlassView.hidden = NO;
    CABasicAnimation *fullRotation;
    fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    fullRotation.fromValue = [NSNumber numberWithFloat:0];
    fullRotation.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
    fullRotation.duration = 2;
    fullRotation.repeatCount = 1e100f;
    
    
    [hourGlassHolderView.layer addAnimation:fullRotation forKey:@"360"];
    [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(performSegue) userInfo:nil repeats:NO];
    return YES;
}
- (void)performSegue
{
    [self performSegueWithIdentifier:@"finishCreatingWorkUnit" sender:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    [theTextField resignFirstResponder];
    return YES;
}

@end
