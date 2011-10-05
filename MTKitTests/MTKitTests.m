//
//  MTKitTests.m
//  MTKitTests
//
//  Created by Ryusuke SEKIYAMA on 11/10/06.
//  Copyright (c) 2011 Ryusuke SEKIYAMA All rights reserved.
//

#import "MTKitTests.h"


@implementation MTKitTests

- (TinyMT *)random
{
    return [[[TinyMT alloc] initWithSeed:1] autorelease];
}

- (TinyMT *)randomByArray
{
    NSArray *array = [NSArray arrayWithObject:[NSNumber numberWithUnsignedInteger:1]];
    return [[[TinyMT alloc] initWithArray:array] autorelease];
}

- (void)testNextState
{
    TinyMT *random = [self random];
    NSUInteger r1 = [random generate];
    NSUInteger r2 = [random generate];
    STAssertFalse(r1 == r2, @"internal state is not updated");
}

- (void)assertUIntegerEquals:(NSUInteger)actual expected:(NSUInteger)expected
{
    STAssertEquals(actual, expected, @"not equal");
}

- (void)assertFloatEquals:(CGFloat)actual expected:(CGFloat)expected
{
    STAssertNotNil(nil, @"not implemented");
}

@end
