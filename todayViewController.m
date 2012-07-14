//
//  todayViewController.m
//  xrono
//
//  Created by Adam Gamble on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "todayViewController.h"
#import "workUnitNavigationControllerViewController.h"

@interface todayViewController ()

@end

@implementation todayViewController
@synthesize LoginData;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CountryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    if ([indexPath row] == 0) {
        cell.textLabel.text = @"Hours on this check";
        cell.detailTextLabel.text = [[self LoginData] objectForKey:@"current_hours"];
    } 
    if ([indexPath row] == 1) {
        cell.textLabel.text = @"Paid Time Off";
        cell.detailTextLabel.text = [[self LoginData] objectForKey:@"pto_hours"];  
    }
    if ([indexPath row] == 2) {
        cell.textLabel.text = @"Offset";
        cell.detailTextLabel.text = [[self LoginData] objectForKey:@"offset"];  
    }
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    workUnitNavigationControllerViewController *nav_controller = [segue destinationViewController];
    [nav_controller setLoginData: [self LoginData]];
}

@end
