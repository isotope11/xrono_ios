//
//  SchookaWebserviceController.m
//  Schooka
//
//  Created by Adam Gamble on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "XronoWebServiceController.h"
#import "SBJson.h"


@implementation XronoWebserviceController

-(id)init
{
    return self;
}

-(NSDictionary*)loginWithUsername:(NSString *)username password:(NSString *)password
{
    NSLog(@"login call with username:%@ and password:%@",username, password);
    jsonData = [[NSMutableData alloc] init];
    
    NSString* variables = [NSString stringWithFormat:@"email=%@&password=%@",username, password];
    
    NSData* postVariables =
    [variables dataUsingEncoding:NSASCIIStringEncoding
            allowLossyConversion:YES];
    
    NSMutableURLRequest* request =
    [[NSMutableURLRequest alloc] init];
    NSString* postLength =
    [NSString stringWithFormat:@"%d", [postVariables length]];
    NSURL* postUrl =
    [NSURL URLWithString:@"http://xrono.isotope11.com/api/v1/tokens"];
    
    [request setURL:postUrl];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength
   forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded"
   forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody: postVariables];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *jsonCheck = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSDictionary *dictionary = [jsonCheck JSONValue];
	if ([[dictionary objectForKey:@"success"] intValue] == 1)
    {
        NSLog(@"Logged in successfully.");
        NSLog(@"Token is: %@", [dictionary objectForKey:@"token"]);
    } else {
        NSLog(@"Not logged in");
    }
    return dictionary;
}

-(NSMutableArray *)loadClients:(NSString *)auth_token
{
    NSLog(@"loading clients");
    jsonData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://xrono.isotope11.com/api/v1/clients.json?auth_token=%@", auth_token]];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSString *jsonCheck = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSMutableArray *clients = [jsonCheck JSONValue];
    NSLog(@"Loaded %i clients",[clients count]);
    return clients;
}

-(NSMutableArray *)loadProjectsForClient:(NSInteger)client_id auth_token:(NSString *)auth_token
{
    NSLog(@"loading projects for client id %@",client_id);
    jsonData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://xrono.isotope11.com/api/v1/projects.json?auth_token=%@&client_id=%@", auth_token, client_id]];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSString *jsonCheck = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSMutableArray *projects = [jsonCheck JSONValue];
    NSLog(@"Loaded %i projects",[[projects valueForKey:@"project"] count]);
    return projects;
}

-(NSMutableArray *)loadTicketsForProject:(NSInteger *)project_id auth_token:(NSString *)auth_token
{
    NSLog(@"loading tickets for project %i",project_id);
    
    jsonData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://xrono.isotope11.com/api/v1/tickets.json?auth_token=%@&project_id=%i", auth_token, project_id]];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSString *jsonCheck = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSMutableArray *tickets = [jsonCheck JSONValue];
    NSLog(@"Loaded %i tickets",[tickets count]);
    NSLog(@"Tickets....%@",tickets);
    return tickets;
}

/*
-(BOOL)createWorkUnit:(NSString *)hoursType hours:(NSString *)hours description:(NSString *)description date:(NSString *)date ticket_id:(NSInteger)ticket_id{
    NSLog(@"create work unit call with ticket_id: %i and hours type:%@ and hours:%@ and description:%@ and date:%@",ticket_id,hoursType, hours, description, date); 
    jsonData = [[NSMutableData alloc] init];
    
    NSString* variables = [NSString stringWithFormat:@"work_unit[ticket_id]=%i&work_unit[scheduled_at]=%@&work_unit[hours]=%@&work_unit[description]=%@&work_unit[hours_type]=%@&auth_token=%@",ticket_id, date, hours, description, hoursType,[sharedGlobalConfiguration authToken]];
    
    NSData* postVariables =
    [variables dataUsingEncoding:NSASCIIStringEncoding
            allowLossyConversion:YES];
    
    NSMutableURLRequest* request =
    [[[NSMutableURLRequest alloc] init] autorelease];
    NSString* postLength =
    [NSString stringWithFormat:@"%d", [postVariables length]];
    NSURL* postUrl =
    [NSURL URLWithString:@"http://xrono.isotope11.com/api/v1/work_units"];
    
    [request setURL:postUrl];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength
   forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded"
   forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody: postVariables];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *jsonCheck = [[[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding] autorelease];
    NSDictionary *dictionary = [jsonCheck JSONValue];
	if ([[dictionary objectForKey:@"success"] intValue] == 1)
    {
        NSLog(@"Created WorkUnit Successfully");
        return YES;
    } else {
        NSLog(@"WorkUnit not created");
        return NO;
    }
    return YES;
}

-(NSMutableArray *)loadClients
{
    NSLog(@"loading clients");
    [jsonData release];
    jsonData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://xrono.isotope11.com/api/v1/clients.json?auth_token=%@", [sharedGlobalConfiguration authToken]]];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSString *jsonCheck = [[[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding] autorelease];
    NSMutableArray *clients = [jsonCheck JSONValue];
    [clients retain];
    NSLog(@"Loaded %i clients",[clients count]);
    return clients;
}

-(NSMutableArray *)loadProjectsForClient:(NSInteger)client_id
{
    NSLog(@"loading envelopes for client id %i",client_id);
    [jsonData release];
    jsonData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://xrono.isotope11.com/api/v1/projects.json?auth_token=%@&client_id=%i", [sharedGlobalConfiguration authToken], client_id]];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSString *jsonCheck = [[[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding] autorelease];
    NSMutableArray *projects = [jsonCheck JSONValue];
    [projects retain];
    NSLog(@"Loaded %i projects",[[projects valueForKey:@"project"] count]);
    return projects;
}

-(NSMutableArray *)loadTicketsForProject:(NSInteger)project_id
{
    NSLog(@"loading tickets for project %i",project_id);
    
    [jsonData release];
    jsonData = [[NSMutableData alloc] init];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://xrono.isotope11.com/api/v1/tickets.json?auth_token=%@&project_id=%i", [sharedGlobalConfiguration authToken], project_id]];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    NSData *returnData = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
    NSString *jsonCheck = [[[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding] autorelease];
    NSMutableArray *tickets = [jsonCheck JSONValue];
    [tickets retain];
    NSLog(@"Loaded %i tickets",[tickets count]);
    NSLog(@"%@",tickets);
    return tickets;
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [jsonData appendData:data];
    NSLog(@"Received data");
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *jsonCheck = [[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] autorelease];
    
    NSDictionary *dictionary = [jsonCheck JSONValue];
	if ([[dictionary objectForKey:@"success"] intValue] == 1)
    {
        NSLog(@"Logged in successfully.");
    } else {
        NSLog(@"Not logged in");
    }
}*/
@end