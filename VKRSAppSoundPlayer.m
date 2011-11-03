//
//  VKRSAppSoundPlayer.m
//
//  Created by Vilem Kurz on 9.8.2011.
//  Copyright 2011 Cocoa Miners. All rights reserved.

#import "VKRSAppSoundPlayer.h"

@interface VKRSAppSoundPlayer ()

@property (nonatomic, copy) NSMutableDictionary *sounds;
@property (nonatomic, copy) NSMutableArray *soundsToPlay;

@end

@implementation VKRSAppSoundPlayer

@synthesize sounds;
@synthesize soundsToPlay;

- (void)dealloc {
    
    [sounds release];
    [soundsToPlay release];
    
    [super dealloc];
}

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        sounds = [[NSMutableDictionary alloc] initWithCapacity:0];
        soundsToPlay = [[NSMutableArray alloc] initWithCapacity:0];        
    }
    
    return self;
}

- (void)playSound:(NSString *)sound {
    
    VKRSSound *soundToPlay = [self.sounds objectForKey:sound];
    
    if ([self.soundsToPlay count] == 0) {        
        [soundToPlay play];
    }
    
    [soundsToPlay addObject:soundToPlay];    
}

- (void)addSoundWithFilename:(NSString *)filename andExtension:(NSString *)extension {
    
    NSURL *soundFileURL = [[NSBundle mainBundle] URLForResource:filename withExtension:extension];
    VKRSSound *aSound = [[VKRSSound alloc] initWithSoundFileURL:soundFileURL];
    aSound.delegate = self;
    [self.sounds setObject:aSound forKey:filename];
    [aSound release];       
}

#pragma mark -
#pragma mark VKRSSoundDelegate methods

- (void)soundDidFinishPlaying:(VKRSSound *)sound {
    
    [self.soundsToPlay removeObjectAtIndex:0];
    
    if ([self.soundsToPlay count]) {
        VKRSSound *soundToPlay = [self.soundsToPlay objectAtIndex:0];
        [soundToPlay play];
    }
}

@end
