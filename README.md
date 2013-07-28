PButton
=======

Button which able to have different visual effects for different state, inner shadow, outer shadow, gradient etc.

```
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
```
Will create a button like this:
