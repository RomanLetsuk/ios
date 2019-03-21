#import "Sorted.h"

@implementation ResultObject
@end

@implementation SwappedObject
@synthesize swappedArray =  _swappedArray;

- (NSArray *)swappedArray {
    return _swappedArray;
}

- (void)setSwappedArray:(NSArray *)swappedArray {
    [swappedArray retain];
    [_swappedArray release];
    _swappedArray = swappedArray;
}

@end

@implementation ReversedObject
@synthesize reversedArray =  _reversedArray;

- (NSArray *)reversedArray {
    return _reversedArray;
}

- (void)setReversedArray:(NSArray *)reversedArray {
    [reversedArray retain];
    [_reversedArray release];
    _reversedArray = reversedArray;
}

@end

@implementation Sorted

- (ResultObject *)checkAlreadySorted:(NSArray *)array {
    NSUInteger arrayLength = [array count];
    ResultObject *obj = [[ResultObject alloc] init];
    
    for (NSUInteger i = 1; i < arrayLength; i += 1) {
        if ([(NSNumber *)array[i - 1] intValue] > [(NSNumber *)array[i] intValue]) {
            [obj setStatus:false];
            return obj;
        }
    }
    
    [obj setStatus:true];
    return obj;
}

- (NSUInteger) getIndexOfIncorrectMax:(NSArray *)array {
    NSUInteger index = -1;
    NSUInteger arrayLength = [array count];
    
    for (NSUInteger i = 0; i < arrayLength - 1; i += 1) {
        if ([(NSNumber *)array[i] intValue] > [(NSNumber *)array[i + 1] intValue]) {
            return i;
        }
    }
    
    return index;
}

- (NSUInteger) getIndexOfIncorrectMin:(NSArray *)array {
    NSUInteger index = -1;
    NSUInteger arrayLength = [array count];
    
    for (NSUInteger i = arrayLength - 1; i > 0; i -= 1) {
        if ([(NSNumber *)array[i] intValue] < [(NSNumber *)array[i - 1] intValue]) {
            return i;
        }
    }
    
    return index;
}

- (NSArray *)swapTwoElements:(NSArray *)array withFirstIndex:(NSUInteger)firstIndex withSecondIndex:(NSUInteger)secondIndex {
    NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:array];
    
    id temp = mutableArray[firstIndex];
    mutableArray[firstIndex] = mutableArray[secondIndex];
    mutableArray[secondIndex] = temp;
    
    return [NSArray arrayWithArray:mutableArray];
}

- (NSArray *)reverseSubArray:(NSArray *)array from:(NSUInteger)firstIndex to:(NSUInteger)lastIndex {
    NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:[array count]];
    
    [mutableArray addObjectsFromArray:[array subarrayWithRange:NSMakeRange(0, firstIndex)]];
    
    NSArray *reversedArray = [[[array subarrayWithRange:NSMakeRange(firstIndex, lastIndex - firstIndex + 1)] reverseObjectEnumerator] allObjects];
    
    [mutableArray addObjectsFromArray:reversedArray];
    [mutableArray addObjectsFromArray:[array subarrayWithRange:NSMakeRange(lastIndex + 1, [array count] - lastIndex - 1)]];
    
    return [NSArray arrayWithArray:mutableArray];
}

- (SwappedObject *)trySwapArray:(NSArray *)array {
    SwappedObject *result = [[SwappedObject alloc] init];
    
    NSUInteger firstIndex = [self getIndexOfIncorrectMax:array];
    NSUInteger secondIndex = [self getIndexOfIncorrectMin:array];
    
    if (firstIndex == -1 || secondIndex == -1) {
        [result setWasSwapped:false];
        return result;
    }
    
    NSArray *swappedArray = [self swapTwoElements:array withFirstIndex:firstIndex withSecondIndex:secondIndex];
    
    [result setWasSwapped:true];
    [result setFirstIndex:firstIndex];
    [result setSecondIndex:secondIndex];
    [result setSwappedArray:swappedArray];
    
    return result;
}

- (ReversedObject *)tryReverseArray:(NSArray *)array {
    ReversedObject *result = [[ReversedObject alloc] init];
    
    NSUInteger firstIndex = [self getIndexOfIncorrectMax:array];
    NSUInteger secondIndex = [self getIndexOfIncorrectMin:array];
    
    if (firstIndex == -1 || secondIndex == -1) {
        [result setWasReversed:false];
        return result;
    }
    
    NSArray *reversedArray = [self reverseSubArray:array from:firstIndex to:secondIndex];
    
    [result setWasReversed:true];
    [result setFirstIndex:firstIndex];
    [result setSecondIndex:secondIndex];
    [result setReversedArray:reversedArray];
    
    return result;
}

- (ResultObject*)sorted:(NSString*)string {
    NSArray *array = [string componentsSeparatedByString:@" "];
    
    ResultObject *resultObject = [self checkAlreadySorted:array];
    
    if ([resultObject status]) {
        return resultObject;
    }
    
    SwappedObject *swappedObject = [self trySwapArray:array];
    if ([swappedObject wasSwapped]) {
        resultObject = [self checkAlreadySorted:[swappedObject swappedArray]];
        
        if ([resultObject status]) {
            [resultObject setDetail:[NSString stringWithFormat:@"swap %lu %lu", [swappedObject firstIndex] + 1, [swappedObject secondIndex] + 1]];
            return resultObject;
        }
    }
    
    ReversedObject *reversedObject = [self tryReverseArray:array];
    if ([reversedObject wasReversed]) {
        resultObject = [self checkAlreadySorted:[reversedObject reversedArray]];
        
        if ([resultObject status]) {
            [resultObject setDetail:[NSString stringWithFormat:@"reverse %lu %lu", [reversedObject firstIndex] + 1, [reversedObject secondIndex] + 1]];
            return resultObject;
        }
    }
    
    return resultObject;
}

@end
