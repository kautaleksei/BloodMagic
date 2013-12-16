//
// Created by Alex Denisov on 24.09.13.
// Copyright (c) 2013 railsware. All rights reserved.
//

#import <objc/runtime.h>
#import "BMDynamicPropertyInjector.h"
#import "BMPropertyCollector.h"
#import "BMProperty.h"

@implementation BMDynamicPropertyInjector

- (void)injectDynamicHandlersIntoClass:(Class)klass withProtocol:(Protocol *)protocol {
    return [self injectDynamicHandlersIntoClass:klass withProtocol:protocol excludingProtocol:nil];
}

- (void)injectDynamicHandlersIntoClass:(Class)klass withProtocol:(Protocol *)protocol excludingProtocol:(Protocol *)excludingProtocol
{
    BMPropertyCollector *collector = [BMPropertyCollector collector];
    NSArray *properties = [collector collectForClass:klass withProtocol:protocol excludingProtocol:excludingProtocol];
    for (BMProperty *property in properties) {
        class_addMethod(klass,
                        property.accessorSelector,
                        property.accessorImplementation,
                        NULL);
        class_addMethod(klass,
                        property.mutatorSelector,
                        property.mutatorImplementation,
                        NULL);
    }
}

@end