//
//  TinyMT.h
//  MTKit
//
//  Created by Ryusuke SEKIYAMA on 11/10/06.
//  Copyright (c) 2011 Ryusuke SEKIYAMA All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#if __LP64__
#include "tinymt64.h"
typedef tinymt64_t tinymt_t;
#define TINYMT_DEFAULT_MAT1 0xfa051f40
#define TINYMT_DEFAULT_MAT2 0xffd0fff4
#define TINYMT_DEFAULT_TMAT 0x58d02ffeffbfffbc
#else
#include "tinymt32.h"
typedef tinymt32_t tinymt_t;
#define TINYMT_DEFAULT_MAT1 0x8f7011ee
#define TINYMT_DEFAULT_MAT2 0xfc78ff1f
#define TINYMT_DEFAULT_TMAT 0x3793fdff
#endif

@interface TinyMT : NSObject {
@private
    tinymt_t _rnd;
}

- (id)initWithSeed:(NSUInteger)seed;
- (id)initWithSeed:(NSUInteger)seed mat1:(uint32_t)mat1 mat2:(uint32_t)mat2 tmat:(NSUInteger)tmat;

- (id)initWithArray:(NSArray *)array;
- (id)initWithArray:(NSArray *)array mat1:(uint32_t)mat1 mat2:(uint32_t)mat2 tmat:(NSUInteger)tmat;

- (void)nextState;

- (NSUInteger)generate;
- (CGFloat)generateFloat;
- (CGFloat)generateFloat01;
- (CGFloat)generateFloat12;
- (CGFloat)generateFloatOC;
- (CGFloat)generateFloatOO;

@end
