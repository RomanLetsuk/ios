#import "Pangrams.h"

@implementation Pangrams

const NSUInteger englishLanguageAlphabetLength = 26;

- (BOOL)pangrams:(NSString *)string {
    NSMutableString *newString = [[NSMutableString alloc] initWithString:[[[string componentsSeparatedByString:@" "] componentsJoinedByString:@""] lowercaseString]];
    
    NSMutableSet *set = [[NSMutableSet alloc] init];
    
    for (NSUInteger i = 0; i < [newString length]; i += 1) {
        [set addObject:[NSString stringWithFormat:@"%c", [newString characterAtIndex:i]]];
    }
    
    return [set count] == englishLanguageAlphabetLength;
}

@end
