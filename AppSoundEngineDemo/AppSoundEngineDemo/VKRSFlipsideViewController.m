//
//  VKRSFlipsideViewController.m
//  AppSoundEngineDemo
//
//  Created by Vilem Kurz on 3.11.2011.
//  Copyright (c) 2011 Cocoa Miners. All rights reserved.
//

#import "VKRSFlipsideViewController.h"
#import "VKRSAppSoundPlayer.h"
#import "SettingsKeyNames.h"

@interface VKRSFlipsideViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *soundsSwitch;

@end

@implementation VKRSFlipsideViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.soundsSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:ASESoundsEnableSettingKey];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [[VKRSAppSoundPlayer sharedInstance] playSound:@"touch"];
    [[VKRSAppSoundPlayer sharedInstance] playSound:@"flip"];
    [self.delegate flipsideViewControllerDidFinish:self];
}

- (IBAction)play:(id)sender {

    [[VKRSAppSoundPlayer sharedInstance] playSound:@"flip"];
}

- (IBAction)soundsSettingChange:(UISwitch *)sender {
    
    BOOL soundsEnabled = sender.on;
    [[NSUserDefaults standardUserDefaults] setBool:soundsEnabled forKey:ASESoundsEnableSettingKey];
    [[VKRSAppSoundPlayer sharedInstance] setSoundsEnabled:soundsEnabled];
    [[VKRSAppSoundPlayer sharedInstance] playSound:@"touch"];    
}

@end
