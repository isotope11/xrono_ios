//
//  pickTicketTableViewController.h
//  xrono
//
//  Created by Adam Gamble on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xronoWebServiceController.h"

@interface pickTicketTableViewController : UITableViewController {
    XronoWebserviceController *web_service;
}
@property  NSDictionary *LoginData;
@property NSInteger *project_id;
@property NSArray *tickets;

@end
