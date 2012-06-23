//
//  xronoViewController.m
//  xrono
//
//  Created by Adam Gamble on 6/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "xronoViewController.h"

@interface xronoViewController ()

@end

@implementation xronoViewController
@synthesize xrono_logo;
@synthesize email_field;
@synthesize textfieldView;
@synthesize hourGlassView;
@synthesize hourGlassHolderView;
@synthesize password_field;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib
    CGRect xronoLogoTopFrame = xrono_logo.frame;
    CGRect xronoLogoOriginalTopFrame = xrono_logo.frame;
    xronoLogoTopFrame.origin.y = -xronoLogoTopFrame.size.height;
    xrono_logo.frame = xronoLogoTopFrame;
    
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    xrono_logo.frame = xronoLogoOriginalTopFrame;
    textfieldView.alpha = 1.0f;
    
    [UIView commitAnimations];
}


- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    hourGlassView.hidden = NO;
    /*[UIView beginAnimations:@"crazyRotate" context:nil];
    [UIView setAnimationDuration:1.0];
     [UIView setAnimationRepeatCount:1e100f];
    hourGlassHolderView.transform = CGAffineTransformMakeRotation(M_PI/2);
    [UIView commitAnimations];*/
    CABasicAnimation *fullRotation;
    fullRotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    fullRotation.fromValue = [NSNumber numberWithFloat:0];
    fullRotation.toValue = [NSNumber numberWithFloat:((360*M_PI)/180)];
    fullRotation.duration = 2;
    fullRotation.repeatCount = 1e100f;
    
    
    [hourGlassHolderView.layer addAnimation:fullRotation forKey:@"360"];
    [theTextField resignFirstResponder];
    return YES;
}

- (void)viewDidUnload
{
    [self setXrono_logo:nil];
    [self setEmail_field:nil];
    [self setPassword_field:nil];
    [self setTextfieldView:nil];
    [self setHourGlassView:nil];
    [self setHourGlassHolderView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
