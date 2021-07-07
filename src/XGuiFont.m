#import <Foundation/Foundation.h>
#import "XGuiFont.h"

@implementation XGuiFont
@synthesize FullName = mFullName;
@synthesize Name = mName;
@synthesize Size = mSize;
@synthesize FtFont = mFtFont;
@synthesize Window = mWindow;

- (instancetype) initWithWindow:(XGuiWindow*)window Name:(NSString*)name Size:(NSInteger)size
{
    if (self = [super init]) {
        mName = name;
        mSize = size;
    
        mFullName = [NSString stringWithFormat:@"%@%ld", name, size];

        mFtFont = XftFontOpenName(mWindow.Display, mWindow.Screen, [mFullName UTF8String]);

    }
    return self;

}

@end
