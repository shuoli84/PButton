//
// Created by Li Shuo on 13-7-27.
// Copyright (c) 2013 Li Shuo. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>
typedef void (^EffectBlock)(UIView *view, CGContextRef context);

@interface PEffect : NSObject
+(PEffect *)border:(CGPathRef) path color:(UIColor*) color width:(CGFloat)width;
+(PEffect *)gradientColor:(NSArray*)colors locations:(NSArray *)locations startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
+(PEffect *)innerShadowPath:(CGPathRef)path color:(UIColor*)color radius:(CGFloat)radius offset:(CGSize)offset;
+(PEffect *)outerShadowPath:(CGPathRef)path color:(UIColor*)color radius:(CGFloat)radius offset:(CGSize)offset;

+(PEffect *)halfHighlight;
+(PEffect *)outerShadow;
+(PEffect *)innerShadow;
+(PEffect *)innerGlow;

+(PEffect *)effectWithZIndex:(int)zIndex block:(EffectBlock)block;

@property (nonatomic, assign) int zIndex;
@property (nonatomic, copy) EffectBlock effectBlock;
@end