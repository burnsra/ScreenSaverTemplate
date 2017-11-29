//
//  AppDelegate.m
//  Runner
//
//  Created by Robert Burns on 11/28/17.
//  Copyright © 2017 Robert Burns. All rights reserved.
//

#import "AppDelegate.h"
#import <ScreenSaver/ScreenSaver.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property ScreenSaverView *view;
@end

@implementation AppDelegate

- (void)awakeFromNib {
    [super awakeFromNib];
    [_window setDelegate:self];
    [_window setFrame:[self getWindowRect] display:YES];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self setupAndStartAnimation];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    [self stopAnimation];
}

- (void)windowWillClose:(NSNotification *)aNotification {
    [NSApp terminate:self];
}

- (void)setupAndStartAnimation
{
    NSBundle *saverBundle = [self loadSaverBundle];
    NSRect bounds = [_window.contentView bounds];
    Class saverClass = [saverBundle principalClass];
    _view = [[saverClass alloc] initWithFrame:bounds isPreview:NO];
    _view.autoresizingMask = NSViewWidthSizable | NSViewHeightSizable;
    _window.title = _view.className;
    [_window.contentView setAutoresizesSubviews:YES];
    [_window.contentView addSubview:_view];
    [_view startAnimation];
    [_window makeKeyWindow];
}

- (void)restartAnimation
{
    [self stopAnimation];
    [_view startAnimation];
}

- (void)stopAnimation
{
    if (_view.isAnimating) {
        [_view stopAnimation];
    }
}

- (NSBundle *)loadSaverBundle
{
    NSBundle *myBundle = [NSBundle bundleForClass:AppDelegate.self];
    NSURL *saverBundleURL = [[myBundle.bundleURL URLByDeletingLastPathComponent] URLByAppendingPathComponent:@"ScreenSaver Template.saver" isDirectory: YES];
    NSBundle *bundle = [NSBundle bundleWithURL:saverBundleURL];
    [bundle load];
    return bundle;
}

- (NSRect)getWindowRect
{
    CGFloat percent = 0.50;
    CGFloat offset = ((1.0 - percent) / 2.0);
    CGFloat W = [[NSScreen mainScreen] frame].size.width;
    CGFloat H = [[NSScreen mainScreen] frame].size.height;
    NSRect windowRect = NSMakeRect(W * offset, H * offset, W * percent, H * percent);
    return windowRect;
}

- (IBAction)showPreferences:(NSObject *)sender
{
    [_window beginSheet:_view.configureSheet completionHandler:nil];
}


@end
