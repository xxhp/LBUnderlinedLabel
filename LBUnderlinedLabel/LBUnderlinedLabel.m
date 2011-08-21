//
//  LBUnderlinedLabel.m
//  LBUnderlinedLabel
//
//  Created by Laurin Brandner on 21.08.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LBUnderlinedLabel.h"

@implementation LBUnderlinedLabel

@synthesize underlineColor, underlineWidth, underlinePosition;

#pragma mark Accessors

-(BOOL)underlined {
    return underlined;
}

-(void)setUnderlined:(BOOL)value {
    if (underlined != value) {
        underlined = value;
        [self setNeedsDisplay];
    }
}

-(void)setTextColor:(UIColor *)value {
    [super setTextColor:value];
    self.underlineColor = value;
}

#pragma mark -
#pragma mark Initialization

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.underlineColor = [UIColor blackColor];
        self.underlineWidth = 1.0;
        self.underlinePosition = -3.0;
        self.underlined = YES;
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.underlineColor = [UIColor blackColor];
        self.underlineWidth = 1.0;
        self.underlinePosition = -3.0;
        self.underlined = YES;
    }
    return self;
}

-(id)init {
    self = [super init];
    if (self) {
        self.underlineColor = [UIColor blackColor];
        self.underlineWidth = 1.0;
        self.underlinePosition = -3.0;
        self.underlined = YES;
    }
    return self;
}

-(void)dealloc {
    self.underlineColor = nil;
    self.underlineWidth = 0;
    self.underlinePosition = 0;
    self.underlined = NO;
    
    [super dealloc];
}

#pragma mark -
#pragma mark Drawing

-(void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, self.underlineWidth);
    
    CGFloat baseline = CGContextGetTextPosition(ctx).y;
    CGPoint left = CGPointMake(CGRectGetMinX(self.bounds), baseline-underlinePosition);
    CGPoint right = CGPointMake(CGContextGetTextPosition(ctx).x, baseline-underlinePosition);
    
    CGMutablePathRef underline = CGPathCreateMutable();
    CGPathMoveToPoint(underline, NULL, left.x, left.y);
    CGPathAddLineToPoint(underline, NULL, right.x, right.y);
    
    [self.underlineColor set];
    CGContextAddPath(ctx, underline);
    CGContextDrawPath(ctx, kCGPathStroke);
    
    if (self.shadowColor && self.underlined) {
        CGMutablePathRef underline = CGPathCreateMutable();
        CGPathMoveToPoint(underline, NULL, left.x+self.shadowOffset.width, left.y+self.shadowOffset.height);
        CGPathAddLineToPoint(underline, NULL, right.x+self.shadowOffset.width, right.y+self.shadowOffset.height);
        
        [self.shadowColor set];
        CGContextAddPath(ctx, underline);
        CGContextDrawPath(ctx, kCGPathStroke);
    }
    
    CGPathRelease(underline);
}

#pragma mark -

@end
