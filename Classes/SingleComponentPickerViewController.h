//
//  SingleComponentPickerViewController.h
//  Pickers
//
//  Created by Simon Fenton on 25/05/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SingleComponentPickerViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
	UIPickerView *singlePicker;
	NSArray *pickerData;
}

@property (nonatomic, retain) IBOutlet UIPickerView *singlePicker;
@property (nonatomic, retain) NSArray *pickerData;

- (IBAction)buttonPressed;

@end
