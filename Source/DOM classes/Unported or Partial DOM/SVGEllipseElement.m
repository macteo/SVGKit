//
//  SVGEllipseElement.m
//  SVGKit
//
//  Copyright Matt Rajca 2010-2011. All rights reserved.
//

#import "SVGEllipseElement.h"

#import "SVGElement_ForParser.h" // to resolve Xcode circular dependencies; in long term, parsing SHOULD NOT HAPPEN inside any class whose name starts "SVG" (because those are reserved classes for the SVG Spec)

#import "SVGHelperUtilities.h"

#import "SVGKCGFloatAdditions.h"

@interface SVGEllipseElement()
@property (nonatomic, readwrite) CGFloat cx;
@property (nonatomic, readwrite) CGFloat cy;
@property (nonatomic, readwrite) CGFloat rx;
@property (nonatomic, readwrite) CGFloat ry;
@property (nonatomic, readwrite) NSInteger beaconmajor;
@property (nonatomic, readwrite) NSInteger beaconminor;
@end

@implementation SVGEllipseElement

@synthesize cx = _cx;
@synthesize cy = _cy;
@synthesize rx = _rx;
@synthesize ry = _ry;
@synthesize beaconmajor = _beaconmajor;
@synthesize beaconminor = _beaconminor;

- (void)postProcessAttributesAddingErrorsTo:(SVGKParseResult *)parseResult {
	[super postProcessAttributesAddingErrorsTo:parseResult];
	
	if( [[self getAttribute:@"cx"] length] > 0 )
		self.cx = [[self getAttribute:@"cx"] SVGKCGFloatValue];
	
	if( [[self getAttribute:@"cy"] length] > 0 )
		self.cy = [[self getAttribute:@"cy"] SVGKCGFloatValue];
	
	if( [[self getAttribute:@"rx"] length] > 0 )
		self.rx = [[self getAttribute:@"rx"] SVGKCGFloatValue];
	
	if( [[self getAttribute:@"ry"] length] > 0 )
		self.ry = [[self getAttribute:@"ry"] SVGKCGFloatValue];
	
	if( [[self getAttribute:@"r"] length] > 0 ) { // circle
		self.ry = self.rx = [[self getAttribute:@"r"] SVGKCGFloatValue];
	}
    
    if( [[self getAttribute:@"beaconmajor"] length] > 0 )
    {
        NSString * theString = [NSString stringWithFormat:@"%.0f", [[self getAttribute:@"beaconmajor"] SVGKCGFloatValue]];
		self.beaconmajor = [theString integerValue];
    }
    
    if( [[self getAttribute:@"beaconminor"] length] > 0 ){
        NSString * theString = [NSString stringWithFormat:@"%.0f", [[self getAttribute:@"beaconminor"] SVGKCGFloatValue]];
        self.beaconminor = [theString integerValue];
    
    }
}

-(CALayer *)newLayer
{
	CGMutablePathRef path = CGPathCreateMutable();
	CGPathAddEllipseInRect(path, NULL, CGRectMake(_cx - _rx, _cy - _ry, _rx * 2, _ry * 2));
	
	CALayer* result = [SVGHelperUtilities newCALayerForPathBasedSVGElement:self withPath:path];
	CGPathRelease(path);
	return result;
}

@end
