//
//  RomanArabicLink.m
//  RSSchool_T2
//
//  Created by Roma Letsuk on 3/29/19.
//  Copyright © 2019 Alexander Shalamov. All rights reserved.
//

#import "RomanArabicLink.h"

@implementation RomanArabicLink

@synthesize romanValue = _romanValue;

- (NSString *)romanValue {
    return _romanValue;
}

- (void)setRomanValue:(NSString *)romanValue {
    if (_romanValue != romanValue) {
        [_romanValue release];
        _romanValue = [romanValue copy];
    }
}

-(id) initWithRomanValue:(NSString *)romanValue withArabicValue:(NSUInteger)arabicValue {
    self = [super init];
    
    if (self) {
        [self setRomanValue:romanValue];
        [self setArabicValue:arabicValue];
    }
    
    return self;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if ([self class] != [object class]) {
        return NO;
    }
    
    RomanArabicLink *romanArabicLink = (RomanArabicLink *)object;
    
    if (![_romanValue isEqualToString:romanArabicLink.romanValue]) {
        return NO;
    }
    
    if (_arabicValue != romanArabicLink.arabicValue) {
        return NO;
    }
    
    return YES;
}

- (NSUInteger)hash {
    NSUInteger romanHash = [_romanValue hash];
    NSUInteger arabicHash = _arabicValue;
    
    return romanHash ^ arabicHash;
}

@end
