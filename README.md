What is AppSoundEngineFramework good for?
=========================================

AppSoundEngine framework brings these benefits to your app's UI sounds:

- very low latency. It should not take more than 10 ms since you press button, and hear the sound for feeling of immediacy. AppSoundEngine achieves 2-10 ms, depending on the sound.

- when you use System sound services, you know, that if you start playing some sound, while the other is still playing, the new sound cuts the playing one. AppSoundEngine ensures, that the new sound will not start until the old is not finished. Because System Sound Services play asynchronously, actual user actions are not slowed down waiting for sounds to finish. This enhances user experience and the app feels (and in fact is) faster.

- super easy implementation

How to use it?
==============

For lowest play latency, you should create the sounds during app startup, and just play them when needed.

Best suited for their storage is the app delegate.



1.  create property which holds the player in AppDelegate.h and import
```objective-c
    #import "VKRSAppSoundPlayer.h"

    @property (retain) VKRSAppSoundPlayer *appSoundPlayer;
```
2.  load the sounds during startup
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    VKRSAppSoundPlayer *aPlayer = [[VKRSAppSoundPlayer alloc] init];
    [aPlayer addSoundWithFilename:@"sound1" andExtension:@"caf"];
    [aPlayer addSoundWithFilename:@"sound2" andExtension:@"caf"];
    [aPlayer addSoundWithFilename:@"sound3" andExtension:@"caf"];
    [aPlayer addSoundWithFilename:@"sound4" andExtension:@"caf"];
    self.appSoundPlayer = aPlayer;
    [aPlayer release];
}
```
3.  add method for playing sounds to the appDelegate.m
```objective-c
- (void)playSound:(NSString *)sound{

    [self.appSoundPlayer playSound:sound];
}
```
4.  just play from wherever you are
```objective-c
    [(AppDelegate *)[[UIApplication sharedApplication] delegate] playSound:@"sound1"];
```

That's it. Hope it will save you some time, and if you have any comments, suggestions or event want to make it better - please do so! :)

Thank zoul for inspiration https://gist.github.com/205857

