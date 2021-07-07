#pragma once
#import <Foundation/Foundation.h>
#import "main.h"
#import "helpers.h"


@class XGuiApplication;

@interface XGuiWindow: NSObject

@property (assign) NSInteger X;
@property (assign) NSInteger Y;
@property (assign) NSInteger Width;
@property (assign) NSInteger Height;
@property (assign) Display *Display;
@property (assign) Window Window;
@property (assign) Visual *Visual;
@property (assign) NSInteger Screen;
@property (assign) XftDraw *Drawable;
@property (assign) XftColor Color;
@property (assign) XftColor Bgcolor;
@property (assign) Colormap ColorMap;
@property (assign) Cursor Invisible;
@property (nonatomic, copy) NSString* Title;
- (instancetype) initWithTitle:(NSString*)title Rect:(NSRect)rect;
- (instancetype) initWithApp:(id)app Title:(NSString*)title Rect:(NSRect)rect;
- (void) SetFont:(NSString*)name Size:(NSInteger)size;
- (void) Draw;
- (void) Run;
- (void) Show;
- (void) Dispose;
- (BOOL) CheckEvent:(XEvent*)event To:(NSString*)to;
@end

