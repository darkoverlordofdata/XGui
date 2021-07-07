#import <Foundation/Foundation.h>
#import "XGuiWindow.h"
#import "XGuiApplication.h"


@implementation XGuiWindow
{
    XGuiApplication* mApp;
    Atom WM_DELETE_WINDOW;
}

@synthesize X = mX;
@synthesize Y = mY;
@synthesize Width = mWidth;
@synthesize Height = mHeight;
@synthesize Display = mDisplay;
@synthesize Window = mWindow;
@synthesize Screen = mScreen;
@synthesize Visual = mVisual;
@synthesize Drawable = mDrawable;
@synthesize Color = mColor;
@synthesize Bgcolor = mBgcolor;
@synthesize ColorMap = mColorMap;
@synthesize Invisible = mInvisible;
@synthesize Title = mTitle;


- (instancetype) initWithApp:(id)App Title:(NSString*)Title Rect:(NSRect)rect {

    if (self = [super init]) {
        mApp = App;
        mTitle = Title;
        mX = rect.origin.x;
        mY = rect.origin.y;
        mWidth = rect.size.width;
        mHeight = rect.size.height;

        mDisplay = XOpenDisplay(NULL);

        if (mDisplay == NULL) {
            fprintf(stderr, "Cannot open display\n");
            exit(1);
        }

        mScreen = DefaultScreen(mDisplay);
        mVisual = DefaultVisual(mDisplay, mScreen);
        mColorMap = DefaultColormap(mDisplay, mScreen);

        XColor bg = { 0, 0, 0, 0 }; // black
        XColor fg = { 0, 65535, 65535, 65535 }; // white

        XAllocColor(mDisplay, mColorMap, &bg);
        XAllocColor(mDisplay, mColorMap, &fg);
    }
    return self;

}

- (instancetype) initWithTitle:(NSString*)Title Rect:(NSRect)rect {

    if (self = [super init]) {
        mTitle = Title;
        mX = rect.origin.x;
        mY = rect.origin.y;
        mWidth = rect.size.width;
        mHeight = rect.size.height;

        mDisplay = XOpenDisplay(NULL);

        if (mDisplay == NULL) {
            fprintf(stderr, "Cannot open display\n");
            exit(1);
        }

        mScreen = DefaultScreen(mDisplay);
        mVisual = DefaultVisual(mDisplay, mScreen);

        mColorMap = DefaultColormap(mDisplay, mScreen);

        XColor bg = { 0, 0, 0, 0 }; // black
        XColor fg = { 0, 65535, 65535, 65535 }; // white

        XAllocColor(mDisplay, mColorMap, &bg);
        XAllocColor(mDisplay, mColorMap, &fg);
    }
    return self;

}

- (BOOL) CheckEvent:(XEvent*)event To:(NSString*)to {
    if ([to isEqualToString:[NSString stringWithUTF8String:"WM_DELETE_WINDOW"]]) {
        if ((event->type == ClientMessage) && 
            (event->xclient.data.l[0] == WM_DELETE_WINDOW))
                return YES;
    }
    return NO;

}

- (void) Draw {

   const char *msg = "Hello, World!";

    XFillRectangle(mDisplay, mWindow, DefaultGC(mDisplay, mScreen), 20, 20, 10, 10);
    XDrawString(mDisplay, mWindow, DefaultGC(mDisplay, mScreen), 10, 50, msg, strlen(msg));

}

- (void) Run {
    XEvent e;
    bool done = false;
    int i;
    char text[10];
    KeySym key;

    while (done == false) {
        XNextEvent(mDisplay, &e);
        if (e.type == KeyPress)
        {
            i = XLookupString((XKeyEvent*)&e, text, 10, &key, 0);
            if(i==1 && text[0]=='q') done = true;
        }
        else if (e.type == Expose) 
        {
            [self Draw];
        }
        else if ([self CheckEvent:&e To:@"WM_DELETE_WINDOW"])
        {
            done = true;
        }

    }

}

- (void) Show {

    NSLog(@"show: %ld %ld %ld %ld\n", mX, mY, mWidth, mHeight);
    mWindow = XCreateSimpleWindow(mDisplay, 
                RootWindow(mDisplay, mScreen), 
                0, 0, 1, 1, 1,
                BlackPixel(mDisplay, mScreen), 
                WhitePixel(mDisplay, mScreen));
    XSelectInput(mDisplay, mWindow, ExposureMask | KeyPressMask);

    XStoreName(mDisplay, mWindow, [mTitle UTF8String]);
    XMapWindow(mDisplay, mWindow);

    XMoveResizeWindow(mDisplay, mWindow, mX, mY, mWidth, mHeight);
    WM_DELETE_WINDOW = XInternAtom(mDisplay, "WM_DELETE_WINDOW", NO); 
    XSetWMProtocols(mDisplay, mWindow, &WM_DELETE_WINDOW, 1);  
}

- (void) Dispose {
    XCloseDisplay(mDisplay);
}
@end
