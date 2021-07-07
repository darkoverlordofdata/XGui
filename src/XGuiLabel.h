#pragma once
#import <Foundation/Foundation.h>
#import "main.h"

@class XGuiFont;


@interface XGuiLabel: NSObject
{
}
@property (assign) NSInteger X;
@property (assign) NSInteger Y;
@property (assign) XGuiFont* Font;
@property (nonatomic, copy) NSString* Text;

- (instancetype) initWithX:(NSInteger)x Y:(NSInteger)y Text:(NSString*)text  Font:(XGuiFont*)font;
- (void) Draw;
@end

