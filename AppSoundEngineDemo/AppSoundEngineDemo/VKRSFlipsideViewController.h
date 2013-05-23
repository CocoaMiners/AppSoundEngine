//
//  VKRSFlipsideViewController.h
//  AppSoundEngineDemo
//
//  Created by Vilem Kurz on 3.11.2011.
//  Copyright (c) 2011 Cocoa Miners. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VKRSFlipsideViewController;

@protocol VKRSFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(VKRSFlipsideViewController *)controller;
@end

@interface VKRSFlipsideViewController : UIViewController

@property (weak, nonatomic) IBOutlet id <VKRSFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;
- (IBAction)play:(id)sender;

@end
