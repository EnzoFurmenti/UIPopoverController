//
//  DatePickerPopoverController.m
//  UIPopoverController
//
//  Created by EnzoF on 29.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "DatePickerPopoverController.h"

@interface DatePickerPopoverController ()

@end

@implementation DatePickerPopoverController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self popoverController:self valueStr:[self stringFromDate:self.datePicker.date]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(IBAction)actionValueChanged:(UIDatePicker*)sender{
    NSDate *date = sender.date;
    NSString *dateStr = [self stringFromDate:date];
    [self popoverController:self valueStr:dateStr];
}

-(NSString*)stringFromDate:(NSDate*)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setLocale:locale];
    [dateFormatter setDateFormat:@"dd MMMM yyyy"];
    NSString *dateStr = [dateFormatter stringFromDate:date];
    return dateStr;
}

@end
