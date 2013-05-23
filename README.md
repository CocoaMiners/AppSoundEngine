What is AppSoundEngineFramework good for?
=========================================

AppSoundEngine framework brings these benefits to your app's UI sounds:

- very low latency. It should not take more than 10 ms since you press button, and hear the sound for feeling of immediacy. AppSoundEngine achieves 2-10 ms, depending on the sound.

- when you use System sound services, if you start playing some sound, while the other is still playing, the new sound cuts the playing one. AppSoundEngine ensures, that the new sound will not start until the old is not finished. Because System Sound Services play asynchronously, actual user actions are not slowed down waiting for sounds to finish. This enhances user experience and the app feels (and in fact is) faster.

- super easy implementation

- flexibility. You can choose to use only VRKSSound, and add it to your app how it suits you. 

How to use it?
==============

For lowest possible play latency, you should create the sounds during app startup, and just play them when needed.

+ add AudioToolbox framework to your project. If you do not know how, here is link to apple doc:
https://developer.apple.com/library/ios/#recipes/xcode_help-project_editor/Articles/AddingaLibrarytoaTarget.html#//apple_ref/doc/uid/TP40010155-CH17-SW1

+ add all files from AppSoundEngine folder by dragging the folder from finder to your project navigator

+ load the player singleton with sounds in AppDelegate.m during startup. Optionally you can check for user sound preference (sounds are ON by default).

```objective-c
#import "VKRSAppSoundPlayer.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [[VKRSAppSoundPlayer sharedInstance] addSoundWithFilename:@"sound1" andExtension:@"caf"];
    [[VKRSAppSoundPlayer sharedInstance] addSoundWithFilename:@"sound2" andExtension:@"caf"];
    [[VKRSAppSoundPlayer sharedInstance] setSoundsEnabled:[[NSUserDefaults standardUserDefaults] boolForKey:ASESoundsEnableSettingKey]];
}
```
+ just play from wherever you are

```objective-c
    [[VKRSAppSoundPlayer sharedInstance] playSound:@"sound1"];
```

Info about how to prepare sound files to work with System Sound Services is [here](http://www.cocoaminers.com/?p=39)

Thanks zoul for inspiration https://gist.github.com/205857


