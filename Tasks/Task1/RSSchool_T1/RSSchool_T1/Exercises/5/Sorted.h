#import <Foundation/Foundation.h>

@interface ResultObject : NSObject
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, assign) BOOL status;
@end

@interface SwappedObject : NSObject
@property (nonatomic, assign) BOOL wasSwapped;
@property (nonatomic, assign) NSUInteger firstIndex;
@property (nonatomic, assign) NSUInteger secondIndex;
@property (nonatomic, retain) NSArray *swappedArray;
@end

@interface ReversedObject : NSObject
@property (nonatomic, assign) BOOL wasReversed;
@property (nonatomic, assign) NSUInteger firstIndex;
@property (nonatomic, assign) NSUInteger secondIndex;
@property (nonatomic, retain) NSArray *reversedArray;
@end

@interface Sorted : NSObject
- (ResultObject*)sorted:(NSString*)string;
@end
