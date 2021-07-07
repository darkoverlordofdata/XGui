#import <Foundation/Foundation.h>
#import "XGuiLabel.h"
#import "XGuiFont.h"

@implementation XGuiLabel
@synthesize X = mX;
@synthesize Y = mY;
@synthesize Font = mFont;
@synthesize Text = mText;

- (instancetype) initWithX:(NSInteger)x Y:(NSInteger)y Text:(NSString*)text  Font:(XGuiFont*)font 
{
    if (self = [super init]) {
        mX = x;
        mY = y;
        mText = text;
        mFont = font;
    }
    return self;

}


- (void) Draw
{
    
}

@end