//
//  PButton.m
//  PButton
//
//  Created by Li Shuo on 13-7-25.
//  Copyright (c) 2013年 Li Shuo. All rights reserved.
//

#import "PButton.h"
#import "PEffect.h"

@implementation PButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _normalEffects = [NSMutableArray array];
        _selectedEffects = [NSMutableArray array];
        _highlightEffects = [NSMutableArray array];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGRect bounds = self.bounds;

    CGContextRef context = UIGraphicsGetCurrentContext();

    if(_buttonBorderPath == nil){
        _buttonBorderPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height) cornerRadius:4.0];
    }

    CGContextSaveGState(context);{
        NSMutableArray *effects = [NSMutableArray array];
        [effects addObjectsFromArray:_normalEffects];
        if(self.isSelected){
            [effects addObjectsFromArray:_selectedEffects];
        }
        if(self.isHighlighted){
            [effects addObjectsFromArray:_highlightEffects];
        }

        [effects sortUsingComparator:^NSComparisonResult(PEffect *effect1, PEffect *effect2) {
            if(effect1.zIndex <= effect2.zIndex){
                return NSOrderedSame;
            }
            return NSOrderedDescending;
        }];

        [effects enumerateObjectsUsingBlock:^(PEffect *effect, NSUInteger idx, BOOL *stop) {
            effect.effectBlock(self, context);
        }];
    }
    CGContextRestoreGState(context);
}

-(void)setHighlighted:(BOOL)highlighted {
    [self setNeedsDisplay];
    [super setHighlighted:highlighted];
}
@end
