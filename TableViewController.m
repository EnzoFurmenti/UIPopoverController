//
//  TableViewController.m
//  UIPopoverController
//
//  Created by EnzoF on 28.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"
#import "DatePickerPopoverController.h"
#import "EducationPickerViewController.h"

typedef enum{
    TableViewControllerTypeFirstName = 10,
    TableViewControllerTypeLastName  = 20,
    TableViewControllerTypeDayOfBirthField = 100,
    TableViewControllerTypeEducationField  = 200
}TableViewControllerTypeSender;

@interface TableViewController ()<UITextFieldDelegate,PopoverCDelegate>

@property (strong,nonatomic) UIBarButtonItem *infoBarButton;
@property (strong,nonatomic) NSString *infoText;
@property (strong,nonatomic) DatePickerPopoverController *datePickerPC;
@property (strong,nonatomic) EducationPickerViewController *educationPickerPC;

@end

@implementation TableViewController

-(void)loadView{
    [super loadView];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [button addTarget:self action:@selector(actionInfo:) forControlEvents:UIControlEventTouchDown];
    self.infoBarButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = self.infoBarButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dateOfBirth.delegate = self;
    self.educationTExtField.delegate = self;
    //self.datePickerPC.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50.f;
}

#pragma mark - action
-(void)actionInfo:(UIButton*)sender{
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailVC.modalPresentationStyle = UIModalPresentationPopover;
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
       switch(UI_USER_INTERFACE_IDIOM()){
           case UIUserInterfaceIdiomPhone:
               detailVC.infoText = @"Popover для Iphone";
               break;
           case UIUserInterfaceIdiomPad:
               detailVC.infoText = @"Popover для Ipad";
               break;
           default:
               detailVC.infoText = @"Popover не для Iphone и Ipad устройства";
               break;
               
       }
    [self presentViewController:detailVC animated:YES completion:nil];
    UIPopoverPresentationController *popoverPresentationC = [detailVC popoverPresentationController];
    popoverPresentationC.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popoverPresentationC.barButtonItem = self.infoBarButton;
}

#pragma mark - PopoverCDelegate

-(void)popoverController:(id<PopoverCDelegate>)popoverController valueFromPopover:(NSString *)valueStr sender:(id _Nullable)senderControl{
    //NSObject *obj =(NSObject*)popoverController;
    
    if([(NSObject*)senderControl isKindOfClass:[UITextField class]])
    {
        UITextField *textFieldObj = (UITextField*)senderControl;
        switch (textFieldObj.tag) {
            case TableViewControllerTypeDayOfBirthField:
                 self.dateOfBirth.text = valueStr;
                break;
            case TableViewControllerTypeEducationField:
                self.educationTExtField.text = valueStr;
                break;
        }
        
    }


}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    UIPopoverPresentationController *popoverPresentationC;
    BOOL totalShouldBeginEdititng = YES;
    if(textField.tag == TableViewControllerTypeDayOfBirthField)
    {
        self.datePickerPC = [self.storyboard instantiateViewControllerWithIdentifier:@"DatePickerPopoverController"];
        self.datePickerPC.delegate = self;
        self.datePickerPC.senderControl = textField;
        self.datePickerPC.modalPresentationStyle = UIModalPresentationPopover;
        [self presentViewController:self.datePickerPC animated:YES completion:nil];
        if([textField.text length] > 0)
        {
            [self.datePickerPC.datePicker setDate:[self dateFromString:textField.text] animated:YES];
        }
        popoverPresentationC = [self.datePickerPC popoverPresentationController];
        popoverPresentationC.permittedArrowDirections = UIPopoverArrowDirectionDown;
        popoverPresentationC.sourceView = textField;
        totalShouldBeginEdititng = NO;
    }
    else if(textField.tag == TableViewControllerTypeEducationField)
    {
        self.educationPickerPC = [self.storyboard instantiateViewControllerWithIdentifier:@"EducationPickerViewController"];
        self.educationPickerPC.delegate = self;
        self.educationPickerPC.senderControl = textField;
        self.educationPickerPC.modalPresentationStyle = UIModalPresentationPopover;
        [self presentViewController:self.educationPickerPC animated:YES completion:nil];
        if([textField.text length] > 0)
        {
            NSInteger indexRow = [self.educationPickerPC.arrayEducationTypes indexOfObject:textField.text];
            [self.educationPickerPC.educationPicker selectRow:indexRow inComponent:0 animated:YES];
        }
        popoverPresentationC = [self.educationPickerPC popoverPresentationController];
        popoverPresentationC.permittedArrowDirections = UIPopoverArrowDirectionDown;
        popoverPresentationC.sourceView = textField;
        totalShouldBeginEdititng = NO;
    }
    return totalShouldBeginEdititng;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    BOOL totalShouldChange = NO;
    if(textField.tag == TableViewControllerTypeFirstName)
    {
        totalShouldChange = [self shouldChangeTextField:textField.text inputStr:string];
    }
    else if(textField.tag == TableViewControllerTypeLastName)
    {
        totalShouldChange = [self shouldChangeTextField:textField.text inputStr:string];
    }
    return totalShouldChange;
}

#pragma mark - Date metods

-(NSDate*)dateFromString:(NSString*)dateStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"ru_RU"];
    [dateFormatter setDateFormat:@"dd MMMM yyyy"];
    [dateFormatter setLocale:locale];
    NSDate *date = [dateFormatter dateFromString:dateStr];
    return date;
}

-(BOOL)shouldChangeTextField:(NSString*)text inputStr:(NSString*)inputStr{
    BOOL totalShouldChange  = YES;
    NSCharacterSet *validSet = [[NSCharacterSet letterCharacterSet] invertedSet];
    NSArray *component  = [text componentsSeparatedByCharactersInSet:validSet];
    if([component count] >1)
    {
        totalShouldChange = NO;
    }
        component  = [inputStr componentsSeparatedByCharactersInSet:validSet];
    if([component count] >1)
    {
        totalShouldChange = NO;
    }
    return totalShouldChange;
}

@end
