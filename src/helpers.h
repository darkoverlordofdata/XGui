#import <Foundation/Foundation.h>

void die(const char *errstr, ...);
int file_exists(char* filename);

char* image_filename(char* str, char* user, char* theme, char* name, char* type);
char* calendar_filename(char* str, char* user, char* name, char* type);
int char_is_hex(char hexch);
int string_is_hex(char* hexst);
