#import "DoomsdayMachine.h"
#import "AssimilationInfoObject.h"

@protocol AssimilationInfo <NSObject>
@property (nonatomic, readonly) NSInteger years;
@property (nonatomic, readonly) NSInteger months;
@property (nonatomic, readonly) NSInteger weeks;
@property (nonatomic, readonly) NSInteger days;
@property (nonatomic, readonly) NSInteger hours;
@property (nonatomic, readonly) NSInteger minutes;
@property (nonatomic, readonly) NSInteger seconds;
@end

@implementation DoomsdayMachine

- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString {
    id<AssimilationInfo> obj = [AssimilationInfoObject new];
    
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"YYYY:MM:dd\'@\'ss\\mm/HH"];
    
    NSDate *startDate = [dateFormatter dateFromString:dateString];
    NSDate *endDate = [dateFormatter dateFromString:@"2208:08:14@37\\13/03"];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSUInteger flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfMonth;
    
    NSDateComponents *components = [calendar components:flags fromDate:startDate toDate:endDate options:0];
    
    [obj setYears:[components year]];
    [obj setMonths:[components month]];
    [obj setWeeks:[components weekOfMonth]];
    [obj setDays:[components day]];
    [obj setHours:[components hour]];
    [obj setMinutes:[components minute]];
    [obj setSeconds:[components second]];
    
    return obj;
}

- (NSString *)doomsdayString {
    return @"";
}
@end
