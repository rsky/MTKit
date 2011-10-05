//
//  MTKitTests32.m
//  MTKit
//
//  Created by Ryusuke SEKIYAMA on 11/10/06.
//  Copyright (c) 2011 Ryusuke SEKIYAMA All rights reserved.
//

#import "MTKitTests32.h"

@implementation MTKitTests32
#if !__LP64__

- (void)assertFloatEquals:(CGFloat)actual expected:(CGFloat)expected
{
    STAssertEqualsWithAccuracy(actual, expected, 0.0000001, @"not equal");
}

- (void)testGenerate
{
    TinyMT *random = [self random];
    NSUInteger expected = 2545341989;
    [self assertUIntegerEquals:[random generate] expected:expected];
}

- (void)testGenerateFloat
{
    TinyMT *random = [self randomByArray];
    CGFloat expected = 0.0132459;
    [self assertFloatEquals:[random generateFloat] expected:expected];

}

#endif
@end
