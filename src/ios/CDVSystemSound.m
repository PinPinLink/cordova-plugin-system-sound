#import "CDVSystemSound.h"

@implementation CDVSystemSound

- (void)pluginInitialize {}

- (void)play:(CDVInvokedUrlCommand *)command {
  NSString* path = [command.arguments objectAtIndex:0];
  NSNumber* count = [command argumentAtIndex:1 withDefault:[NSNumber numberWithInt:1]];
  NSString* directory = [path stringByDeletingLastPathComponent];
  NSString* fileName = [[path lastPathComponent] stringByDeletingPathExtension];
  NSString* extension = [path pathExtension];
  path = [[NSBundle mainBundle] pathForResource:fileName ofType:extension inDirectory:directory];
  if (path) {
    NSURL* url =[NSURL fileURLWithPath:path];
    SystemSoundID soundId;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &soundId);
    playSuound(soundId, [count intValue]);
  }
}

static void playSuound(SystemSoundID soundId, int count) {
  AudioServicesAddSystemSoundCompletion(soundId, NULL, NULL, completionCallback, (void*)(count - 1));
  AudioServicesPlaySystemSound(soundId);
}

static void completionCallback(SystemSoundID soundId, void* data) {
  int count = (int)data;
  if (count > 0) {
    AudioServicesRemoveSystemSoundCompletion(soundId);
    playSuound(soundId, count);
  } else {
    AudioServicesDisposeSystemSoundID(soundId);
  }
}

@end
