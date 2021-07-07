#pragma once
#import <Foundation/Foundation.h>
#import "main.h"
#import "helpers.h"
#import <getopt.h>

@class XGuiWindow;

@interface XGuiApplication: NSObject
{
}
@property (assign) XGuiWindow* Window;
- (instancetype) initWithArgc:(int)argc Argv:(char**)argv Options:(struct option*)longopts;
- (void) Run;
- (void) Show;
- (void) Dispose;
- (void) CreateWindow:(NSRect)rect Title:(NSString*)title;
- (id) GetParam:(NSString*)name;
- (NSString*) GetCwd;
@end

