#import <Foundation/Foundation.h>
#import "XGuiWidget.h"
#import "XGuiFont.h"

@implementation XGuiWidget
{
    NSMutableArray* mWidgets;
}

@synthesize Window = mWindow;
@synthesize X = mX;
@synthesize Y = mY;
@synthesize Width = mWidth;
@synthesize Height = mHeight;
@synthesize Font = mFont;
@synthesize Enabled = mEnabled;
@synthesize Visible = mVisible;
@synthesize Name = mName;

- (instancetype) initWithWindow:(XGuiWindow*)window X:(NSInteger)x Y:(NSInteger)y 
{
    if (self = [super init]) {
        mWindow = window;
        mX = x;
        mY = y;
    }
    return self;
}

- (instancetype) initWithWindow:(XGuiWindow*)window X:(NSInteger)x Y:(NSInteger)y Width:(NSInteger)width Height:(NSInteger)height 
{
    if (self = [self initWithWindow:window X:x Y:y]) {
        mWidth = width;
        mHeight = height;
    }
    return self;
}

- (void) Add:(XGuiWidget*)child 
{
    if (mWidgets == nil)
        mWidgets = [NSMutableArray arrayWithCapacity:10];

    [mWidgets addObject:child];
}

- (void) Draw 
{
    if (mWidgets != nil) {
        for (id widget in mWidgets) {
            [widget Draw];
        }
    }
}

- (void) SetFont:(NSString*)name Size:(NSInteger)size 
{
    mFont = [[XGuiFont alloc]initWithWindow:mWindow Name:name Size:size];
}

@end