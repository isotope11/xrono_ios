//
//  pickClientTableViewController.h
//  xrono
//
//  Created by Adam Gamble on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xronoWebServiceController.h"

@interface pickClientTableViewController : UITableViewController {
    XronoWebserviceController *web_service;
}


@property (nonatomic, strong) NSDictionary *LoginData;
@property (nonatomic, strong) NSArray *clients;
@property (nonatomic) NSInteger *client_id;
@end
