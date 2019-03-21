#import "SummArray.h"

@implementation SummArray

- (NSNumber *)summArray:(NSArray *)array {
    double sum = 0;
    
    for (NSNumber *item in array) {
        sum += [item doubleValue];
    }
    
    return [NSNumber numberWithDouble:sum];
}

@end
