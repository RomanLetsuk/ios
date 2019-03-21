#import "Diagonal.h"

@implementation Diagonal

- (NSNumber *) diagonalDifference:(NSArray *)array {
    NSUInteger arrayCount = [array count];
    NSMutableArray *updatedArray = [[NSMutableArray alloc] initWithCapacity:arrayCount];
    
    [array enumerateObjectsUsingBlock:^(NSString *string, NSUInteger index, BOOL *stop) {
        [updatedArray addObject:[[NSArray alloc] initWithArray:[string componentsSeparatedByString:@" "]]];
    }];
    
    int firstDiagonal = 0;
    int secondDiagonal = 0;
    
    for (int i = 0; i < arrayCount; i += 1) {
        firstDiagonal += [(NSNumber *)updatedArray[i][i] intValue];
        secondDiagonal += [(NSNumber *)updatedArray[arrayCount - i - 1][i] intValue];
    }
    
    return [NSNumber numberWithInt:abs(firstDiagonal - secondDiagonal)];
}

@end
