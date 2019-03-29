//
//  RomanArabicLink.h
//  RSSchool_T2
//
//  Created by Roma Letsuk on 3/29/19.
//  Copyright © 2019 Alexander Shalamov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RomanArabicLink : NSObject

@property (nonatomic, copy) NSString *romanValue;
@property (nonatomic, assign) NSUInteger arabicValue;

-(id) initWithRomanValue:(NSString *)romanValue withArabicValue:(NSUInteger)arabicValue;

@end
