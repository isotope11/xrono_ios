//
//  pickProjectViewController.h
//  xrono
//
//  Created by Adam Gamble on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xronoWebServiceController.h"

@interface pickProjectTableViewController : UITableViewController {
    XronoWebserviceController *web_service;
}

@property (nonatomic, strong) NSDictionary *LoginData;
@property (nonatomic) NSInteger *client_id;
@property (nonatomic) NSArray *projects;
@property (nonatomic) NSInteger *project_id;
@end
