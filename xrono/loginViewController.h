//
//  xronoViewController.h
//  xrono
//
//  Created by Adam Gamble on 6/22/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface loginViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *xrono_logo;
@property (weak, nonatomic) IBOutlet UITextField *password_field;
@property (weak, nonatomic) IBOutlet UITextField *email_field;
@property (weak, nonatomic) IBOutlet UIView *textfieldView;
@property (weak, nonatomic) IBOutlet UIView *hourGlassView;
@property (weak, nonatomic) IBOutlet UIView *hourGlassHolderView;
@property (weak, nonatomic) IBOutlet UILabel *loginUnsuccessful;
@property (weak, nonatomic) NSDictionary *login_data;
@end
