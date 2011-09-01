//
//  VKRSAppSoundPlayer.h
//
//  Created by Vilem Kurz on 9.8.2011.
//  Copyright 2011 Cocoa Miners. All rights reserved.

#import <Foundation/Foundation.h>
#import "VKRSSound.h"


@interface VKRSAppSoundPlayer : NSObject <VKRSSoundDelegate> {
    
}

- (void)playSound:(NSString *)sound;
- (void)addSoundWithFilename:(NSString *)filename andExtension:(NSString *)extension;

@end
