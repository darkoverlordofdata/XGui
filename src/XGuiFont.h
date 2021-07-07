#pragma once
#import <Foundation/Foundation.h>
#import "XGuiWindow.h"
#import "main.h"

@interface XGuiFont: NSObject
{
}
@property (copy) NSString *FullName;
@property (copy) NSString *Name;
@property (assign) NSInteger Size;
@property (assign) XftFont *FtFont;
@property (assign) XGuiWindow *Window;
- (instancetype) initWithWindow:(XGuiWindow*)window Name:(NSString*)name Size:(NSInteger)size;

@end
