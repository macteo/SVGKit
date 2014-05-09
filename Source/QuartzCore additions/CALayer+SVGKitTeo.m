//
//  CALayer+SVGKitTeo.m
//  Pods
//
//  Created by Matteo Gavagnin on 09/05/14.
//
//

#import "CALayer+SVGKitTeo.h"
#import <objc/runtime.h>

static char SVGKitCALayerIdentifier;

@implementation CALayer (SVGKitTeo)

- (void)setIdentifier:(NSString *)identifier
{
    objc_setAssociatedObject(self, &SVGKitCALayerIdentifier, identifier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)identifier
{
    return objc_getAssociatedObject(self, &SVGKitCALayerIdentifier);
}

@end
