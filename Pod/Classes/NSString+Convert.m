//
//  NSString+Convert.m
//  Helium
//
//  Created by Alex Quinlivan on 13/03/15.
//
//

#import "NSString+Convert.h"

@implementation NSString (Convert)

-(NSString *) toCamelCase {
    NSMutableString* output = [NSMutableString string];
    BOOL makeNextCharacterUpperCase = NO;
    for (NSInteger idx = 0; idx < [self length]; idx += 1) {
        unichar c = [self characterAtIndex:idx];
        if (c == '_') {
            makeNextCharacterUpperCase = YES;
        } else if (makeNextCharacterUpperCase) {
            [output appendString:[[NSString stringWithCharacters:&c length:1] uppercaseString]];
            makeNextCharacterUpperCase = NO;
        } else {
            [output appendFormat:@"%C", c];
        }
    }
    return output;
}

-(NSString *) toCamelCaps {
    NSMutableString* output = [NSMutableString string];
    BOOL makeNextCharacterUpperCase = YES;
    for (NSInteger idx = 0; idx < [self length]; idx += 1) {
        unichar c = [self characterAtIndex:idx];
        if (c == '_') {
            makeNextCharacterUpperCase = YES;
        } else if (makeNextCharacterUpperCase) {
            [output appendString:[[NSString stringWithCharacters:&c length:1] uppercaseString]];
            makeNextCharacterUpperCase = NO;
        } else {
            [output appendFormat:@"%C", c];
        }
    }
    return output;
}

-(NSString *) toUnderscore {
    NSMutableString* output = [NSMutableString string];
    NSCharacterSet* uppercase = [NSCharacterSet uppercaseLetterCharacterSet];
    for (NSInteger idx = 0; idx < [self length]; idx += 1) {
        unichar c = [self characterAtIndex:idx];
        if ([uppercase characterIsMember:c]) {
            [output appendFormat:@"_%@", [[NSString stringWithCharacters:&c length:1] lowercaseString]];
        } else {
            [output appendFormat:@"%C", c];
        }
    }
    return output;
}

@end
