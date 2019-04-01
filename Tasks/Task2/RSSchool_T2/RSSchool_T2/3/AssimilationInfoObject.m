//
//  AssimilationInfoObject.m
//  RSSchool_T2
//
//  Created by Roma Letsuk on 4/1/19.
//  Copyright © 2019 Alexander Shalamov. All rights reserved.
//

#import "AssimilationInfoObject.h"

@interface AssimilationInfoObject()<AssimilationInfo>

@property (nonatomic, readwrite) NSInteger years;
@property (nonatomic, readwrite) NSInteger months;
@property (nonatomic, readwrite) NSInteger weeks;
@property (nonatomic, readwrite) NSInteger days;
@property (nonatomic, readwrite) NSInteger hours;
@property (nonatomic, readwrite) NSInteger minutes;
@property (nonatomic, readwrite) NSInteger seconds;

@end

@implementation AssimilationInfoObject

@synthesize years = _years;
@synthesize months = _months;
@synthesize weeks = _weeks;
@synthesize days = _days;
@synthesize hours = _hours;
@synthesize minutes = _minutes;
@synthesize seconds = _seconds;

- (NSInteger)years {
    return _years;
}

- (void)setYears:(NSInteger)years {
    _years = years;
}

- (NSInteger)months {
    return _months;
}

- (void)setMonths:(NSInteger)months {
    _months = months;
}

- (NSInteger)weeks {
    return _weeks;
}

- (void)setWeeks:(NSInteger)weeks {
    _weeks = weeks;
}

- (NSInteger)days {
    return _days;
}

- (void)setDays:(NSInteger)days {
    _days = days;
}

- (NSInteger)hours {
    return _hours;
}

- (void)setHours:(NSInteger)hours {
    _hours = hours;
}

- (NSInteger)minutes {
    return _minutes;
}

- (void)setMinutes:(NSInteger)minutes {
    _minutes = minutes;
}

- (NSInteger)seconds {
    return _seconds;
}

- (void)setSeconds:(NSInteger)seconds {
    _seconds = seconds;
}

@end
