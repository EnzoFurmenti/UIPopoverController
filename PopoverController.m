//
//  PopoverController.m
//  UIPopoverController
//
//  Created by EnzoF on 29.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "PopoverController.h"

@interface PopoverController ()<UIPopoverPresentationControllerDelegate>


@end

@implementation PopoverController

-(void)awakeFromNib{
    [super awakeFromNib];
    self.modalPresentationStyle = UIModalPresentationPopover;
    self.popoverPresentationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)popoverController:(id)popoverController valueStr:(NSString *)valueStr{
    if([valueStr length] > 0)
    {
        [self.delegate popoverController:popoverController valueFromPopover:valueStr sender:self.senderControl];
    }
}

#pragma mark - UIPopoverPresentationControllerDelegate

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection NS_AVAILABLE_IOS(8_3){
    return UIModalPresentationNone;
}



@end
