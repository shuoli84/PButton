//
// Created by Li Shuo on 13-7-28.
// Copyright (c) 2013 Li Shuo. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "PPath.h"


@implementation PPath {

}

+(UIBezierPath *)navigationBarItemPathArrowWidth:(CGFloat)arrowWidth rect:(CGRect)frame radius:(CGFloat)radius{
    /**
    *
    *  | w | l1 |B
    *     D.----.----------------------    - -
    *     /| *
    *   A. |                               r h
    *   /  |    .                          _
    * C.---|    O                            -
    *   \
    *    \
    *     \
    *      -----------------------------
    *
    *
    * O is the center of arc. A is the Point the arc started, B the arc ended.
    *   a = arctan(h/w)
    *   l(BD) = tan(a/2) * r
    *   l(AD = l(BD)
    *   O: (l1 + w, r)
    *   l(CD) = sqrt(h^2 + w^2)
    *   l(AC) = l(CD)-l(AD)
    *   A: (l(AC) * cos(a), h - x * h / w)
    *   B: (w + l(BD) ,0)
    */

    CGFloat w = arrowWidth;
    CGFloat h = frame.size.height/2.0;
    CGFloat r = radius;
    CGFloat a = (CGFloat)atan(h / w);
    CGFloat angle_2 = a / 2.0;
    CGFloat lBD = (CGFloat)tan(angle_2) * r;
    CGFloat oX = lBD + w;
    CGFloat oY = r;
    CGFloat lCD = (CGFloat)sqrt(h * h + r * r);
    CGFloat lAD = lBD;
    CGFloat lAC = lCD - lAD;
    CGFloat aX = (CGFloat)(lAC * cos(a));
    CGFloat aY = h - aX * h / w;
    CGFloat bX = r + lBD;

    #define ROUND(x) (x) = roundf((x))
    ROUND(w);
    ROUND(h);
    ROUND(r);
    ROUND(lBD);
    ROUND(lCD);
    ROUND(lAD);
    ROUND(lAC);
    ROUND(oX);
    ROUND(oY);
    ROUND(aX);
    ROUND(aY);
    ROUND(bX);

    UIBezierPath *navPath = [[UIBezierPath alloc] init];
    CGFloat width = frame.size.width;
    [navPath moveToPoint:CGPointMake(0, h)];
    [navPath addLineToPoint:CGPointMake(aX, aY)];
    [navPath addArcWithCenter:CGPointMake(oX, oY) radius:radius startAngle:(CGFloat)(-M_PI + a) endAngle:(CGFloat)-M_PI_2 clockwise:YES];
    [navPath addLineToPoint:CGPointMake(width - radius, 0)];
    [navPath addArcWithCenter:CGPointMake(width - radius, radius) radius:radius startAngle:(CGFloat)-M_PI_2 endAngle:0 clockwise:YES];
    [navPath addLineToPoint:CGPointMake(width, h *2)];
    [navPath addArcWithCenter:CGPointMake(width -radius, h *2 - radius) radius:radius startAngle:0 endAngle:(CGFloat)M_PI_2 clockwise:YES];
    [navPath addLineToPoint:CGPointMake(bX, h *2)];
    [navPath addArcWithCenter:CGPointMake(oX, h * 2 - oY) radius:radius startAngle:(CGFloat) M_PI_2 endAngle:(CGFloat) M_PI_2 + a clockwise:YES];
    [navPath closePath];
    return navPath;
}
@end