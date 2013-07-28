//
//  PButton.h
//  PButton
//
//  Created by Li Shuo on 13-7-25.
//  Copyright (c) 2013年 Li Shuo. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface PButton : UIButton
@property (nonatomic, strong) UIBezierPath *buttonBorderPath;
@property (nonatomic, strong) NSMutableArray *normalEffects;
@property (nonatomic, strong) NSMutableArray *highlightEffects;
@property (nonatomic, strong) NSMutableArray *selectedEffects;
@end
