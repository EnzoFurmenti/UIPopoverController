//
//  EducationPickerViewController.m
//  UIPopoverController
//
//  Created by EnzoF on 29.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "EducationPickerViewController.h"

@interface EducationPickerViewController ()<PopoverCDelegate,UIPickerViewDelegate,UIPickerViewDataSource>


@end

@implementation EducationPickerViewController
-(void)loadView{
    [super loadView];
    [self.educationPicker setDelegate:self];
    [self.educationPicker setDataSource:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayEducationTypes = @[@"Среднее",@"Неполное",@"Полное"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSString *strEducation = [self.arrayEducationTypes objectAtIndex:[self.educationPicker selectedRowInComponent:0]];
    [self popoverController:self valueStr:strEducation];
}

#pragma mark - UIPickerViewDataSource


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.arrayEducationTypes count];
}


#pragma mark - UIPickerViewDelegate


- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component __TVOS_PROHIBITED{
    
    return [self.arrayEducationTypes objectAtIndex:row];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED{
    NSString *valueStr = [self.arrayEducationTypes objectAtIndex:row];
    [self popoverController:self valueStr:valueStr];
}
@end
