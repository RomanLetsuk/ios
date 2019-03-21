#import "Encryption.h"

@implementation Encryption

- (NSString *)encryption:(NSString *)string {
    NSString *stringWithoutSpaces = [[string componentsSeparatedByString:@" "] componentsJoinedByString:@""];
    
    double tempLength = sqrt([stringWithoutSpaces length]);
    int rows = (int)floor(tempLength);
    int columns = (int)ceil(tempLength);
    
    if (rows * columns < [stringWithoutSpaces length]) {
        rows += 1;
    }
    
    NSMutableArray *encryptionMatrix = [[NSMutableArray alloc] initWithCapacity:rows];
    
    for (int i = 0; i < rows; i += 1) {
        NSUInteger rangeLength = columns;

        if (rows - 1 == i) {
            rangeLength = [stringWithoutSpaces length] - columns *  i;
        }
        
        encryptionMatrix[i] = [[NSString alloc] initWithString:[stringWithoutSpaces substringWithRange:NSMakeRange(i * columns, rangeLength)]];
    }
    
    NSMutableString *result = [[NSMutableString alloc] initWithCapacity: [stringWithoutSpaces length] + rows];
    
    for (NSUInteger columnIndex = 0; columnIndex < columns; columnIndex += 1) {
        for (NSUInteger rowIndex = 0; rowIndex < rows; rowIndex += 1) {
            NSString *row = encryptionMatrix[rowIndex];
            
            if ([row length] > columnIndex) {
                [result appendString:[NSString stringWithFormat:@"%c", [row characterAtIndex:columnIndex]]];
            }
        }
        
        [result appendString:@" "];
    }
    
    [stringWithoutSpaces release];
    for (id item in encryptionMatrix) {
        [item release];
    }
    [encryptionMatrix release];
    
    return [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
