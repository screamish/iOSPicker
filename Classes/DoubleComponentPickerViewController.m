//
//  DoubleComponentPickerViewController.m
//  Pickers
//
//  Created by Simon Fenton on 25/05/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import "DoubleComponentPickerViewController.h"


@implementation DoubleComponentPickerViewController

@synthesize doublePicker;
@synthesize breadTypes;
@synthesize fillingTypes;

-(IBAction)buttonPressed
{
	NSInteger fillingRow = [doublePicker selectedRowInComponent:kFillingComponent];
	NSInteger breadRow = [doublePicker selectedRowInComponent:kBreadComponent];
	
	NSString *filling = [fillingTypes objectAtIndex:fillingRow];
	NSString *bread = [breadTypes objectAtIndex:breadRow];
	
	NSString *message = [[NSString alloc] initWithFormat:@"Your %@ on %@ bread will be right up!", filling, bread];
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Thank you for your order"
													message:message
												   delegate:nil
										  cancelButtonTitle:@"Great!"
										  otherButtonTitles:nil];
	
	[alert show];
	[alert release];
	[message release];
}

- (void)viewDidLoad
{
	NSArray *fillingArray = [[NSArray alloc] initWithObjects:@"Ham", @"Turkey", @"Roast beef", @"Vegemite", nil];
	self.fillingTypes = fillingArray;
	[fillingArray release];
	
	NSArray *breadArray = [[NSArray alloc] initWithObjects:@"Rye", @"White", @"Multi-grain", @"Gluten free", @"Wholemeal", nil];
	self.breadTypes = breadArray;
	[breadArray release];
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
	self.fillingTypes = nil;
	self.breadTypes = nil;
	self.doublePicker = nil;
}


- (void)dealloc {
	[fillingTypes release];
	[breadTypes release];
	[doublePicker release];
    [super dealloc];
}

#pragma mark -
#pragma	mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	switch (component) {
		case kBreadComponent:
			return [self.breadTypes count];
			break;
		case kFillingComponent:
			return [self.fillingTypes count];
			break;

		default:
			return 0;
			break;
	}
}

#pragma mark Picker Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	switch (component) {
		case kBreadComponent:
			return [self.breadTypes objectAtIndex:row];
			break;
		case kFillingComponent:
			return [self.fillingTypes objectAtIndex:row];
			break;
			
		default:
			return @"Unknown";
			break;
	}
}

@end
