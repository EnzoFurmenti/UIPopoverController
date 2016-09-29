//
//  TableViewController.m
//  UIPopoverController
//
//  Created by EnzoF on 28.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import "TableViewController.h"
#import "DetailViewController.h"

@interface TableViewController ()

@property (strong,nonatomic) UIBarButtonItem *infoBarButton;
@property (strong,nonatomic) NSString *infoText;
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

@end
