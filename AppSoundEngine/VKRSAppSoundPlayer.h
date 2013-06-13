//
//  VKRSAppSoundPlayer.h
//
//  Created by Vilem Kurz on 9.8.2011.
//  Copyright 2011 Cocoa Miners. All rights reserved.

#import <Foundation/Foundation.h>
#import "VKRSSound.h"


@interface VKRSAppSoundPlayer : NSObject <VKRSSoundDelegate>

//the default value is YES. If you have sounds enabling/disabling switch in your app, read the setting from defaults and configure player.
@property (nonatomic) BOOL soundsEnabled;

+ (id)sharedInstance;

/* plays sound after playing is finish (waits for playing sound to finish, if some sound is playing) */
- (void)playSound:(NSString *)sound __attribute__((deprecated("use playSound:wait: instead")));
- (void)playSound:(NSString *)sound wait:(BOOL)wait;

- (void)addSoundWithFilename:(NSString *)filename andExtension:(NSString *)extension;

@end
