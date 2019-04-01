//
//  AssimilationInfoObject.h
//  RSSchool_T2
//
//  Created by Roma Letsuk on 4/1/19.
//  Copyright © 2019 Alexander Shalamov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoomsdayMachine.h"

@interface AssimilationInfoObject : NSObject<AssimilationInfo>

- (NSInteger)years;
- (void)setYears:(NSInteger)years;
- (NSInteger)months;
- (void)setMonths:(NSInteger)months;
- (NSInteger)weeks;
- (void)setWeeks:(NSInteger)weeks;
- (NSInteger)days;
- (void)setDays:(NSInteger)days;
- (NSInteger)hours;
- (void)setHours:(NSInteger)hours;
- (NSInteger)minutes;
- (void)setMinutes:(NSInteger)minutes;
- (NSInteger)seconds;
- (void)setSeconds:(NSInteger)seconds;

@end
