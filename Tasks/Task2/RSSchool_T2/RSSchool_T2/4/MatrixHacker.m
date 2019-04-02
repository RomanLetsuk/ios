#import "MatrixHacker.h"
// your code here
@interface MatrixHacker()
@property (nonatomic, copy) id<Character> (^block)(NSString *name);
@end

@implementation MatrixHacker

@synthesize block = _block;

- (id<Character> (^)(NSString *))block {
    return _block;
}

- (void)setBlock:(id<Character> (^)(NSString *))block {
    [_block release];
    _block = [block copy];
}

- (void)injectCode:(id<Character> (^)(NSString *name))theBlock {
    [self setBlock:theBlock];
}

- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names {
    NSMutableArray *array = [NSMutableArray new];
    
    for (NSString *name in names) {
        [array addObject: _block(name)];
    }
    
    NSArray *resultArray = [[NSArray alloc] initWithArray:array];
    return resultArray;
}

@end
