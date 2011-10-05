//
//  MTKitTests64.m
//  MTKit
//
//  Created by Ryusuke SEKIYAMA on 11/10/06.
//  Copyright (c) 2011 Ryusuke SEKIYAMA All rights reserved.
//

#import "MTKitTests64.h"

@implementation MTKitTests64
#if __LP64__

- (void)assertFloatEquals:(CGFloat)actual expected:(CGFloat)expected
{
    STAssertEqualsWithAccuracy(actual, expected, 0.000000000000001, @"not equal");
}

- (void)testGenerate
{
    TinyMT *random = [self random];
    NSUInteger expected = 15503804787016557143;
    [self assertUIntegerEquals:[random generate] expected:expected];
}

- (void)testGenerateFloat
{
    TinyMT *random = [self randomByArray];
    CGFloat expected = 0.125567123229521;
    [self assertFloatEquals:[random generateFloat] expected:expected];
}

#endif
@end
