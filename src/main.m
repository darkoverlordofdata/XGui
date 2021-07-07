/* ******************************************************************************
 * Copyright 2020 bruce davidson <darkoverlordofdata@gmail.com>.
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the <organization> nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 ******************************************************************************/
#import "main.h"
#import "XGuiApplication.h"
#import "XGuiWindow.h"
#import <getopt.h>

void processParams(XGuiApplication* app);

static struct option longopts[] = {
    {"help", no_argument, NULL, 'h'},
    {"version", no_argument, NULL, 'V'},
    {"scrot", no_argument, NULL, 's'},
    {"calendar", required_argument, NULL, 'c'},
    {"pin", required_argument, NULL, 'p'},
    {"verbosity", required_argument, NULL, 'v'},
    {"font", required_argument, NULL, 'f'},
    {"theme", required_argument, NULL, 't'},
    {"tz", required_argument, NULL, 'z'},
    {NULL}
};

int main(int argc, char **argv) {

    
    @autoreleasepool {

        XGuiApplication* app = [[XGuiApplication alloc]initWithArgc:argc Argv:argv Options:longopts];

        if ([[app GetParam:@"version"] isEqual:@"YES"]) {
            printf("catlock v0.1.0, © 2020 Dark Overlord of Data\n");
            printf("inspired by metalock © 2012 Timothy Beyer\n");
            exit(0);
        }

        if ([[app GetParam:@"help"] isEqual:@"YES"]) {
            printf("Usage: catlock [option]\n");
            printf("\n");
            printf("-h / --help               help (self)\n");
            printf("-V / --version            version information\n");
            printf("-s / --scrot              take screen pics\n");
            printf("-c / --calendar           calendar app, such as \"orage\"\n");
            printf("-v n / --verbosity n      verbosity level (default: 0)\n");
            printf("-f name / --font name     X11 font name\n");
            printf("-t name / --theme name    theme name (default: badabing)\n");
            printf("\n");
            printf("https://github.com/darkoverlordofdata/kitty-cat-lock\n" );
            exit(0);
        }


        NSLog(@"CWD: %@\n", [app GetCwd]);

        XGuiWindow* win = [[XGuiWindow alloc]initWithApp:app Title:@"BadaBing" 
                        Rect:NSMakeRect(100, 100, 520, 400)];
        [win Show];
        [win Run];
        [win Dispose];

    }
    return 0;
    
}
