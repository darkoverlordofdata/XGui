#import <Foundation/Foundation.h>
#import "XGuiApplication.h"
#import "XGuiWindow.h"

@implementation XGuiApplication
{
    NSMutableDictionary *mParams;    
    NSFileManager* mFilemgr;
}

@synthesize Window = mWindow;

/**
 *  initWithArgc:Argv:Options
 *
 *  Initializes a new application:
 *
 *  * parse the command line using getopt Options
 *  * get current working directory
 *  * get use name
 */
- (instancetype) initWithArgc:(int)argc Argv:(char**)argv Options:(struct option*)longopts {
    if (self = [super init]) {

        mFilemgr = [[NSFileManager alloc] init];

        NSString* flags = @"";
        for (int i=0; longopts[i].name != NULL; i++) {
            char val = longopts[i].val;
            NSString* str = [NSString stringWithFormat:@"%c", val];
            flags = [flags stringByAppendingString:str];
            if (longopts[i].has_arg == required_argument) {
                flags = [flags stringByAppendingString:@":"];
            }
        }

        if (self = [super init]) {
            mParams = [NSMutableDictionary dictionary];
            int longindex = -1;
            int opt = 0;

            NSLog(@"initWithArgc1\n");
            while ((opt = getopt_long(argc, argv, [flags UTF8String], longopts, &longindex))!= -1) {

                NSString* str = [NSString stringWithFormat:@"%c", opt];
                if (optarg != NULL) {
                    mParams[str] = @(optarg);
                }
                for (int i=0; longopts[i].name != NULL; i++) {
                    if (longopts[i].val == opt) {
                        NSString* name = @(longopts[i].name);
                        if (longopts[i].has_arg == required_argument) {
                            mParams[name] = @(optarg);
                        } else {
                            mParams[str] = @"YES";
                            mParams[name] = @"YES";
                        }
                    }
                }
            }
        }
    }
    return self;
}

/**
 *  getParam:name
 *
 * get command line parameter by name
 */
- (id) GetParam:(NSString*)name {
    return mParams[name];
}

/**
 *  getCwd
 *
 * get current directory
 */
- (NSString*) GetCwd {
    return [mFilemgr currentDirectoryPath];
}



/**
 *  createWindow:title
 *
 * create window and title it
 */
- (void) CreateWindow:(NSRect)rect Title:(NSString*)title {
    mWindow = [[XGuiWindow alloc]initWithApp: self Title: title Rect: rect];
}

- (void) Run {
    [mWindow Run];
}

- (void) Show {
    [mWindow Show];
}

- (void) Dispose {
    [mWindow Dispose];
}

@end