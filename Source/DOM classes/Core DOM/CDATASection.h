/*
 From SVG-DOM, via Core DOM:
 
 http://www.w3.org/TR/DOM-Level-2-Core/core.html#ID-667469212
 
 interface CDATASection : Text {
 };
 */
#import <Foundation/Foundation.h>

@class SVGText;
#import "SVGText.h"

@interface CDATASection : SVGText

- (id)initWithValue:(NSString*) v;

@end
