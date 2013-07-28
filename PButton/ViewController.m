//
//  ViewController.m
//  PButton
//
//  Created by Li Shuo on 13-7-25.
//  Copyright (c) 2013年 Li Shuo. All rights reserved.
//

#import "ViewController.h"
#import "PButton.h"
#import "PEffect.h"
#import "PPath.h"

@interface ViewController ()

@end

@implementation ViewController{
    PButton *_pbutton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:159/255.0 green:162/255.0 blue:177/255.0 alpha:1];
	// Do any additional setup after loading the view, typically from a nib.
    {
        _pbutton = [[PButton alloc]init];
        _pbutton.frame = CGRectMake(30, 30, 100, 30);
        [_pbutton.normalEffects addObjectsFromArray:@[
            [PEffect border:_pbutton.buttonBorderPath.CGPath color:[UIColor blackColor] width:2],
            [PEffect gradientColor:@[[UIColor orangeColor], [UIColor yellowColor]] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 30)],
            [PEffect innerShadow],
            [PEffect outerShadow],
        ]];

        [_pbutton.highlightEffects addObjectsFromArray:@[
            [PEffect gradientColor:@[[UIColor greenColor], [UIColor orangeColor]] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 30)],
        ]];
    }
    [self.view addSubview:_pbutton];
    {
        PButton *navigationButton = [[PButton alloc] init];
        navigationButton.frame = CGRectMake(30, 100, 100, 30);
        navigationButton.buttonBorderPath = [PPath navigationBarItemPathArrowWidth:10 rect:CGRectMake(0, 0, 100, 28) radius:5];
        [navigationButton setTitle:@"test" forState:UIControlStateNormal];

        UIColor *topColor = [UIColor colorWithRed:166/255.0 green:162/255.0 blue:173/255.0 alpha:1.00f];
        UIColor *bottomColor = [UIColor colorWithRed:88/255.0 green:95/255.0 blue:106/255.0 alpha:1.00f];
        UIColor *borderColor = [UIColor colorWithRed:59/255.0f green:61/255.0f blue:63/255.0f alpha:1.00f];
        [navigationButton.normalEffects addObjectsFromArray:@[
            [PEffect border:navigationButton.buttonBorderPath.CGPath color:borderColor width:2],
            [PEffect gradientColor:@[topColor, bottomColor] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 30)],
            [PEffect halfHighlight],
            [PEffect innerShadow],
            [PEffect outerShadow],
        ]];
        [navigationButton.highlightEffects addObjectsFromArray:@[
            [PEffect gradientColor:@[[UIColor redColor], [UIColor blueColor]] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 30)],
        ]];


        [self.view addSubview:navigationButton];
    }

    {
        PButton *navigationButton = [[PButton alloc] init];
        navigationButton.frame = CGRectMake(30, 150, 100, 30);
        navigationButton.buttonBorderPath = [PPath navigationBarItemPathArrowWidth:10 rect:CGRectMake(0, 0, 100, 28) radius:6];
        [navigationButton setTitle:@"test" forState:UIControlStateNormal];

        UIColor *topColor = [UIColor colorWithRed:166/255.0 green:162/255.0 blue:173/255.0 alpha:1.00f];
        UIColor *bottomColor = [UIColor colorWithRed:88/255.0 green:95/255.0 blue:106/255.0 alpha:1.00f];
        UIColor *borderColor = [UIColor colorWithRed:59/255.0f green:61/255.0f blue:63/255.0f alpha:1.00f];
        [navigationButton.normalEffects addObjectsFromArray:@[
            [PEffect border:navigationButton.buttonBorderPath.CGPath color:borderColor width:2],
            [PEffect gradientColor:@[topColor, bottomColor] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 30)],
            [PEffect innerShadow],
            [PEffect outerShadow],
        ]];
        [navigationButton.highlightEffects addObjectsFromArray:@[
            [PEffect gradientColor:@[[UIColor redColor], [UIColor blueColor]] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 30)],
        ]];


        [self.view addSubview:navigationButton];
    }


    {
        PButton *navigationButton = [[PButton alloc] init];
        navigationButton.frame = CGRectMake(30, 200, 100, 30);
        [navigationButton setTitle:@"test" forState:UIControlStateNormal];

        UIColor *topColor = [UIColor blueColor];
        UIColor *bottomColor = [UIColor blueColor];
        UIColor *borderColor = [UIColor colorWithRed:59/255.0f green:61/255.0f blue:63/255.0f alpha:1.00f];
        [navigationButton.normalEffects addObjectsFromArray:@[
            [PEffect border:navigationButton.buttonBorderPath.CGPath color:borderColor width:2],
            [PEffect gradientColor:@[topColor, bottomColor] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 30)],
            [PEffect innerGlow],
        ]];
        [navigationButton.highlightEffects addObjectsFromArray:@[
            [PEffect gradientColor:@[[UIColor redColor], [UIColor blueColor]] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 30)],
        ]];

        [self.view addSubview:navigationButton];
    }

    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(30, 300, 400, 100)];
    view1.backgroundColor = [UIColor colorWithWhite:40/255.0 alpha:1.0];
    [self.view addSubview:view1];
    {
        PButton *navigationButton = [[PButton alloc] init];
        navigationButton.frame = CGRectMake(30, 30, 100, 30);
        navigationButton.buttonBorderPath = [UIBezierPath bezierPathWithRoundedRect:CGRectInset(navigationButton.bounds, 1, 1) cornerRadius:4.0];
        [navigationButton setTitle:@"test" forState:UIControlStateNormal];

        UIColor *topColor = [UIColor colorWithWhite:104/255.0 alpha:1];
        UIColor *bottomColor = [UIColor colorWithWhite:79/255.0 alpha:1];
        //UIColor *borderColor = [UIColor colorWithRed:59/255.0f green:61/255.0f blue:63/255.0f alpha:1.00f];
        UIColor *borderColor = [UIColor colorWithWhite:60/255.0f alpha:1];
        [navigationButton.normalEffects addObjectsFromArray:@[
            [PEffect border:navigationButton.buttonBorderPath.CGPath color:borderColor width:2],
            [PEffect gradientColor:@[topColor, bottomColor] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 30)],
            [PEffect innerShadowPath:navigationButton.buttonBorderPath.CGPath color:[UIColor colorWithWhite:150/255.0 alpha:1.0] radius:1.0 offset:CGSizeMake(0, 1)],
            [PEffect outerShadowPath:navigationButton.buttonBorderPath.CGPath color:[UIColor colorWithWhite:20/255.0 alpha:1.0] radius:1.0 offset:CGSizeMake(0, 1)],

        ]];
        [navigationButton.highlightEffects addObjectsFromArray:@[
            [PEffect gradientColor:@[bottomColor, topColor] locations:nil startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 30)],
        ]];

        [view1 addSubview:navigationButton];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
