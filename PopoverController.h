//
//  PopoverController.h
//  UIPopoverController
//
//  Created by EnzoF on 29.09.16.
//  Copyright © 2016 EnzoF. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopoverCDelegate;
@interface PopoverController : UIViewController

@property (weak,nonatomic,nullable) id<PopoverCDelegate> delegate;
@property (weak,nonatomic,nullable) id senderControl;

-(void)popoverController:(__nonnull id<PopoverCDelegate>)popoverController valueStr:( NSString* _Nullable )valueStr;
@end

@protocol PopoverCDelegate

@optional
-(void)popoverController:(__nonnull id<PopoverCDelegate>)popoverController
        valueFromPopover:(NSString* _Nullable)valueStr sender:(_Nullable id) senderControl;
@end

