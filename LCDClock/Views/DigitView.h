//
//  DigitVIew.h
//  LCDClock
//
//  Created by Eduard Lev on 2/23/18.
//  Copyright © 2018 Eduard Levshteyn. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface DigitView : UIView

@property (nonatomic) NSMutableArray<UIBezierPath*> *paths;
@property (nonatomic) UIColor *fillColor;
@property (nonatomic) int number;

- (void)updateDigitPaths;

@end
