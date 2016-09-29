//
//  DetailViewController.m
//  UIPopoverController
//
//  Created by EnzoF on 28.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UIPopoverPresentationControllerDelegate>

@end

@implementation DetailViewController

-(void)awakeFromNib{
    [super awakeFromNib];
    self.modalPresentationStyle = UIModalPresentationPopover;
    self.popoverPresentationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.infoTextView.editable = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITextView*)infoTextView{
    if([self.infoText length] > 0)
    {
        _infoTextView.text = self.infoText;
    }
    return _infoTextView;
}

#pragma mark - UIPopoverPresentationControllerDelegate

-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller traitCollection:(UITraitCollection *)traitCollection NS_AVAILABLE_IOS(8_3){
    return UIModalPresentationNone;
}


@end
