//
//  EducationPickerViewController.h
//  UIPopoverController
//
//  Created by EnzoF on 29.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "PopoverController.h"

@interface EducationPickerViewController : PopoverController

@property (strong,nonatomic) NSArray *arrayEducationTypes;

@property (weak, nonatomic) IBOutlet UIPickerView *educationPicker;



@end
