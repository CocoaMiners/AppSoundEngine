//
//  VKRSSound.m
//
//  Created by Vilem Kurz on 9.8.2011.
//  Copyright 2011 Cocoa Miners. All rights reserved.

#import "VKRSSound.h"

@interface VKRSSound (){
	NSDate *startPlay;
}

- (void)playFinished;

@end

@implementation VKRSSound

@synthesize delegate;

static void soundFinished (SystemSoundID mySSID, void *vkrsSound) {
    
    [(VKRSSound *)vkrsSound playFinished];   
}

- (id)initWithSoundFileURL:(NSURL *)url {
    
    self = [super init];
    
    if (self) {        
         
        AudioServicesCreateSystemSoundID((CFURLRef) url, &handle);
        AudioServicesAddSystemSoundCompletion (handle, NULL, NULL, soundFinished, self);
    }
    
    return self;
}

- (void)dealloc {
    
    AudioServicesRemoveSystemSoundCompletion(handle);
    AudioServicesDisposeSystemSoundID(handle);
    [super dealloc];
}

- (void)play {
    startPlay=[[NSDate alloc]initWithTimeIntervalSinceNow:0];
    AudioServicesPlaySystemSound(handle);
}

- (void)playFinished {

	if ([startPlay timeIntervalSinceNow]>-0.5) {
		[self.delegate soundDidFailedBecauseDeviceSilent:self];
	}else{
		[self.delegate soundDidFinishPlaying:self];
	}
}

@end
