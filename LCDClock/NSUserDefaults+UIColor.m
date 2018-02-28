//
//  NSUserDefaults+UIColor.m
//  LCDClock
//
//  Created by Eduard Lev on 2/26/18.
//  Copyright © 2018 Eduard Levshteyn. All rights reserved.
//

#import "NSUserDefaults+UIColor.h"

@implementation NSUserDefaults (UIColor)

- (UIColor*)colorForKey:(NSString*)key {
  UIColor *color = [[UIColor alloc] init];
  NSData *colorData = [self dataForKey:key];
  color = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
  return color;
}

- (void)setColor:(UIColor*)color forKey:(NSString*)key {
  NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:color];
  [self setObject:colorData forKey:key];
}

@end
