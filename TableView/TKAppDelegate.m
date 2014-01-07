//
//  TKAppDelegate.m
//  TableView
//
//  Created by Takaaki Kakinuma on 1/7/14.
//  Copyright (c) 2014 Takaaki Kakinuma. All rights reserved.
//

#import "TKAppDelegate.h"

#import "TKViewController.h"

@implementation TKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
   
    self.window.rootViewController = [TKViewController new];
    
    return YES;
}

@end
