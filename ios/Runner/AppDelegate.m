#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  [GMSServices provideAPIKey: @"AIzaSyCJqJKYtyWyFLswLaM7qTdmT3R30xbXId4"];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
