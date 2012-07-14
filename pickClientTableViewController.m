//
//  pickClientTableViewController.m
//  xrono
//
//  Created by Adam Gamble on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "pickClientTableViewController.h"
#import "workUnitNavigationControllerViewController.h"
#import "pickProjectTableViewController.h"

@interface pickClientTableViewController ()

@end

@implementation pickClientTableViewController
@synthesize LoginData;
@synthesize clients;
@synthesize client_id;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    workUnitNavigationControllerViewController *nav_controller = ((workUnitNavigationControllerViewController *) self.navigationController);
    [self setLoginData:nav_controller.LoginData];
    
    web_service = [[XronoWebserviceController alloc] init];
    [self setClients:[web_service loadClients:[[self LoginData] objectForKey:@"token"]]];
    NSLog(@"Clients....%@",self.clients);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self clients] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.textLabel.text = [[[self clients] objectAtIndex:indexPath.row] objectForKey:@"name"];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSInteger local_client_id = [[[self clients] objectAtIndex:indexPath.row] objectForKey:@"id"];
    [self setClient_id:local_client_id];
    [self performSegueWithIdentifier:@"clientToProject" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    pickProjectTableViewController *project_controller = [segue destinationViewController];
    [project_controller setLoginData: [self LoginData]];
    [project_controller setClient_id:[self client_id]];
    NSLog(@"TRYING TO SET CLIENT ID %@", self.client_id);
}


@end
