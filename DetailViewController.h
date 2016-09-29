//
//  DetailViewController.h
//  UIPopoverController
//
//  Created by EnzoF on 28.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *infoTextView;
@property (strong,nonatomic) NSString *infoText;

@end
