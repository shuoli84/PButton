//
// Created by Li Shuo on 13-7-27.
// Copyright (c) 2013 Li Shuo. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//
#import "PEffect.h"
#import "PButton.h"

void drawBorder(CGPathRef path, UIColor* color, CGFloat width, CGContextRef context){
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    [color setStroke];
    CGContextSetLineWidth(context, width);
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    CGContextRestoreGState(context);
}

@implementation PEffect
+(PEffect *)border:(CGPathRef) path color:(UIColor*) color width:(CGFloat)width{
    return [PEffect effectWithZIndex:100 block:^void(UIView *view, CGContextRef context){
        drawBorder(path, color, width, context);
    }];
}

+(PEffect *)gradientColor:(NSArray*)colors locations:(NSArray *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint{
    return [PEffect effectWithZIndex:1 block:^void (UIView *view, CGContextRef context){
        CGContextSaveGState(context);
        if([view respondsToSelector:@selector(buttonBorderPath)]){
            UIBezierPath *borderPath = [(id)view performSelector:@selector(buttonBorderPath)];
            if(borderPath != nil){
                [borderPath addClip];
            }
        }
        NSMutableArray *highlightedGradientColors = [NSMutableArray arrayWithCapacity:colors.count];
        for (UIColor* color in colors){
            [highlightedGradientColors addObject:(id)color.CGColor];
        }

        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)(highlightedGradientColors), locations == nil ? NULL : (__bridge CFArrayRef)locations);

        CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);

        CGColorSpaceRelease(colorSpace);
        CGGradientRelease(gradient);
        CGContextRestoreGState(context);
    }];
}

+(PEffect *)halfHighlight{
    return [PEffect effectWithZIndex:99 block:^void (UIView *view, CGContextRef context){
        [PEffect gradientColor:@[[[UIColor whiteColor] colorWithAlphaComponent:0.4], [[UIColor whiteColor] colorWithAlphaComponent:0.25]] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, view.bounds.size.height/2.0)].effectBlock(view, context);
    }];
}

+(PEffect *)innerShadow {
    return [PEffect effectWithZIndex:100 block:^(UIView *view, CGContextRef context){
        if ([view respondsToSelector:@selector(buttonBorderPath)]){
            UIBezierPath *path = [view performSelector:@selector(buttonBorderPath)];
            if (path == nil){
                path = [UIBezierPath bezierPathWithRect:view.bounds];
            }
            [PEffect innerShadowPath:path.CGPath color:[UIColor blackColor] radius:1.0 offset:CGSizeMake(0, 1.0)].effectBlock(view, context);
        }
    }];
}

+(PEffect *)outerShadow {
    return [PEffect effectWithZIndex:100 block:^(UIView *view, CGContextRef context){
        if ([view respondsToSelector:@selector(buttonBorderPath)]){
            UIBezierPath *path = [(id)view buttonBorderPath];
            if(path != nil){
                [PEffect outerShadowPath:path.CGPath color:[UIColor colorWithRed:191./255 green:192./255 blue:203./255 alpha:1] radius:1.0 offset:CGSizeMake(0, 1.0)].effectBlock(view, context);
            }
            else{
                CGPathRef boundsPath = CGPathCreateWithRect(view.bounds, NULL);
                [PEffect outerShadowPath:boundsPath color:[UIColor colorWithRed:191. / 255 green:192. / 255 blue:203. / 255 alpha:1] radius:1.0 offset:CGSizeMake(0, 1.0)].effectBlock(view, context);
                CGPathRelease(boundsPath);
            }
        }
    }];
}

+(PEffect *)innerGlow{
    return [PEffect effectWithZIndex:99 block:^(UIView *view, CGContextRef context){
        CGRect rect = CGRectInset( view.bounds, 2.5, 2.5);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:2.5];
        CGContextSaveGState(context);
        CGContextAddPath(context, path.CGPath);
        CGContextSetStrokeColorWithColor(context, [[UIColor whiteColor] colorWithAlphaComponent:0.3].CGColor);
        CGContextSetLineWidth(context, 1);
        CGContextStrokePath(context);
        CGContextRestoreGState(context);
    }];
}

+(PEffect *)innerShadowPath:(CGPathRef)path color:(UIColor*)color radius:(CGFloat)radius offset:(CGSize)offset{
    return [PEffect effectWithZIndex:100 block:^(UIView *view, CGContextRef context){
        CGContextSaveGState(context);
        CGContextAddPath(context, path);
        CGContextClip(context);

        CGRect bounds = CGPathGetBoundingBox(path);
        CGMutablePathRef path2 = CGPathCreateMutable();
        CGPathAddRect(path2, NULL, CGRectInset(bounds, -radius, -radius));
        CGPathAddPath(path2, NULL, path);
        CGPathCloseSubpath(path2);

        CGContextSetShadowWithColor(context, offset, radius, color.CGColor);
        [color setFill];
        CGContextAddPath(context, path2);
        CGContextEOFillPath(context);

        CGPathRelease(path2);
        CGContextRestoreGState(context);
    }];
}

+(PEffect *)outerShadowPath:(CGPathRef)path color:(UIColor*)color radius:(CGFloat)radius offset:(CGSize)offset{
    return [PEffect effectWithZIndex:100 block:^(UIView *view, CGContextRef context){
        CGContextSaveGState(context);
        CGRect bounds = CGPathGetBoundingBox(path);

        CGMutablePathRef path2 = CGPathCreateMutable();
        CGPathAddRect(path2, NULL, CGRectInset(bounds, -radius, -radius));
        CGPathAddPath(path2, NULL, path);
        CGPathCloseSubpath(path2);

        CGContextAddPath(context, path2);
        CGContextEOClip(context);

        CGContextSetShadowWithColor(context, offset, radius, color.CGColor);
        [color setFill];
        CGContextAddPath(context, path);
        CGContextFillPath(context);

        CGPathRelease(path2);
        CGContextRestoreGState(context);
    }];
}

+(PEffect *)effectWithZIndex:(int)zIndex block:(EffectBlock)block{
    PEffect *effect = [[PEffect alloc]init];
    effect.zIndex = zIndex;
    effect.effectBlock = block;
    return effect;
}
@end
