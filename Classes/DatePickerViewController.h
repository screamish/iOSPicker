//
//  DatePickerViewController.h
//  Pickers
//
//  Created by Simon Fenton on 25/05/11.
//  Copyright 2011 N/A. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DatePickerViewController : UIViewController {
	UIDatePicker *datePicker;
}

@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;

- (IBAction)buttonPressed;

@end
