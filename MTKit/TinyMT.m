//
//  TinyMT.m
//  MTKit
//
//  Created by Ryusuke SEKIYAMA on 11/10/06.
//  Copyright (c) 2011 Ryusuke SEKIYAMA All rights reserved.
//

#import "TinyMT.h"


#if __LP64__
typedef uint64_t tinymt_key_t;
#define tinymt_init tinymt64_init
#define tinymt_init_by_array    tinymt64_init_by_array
#define tinymt_next_state       tinymt64_next_state
#define tinymt_generate_uint    tinymt64_generate_uint64
#define tinymt_generate_float   tinymt64_generate_double
#define tinymt_generate_float_ex(_type_, _rnd_) tinymt64_generate_double##_type_((_rnd_))
#else
typedef uint32_t tinymt_key_t;
#define tinymt_init tinymt32_init
#define tinymt_init_by_array    tinymt32_init_by_array
#define tinymt_next_state       tinymt32_next_state
#define tinymt_generate_uint    tinymt32_generate_uint32
#define tinymt_generate_float   tinymt32_generate_float
#define tinymt_generate_float_ex(_type_, _rnd_) tinymt32_generate_float##_type_((_rnd_))
#endif


@implementation TinyMT

- (id)initWithSeed:(NSUInteger)seed {
    return [self initWithSeed:seed
                         mat1:TINYMT_DEFAULT_MAT1
                         mat2:TINYMT_DEFAULT_MAT2
                         tmat:TINYMT_DEFAULT_TMAT];
}

- (id)initWithSeed:(NSUInteger)seed mat1:(uint32_t)mat1 mat2:(uint32_t)mat2 tmat:(NSUInteger)tmat {
    self = [super init];
    if (self) {
        _rnd.mat1 = mat1;
        _rnd.mat2 = mat2;
        _rnd.tmat = tmat;
        tinymt_init(&_rnd, seed);
    }
    return self;
}

- (id)initWithArray:(NSArray *)array {
    return [self initWithArray:array
                          mat1:TINYMT_DEFAULT_MAT1
                          mat2:TINYMT_DEFAULT_MAT2
                          tmat:TINYMT_DEFAULT_TMAT];
}

- (id)initWithArray:(NSArray *)array mat1:(uint32_t)mat1 mat2:(uint32_t)mat2 tmat:(NSUInteger)tmat; {
    self = [super init];
    if (self) {
        int key_length = (int)[array count];
        tinymt_key_t init_key[key_length];
        for (int i = 0; i < key_length; i++) {
            init_key[i] = [[array objectAtIndex:i] unsignedIntegerValue];
        }
        _rnd.mat1 = mat1;
        _rnd.mat2 = mat2;
        _rnd.tmat = tmat;
        tinymt_init_by_array(&_rnd, init_key, key_length);
    }
    return self;
}

- (void)nextState
{
    tinymt_next_state(&_rnd);
}

- (NSUInteger)generate
{
    return tinymt_generate_uint(&_rnd);
}

- (CGFloat)generateFloat
{
    return tinymt_generate_float(&_rnd);
}

- (CGFloat)generateFloat01
{
    return tinymt_generate_float_ex(01, &_rnd);
}

- (CGFloat)generateFloat12
{
    return tinymt_generate_float_ex(12, &_rnd);
}

- (CGFloat)generateFloatOC
{
    return tinymt_generate_float_ex(OC, &_rnd);
}

- (CGFloat)generateFloatOO
{
    return tinymt_generate_float_ex(OO, &_rnd);
}

@end
