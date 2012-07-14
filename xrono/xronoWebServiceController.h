//
//  XronoWebserviceController.h
//  Xrono
//
//  Created by Adam Gamble on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XronoWebserviceController : NSObject {
    NSURLConnection *connection;
    NSMutableData *jsonData;
}
-(NSDictionary *)loginWithUsername:(NSString *)username password:(NSString *)password;
-(NSMutableArray *)loadClients:(NSString *)auth_token;
-(NSMutableArray *)loadProjectsForClient:(NSInteger)client_id auth_token:(NSString *)auth_token;
-(NSMutableArray *)loadTicketsForProject:(NSInteger)project_id auth_token:(NSString *)auth_token;
-(BOOL)createWorkUnit:(NSString *)hoursType hours:(NSString *)hours description:(NSString *)description date:(NSString *)date ticket_id:(NSInteger)ticket_id;
@end