//
//  MTKitTests.h
//  MTKitTests
//
//  Created by Ryusuke SEKIYAMA on 11/10/06.
//  Copyright (c) 2011 Ryusuke SEKIYAMA All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "TinyMT.h"

@interface MTKitTests : SenTestCase {
}

- (TinyMT *)random;
- (TinyMT *)randomByArray;

- (void)assertUIntegerEquals:(NSUInteger)actual expected:(NSUInteger)expected;
- (void)assertFloatEquals:(CGFloat)actual expected:(CGFloat)expected;

@end
