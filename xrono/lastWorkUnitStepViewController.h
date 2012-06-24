//
//  lastWorkUnitStepViewController.h
//  xrono
//
//  Created by Adam Gamble on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface lastWorkUnitStepViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *hourGlassView;
@property (weak, nonatomic) IBOutlet UIView *hourGlassHolderView;
@end