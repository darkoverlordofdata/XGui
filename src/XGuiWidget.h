#pragma once
#import <Foundation/Foundation.h>
#import "XGuiWindow.h"
#import "main.h"

@class XGuiFont;
@interface XGuiWidget: NSObject
{
}

@property (assign) XGuiWindow* Window;
@property (assign) BOOL Enabled;
@property (assign) BOOL Visible;
@property (assign) NSInteger X;
@property (assign) NSInteger Y;
@property (assign) NSInteger Width;
@property (assign) NSInteger Height;
@property (assign) XGuiFont* Font;
@property (nonatomic, copy) NSString* Name;

- (instancetype) initWithWindow:(XGuiWindow*)window X:(NSInteger)x Y:(NSInteger)y;
- (instancetype) initWithWindow:(XGuiWindow*)window X:(NSInteger)x Y:(NSInteger)y Width:(NSInteger)width Height:(NSInteger)height;
- (void) Draw;
- (void) Add:(XGuiWidget*)child;
@end

