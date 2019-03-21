#import "Pangrams.h"

@implementation Pangrams

const NSUInteger englishLanguageAlphabetLength = 26;

- (BOOL)pangrams:(NSString *)string {
    NSMutableString *newString = [[NSMutableString alloc] initWithString:[[[string componentsSeparatedByString:@" "] componentsJoinedByString:@""] lowercaseString]];
    
    NSMutableSet *set = [[NSMutableSet alloc] init];
    
    for (NSUInteger i = 0; i < [newString length]; i += 1) {
        [set addObject:[NSString stringWithFormat:@"%c", [newString characterAtIndex:i]]];
    }
    
    NSUInteger setCount = [set count];
    
    for (id item in set) {
        [item release];
    }
    
    [newString release];
    [set release];
    
    return setCount == englishLanguageAlphabetLength;
}

@end
