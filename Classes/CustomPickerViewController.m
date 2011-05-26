//
//  CustomPickerViewController.m
//  Pickers
//
//  Created by Simon Fenton on 25/05/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import "CustomPickerViewController.h"


@implementation CustomPickerViewController

@synthesize picker;
@synthesize winLabel;
@synthesize column1;
@synthesize column2;
@synthesize column3;
@synthesize column4;
@synthesize column5;

- (IBAction)spin
{
	BOOL win = NO;
	int numInRow = 1;
	int lastVal = -1;
	for (int i = 0; i < 5; i++) {
		int newValue = random() % [self.column1 count];
		
		if (newValue == lastVal) {
			numInRow++;
		} else {
			numInRow = 1;
		}
		
		lastVal = newValue;
		
		[picker selectRow:newValue inComponent:i animated:YES];
		[picker reloadComponent:i];
		if (numInRow > 3) {
			win = YES;
		}
	}
	
	if (win) {
		winLabel.text = @"WINNAR IZ U!";
	} else {
		winLabel.text = @"";
	}
}

- (void)viewDidLoad {
	for (int i = 1; i <= 5; i++) {
		NSArray *items = [[NSArray alloc] initWithObjects:@"ア", @"カ", @"サ", @"タ", @"ナ", @"ハ", @"マ", @"ヤ", @"ラ", @"ワ", nil];
		
		NSString *fieldName = [[NSString alloc] initWithFormat:@"column%d", i];
		[self setValue:items forKey:fieldName];
		[fieldName release];
		[items release];		
	}
	
	srandom(time(NULL));
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.picker = nil;
	self.winLabel = nil;
	self.column1 = nil;
	self.column2 = nil;
	self.column3 = nil;
	self.column4 = nil;
	self.column5 = nil;
}


- (void)dealloc {
	[picker release];
	[winLabel release];
	[column1 release];
	[column2 release];
	[column3 release];
	[column4 release];
	[column5 release];
    [super dealloc];
}

#pragma mark -
#pragma mark Picker Data Source Methods

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 5;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	//HACK this is filthy, but since they're all the same now, who cares, right?! HAH!
	return [self.column1 count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	NSString *arrayName = [[NSString alloc] initWithFormat:@"column%d", component+1];
	NSArray *data = [self valueForKey:arrayName];
	[arrayName release];
	
	return [data objectAtIndex:row];
}

@end
