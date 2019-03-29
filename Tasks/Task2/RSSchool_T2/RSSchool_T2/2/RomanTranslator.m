#import "RomanTranslator.h"
#import "RomanArabicLink.h"

@interface RomanTranslator()

- (NSArray *)getAlphabetArray;

- (NSDictionary *)getRomanToArabicDictionary;

- (NSDictionary *)getArabicToRomanDictionary;

- (NSArray *)convertRomanToArray:(NSString *)romanString;

- (NSUInteger)getIndexOfMaxValue:(NSArray *)values;

- (NSUInteger)arabicFromRomanValues:(NSArray *)romanValues;

- (NSString *)convertArabicToRoman:(NSInteger)arabicValue;

@end

@implementation RomanTranslator

@synthesize alphabetArray = _alphabetArray;
@synthesize romanToArabicDictionary = _romanToArabicDictionary;
@synthesize arabicToRomanDictionary = _arabicToRomanDictionary;

- (NSArray *)alphabetArray {
    return _alphabetArray;
}

- (void)setAlphabetArray:(NSArray *)alphabetArray {
    if (_alphabetArray != alphabetArray) {
        [alphabetArray retain];
        [_alphabetArray release];
        _alphabetArray = alphabetArray;
    }
}

- (NSDictionary *)romanToArabicDictionary {
    return _romanToArabicDictionary;
}

- (void)setRomanToArabicDictionary:(NSDictionary *)romanToArabicDictionary {
    if (_romanToArabicDictionary != romanToArabicDictionary) {
        [romanToArabicDictionary retain];
        [_romanToArabicDictionary release];
        _romanToArabicDictionary = romanToArabicDictionary;
    }
}

- (NSDictionary *)arabicToRomanDictionary {
    return _arabicToRomanDictionary;
}

- (void)setArabicToRomanDictionary:(NSDictionary *)arabicToRomanDictionary {
    if (_arabicToRomanDictionary != arabicToRomanDictionary) {
        [arabicToRomanDictionary retain];
        [_arabicToRomanDictionary release];
        _arabicToRomanDictionary = arabicToRomanDictionary;
    }
}

- (NSArray *)getAlphabetArray {
    NSMutableArray *array = [NSMutableArray new];
    
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"I" withArabicValue:1]];
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"IV" withArabicValue:4]];
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"V" withArabicValue:5]];
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"IX" withArabicValue:9]];
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"X" withArabicValue:10]];
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"XL" withArabicValue:40]];
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"L" withArabicValue:50]];
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"XC" withArabicValue:90]];
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"C" withArabicValue:100]];
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"CD" withArabicValue:400]];
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"D" withArabicValue:500]];
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"CM" withArabicValue:900]];
    [array addObject:[[RomanArabicLink alloc] initWithRomanValue:@"M" withArabicValue:1000]];

    NSArray *resultArray = [[NSArray alloc] initWithArray:array];
    
    [array release];
    
    return resultArray;
}

- (NSDictionary *)getRomanToArabicDictionary {
    NSDictionary *result = @{
        @"I": @1,
        @"V": @5,
        @"X": @10,
        @"L": @50,
        @"C": @100,
        @"D": @500,
        @"M": @1000
    };
    
    return result;
}

- (NSDictionary *)getArabicToRomanDictionary {
    NSDictionary *result = @{
           @1: @"I",
           @5: @"V",
          @10: @"X",
          @50: @"L",
         @100: @"C",
         @500: @"D",
        @1000: @"M"
    };
    
    return result;
}

- (id)init {
    self = [super init];
    
    if (self) {
        [self setAlphabetArray:[self getAlphabetArray]];
        [self setArabicToRomanDictionary:[self getArabicToRomanDictionary]];
        [self setRomanToArabicDictionary:[self getRomanToArabicDictionary]];
    }
    
    return self;
}

- (NSArray *)convertRomanToArray:(NSString *)romanString {
    NSUInteger strLength = [romanString length];
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:strLength];
    
    for (NSUInteger i = 0; i < strLength; i += 1) {
        [array addObject: _romanToArabicDictionary[[NSString stringWithFormat:@"%c", [romanString characterAtIndex:i]]]];
    }
    
    NSArray *resultArray = [[NSArray alloc] initWithArray:array];
    
    return resultArray;
}

- (NSUInteger)getIndexOfMaxValue:(NSArray *)values {
    [values retain];
    
    NSUInteger arrayCount = [values count];
    if (arrayCount == 0) {
        return -1;
    }
    
    NSUInteger index = 0;
    NSUInteger maxValue = [(NSNumber *)values[0] unsignedIntegerValue];
    
    for (NSUInteger i = 1; i < arrayCount; i += 1) {
        NSUInteger temp = [(NSNumber *)values[i] unsignedIntegerValue];
        
        if (temp > maxValue) {
            index = i;
            maxValue = temp;
        }
    }
    
    [values release];
    
    return index;
}

- (NSUInteger)arabicFromRomanValues:(NSArray *)romanValues {
    NSUInteger arrayCount = [romanValues count];
    
    if (arrayCount == 0) {
        return 0;
    }
    
    NSUInteger index = [self getIndexOfMaxValue:romanValues];
    
    if (index == -1) {
        return 0;
    }
    
    NSUInteger currentValue = [(NSNumber *)romanValues[index] unsignedIntegerValue];
    NSUInteger needSubstract = [self arabicFromRomanValues:[romanValues subarrayWithRange:NSMakeRange(0, index)]];
    NSUInteger needAdd = [self arabicFromRomanValues:[romanValues subarrayWithRange:NSMakeRange(index + 1, arrayCount - (index + 1))]];
    
    
    return currentValue - needSubstract + needAdd;
}

- (NSString *)convertArabicToRoman:(NSInteger)arabicValue {
    NSUInteger rest =  arabicValue;
    NSString *string = [NSMutableString new];
    
    for (NSInteger i = [_alphabetArray count] - 1; i >= 0; i -= 1) {
        RomanArabicLink *romanArabicLink = _alphabetArray[i];
        
        NSUInteger count = rest / [romanArabicLink arabicValue];
        
        if (count == 0) {
            continue;
        }
        
        string = [string stringByPaddingToLength:([string length] + (count * [[romanArabicLink romanValue] length])) withString:[romanArabicLink romanValue] startingAtIndex:0];
        
        rest -= ([romanArabicLink  arabicValue] * count);
    }
    
    return string;
}

- (NSString *)romanFromArabic:(NSString *)arabicString {
    return [self convertArabicToRoman: [(NSNumber *)arabicString integerValue]];
}

- (NSString *)arabicFromRoman:(NSString *)romanString {
    NSUInteger result = [self arabicFromRomanValues:[self convertRomanToArray:romanString]];
    
    return [NSString stringWithFormat:@"%lu", result];
}

- (void)dealloc
{
    [_alphabetArray dealloc];
    [_romanToArabicDictionary dealloc];
    [_arabicToRomanDictionary dealloc];
    
    [super dealloc];
}

@end
