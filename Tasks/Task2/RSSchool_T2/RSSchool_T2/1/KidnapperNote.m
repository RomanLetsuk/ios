#import "KidnapperNote.h"

@implementation KidnapperNote

- (BOOL)checkMagazine:(NSString *)magaine note:(NSString *)note {
    NSMutableArray *magazineWords = [[NSMutableArray alloc] initWithArray:[[magaine lowercaseString] componentsSeparatedByString:@" "]];
    NSArray *noteWords = [[NSArray alloc] initWithArray:[[note lowercaseString] componentsSeparatedByString:@" "]];
    BOOL result = true;
    
    for (NSString *item in noteWords) {
        NSUInteger index = [magazineWords indexOfObject:item];
        
        if (index == NSNotFound) {
            result = false;
            break;
        }
        
        [magazineWords removeObjectAtIndex:index];
    }
    
    [magazineWords release];
    [noteWords release];
    
    return result;
}

@end
