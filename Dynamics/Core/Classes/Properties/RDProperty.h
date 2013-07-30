//
// Created by Alex Denisov on 16.07.13.
// Copyright (c) 2013 railsware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface RDProperty : NSObject

- (instancetype)initWithProperty:(objc_property_t)property;

- (NSString *)name;
- (NSString *)accessor;
- (NSString *)mutator;

- (IMP)accessorImplementation;
- (IMP)mutatorImplementation;

- (BOOL)isDynamic;
- (BOOL)isCopy;
- (BOOL)isNonatomic;
- (BOOL)isRetain;
- (BOOL)isAssign;

@end