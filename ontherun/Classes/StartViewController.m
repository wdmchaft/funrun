    //
//  StartViewController.m
//  ontherun
//
//  Created by Matt Donahoe on 3/14/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "StartViewController.h"
#import "FRBriefingViewController.h"
#import "FRMissionChase.h"
#import "FRMissionOne.h"
#import "FRMissionTwo.h"

@implementation StartViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	NSLog(@"first view loaded");
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	NSLog(@"first view unloaded");
}
- (void)dealloc {
	[missionLabel release];
    [super dealloc];
}
- (IBAction)doAction:(id)sender{
	//have different nibs for different missions?
	//or download from the interwebs?
	FRBriefingViewController * detailViewController =
	[[FRBriefingViewController alloc] initWithNibName:@"FRBriefingViewController" bundle:nil];
	[self.navigationController pushViewController:detailViewController animated:YES];
	[detailViewController release];	
}
@end