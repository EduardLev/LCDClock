//
//  NSUserDefaults+UIColor.h
//  LCDClock
//
//  Created by Eduard Lev on 2/26/18.
//  Copyright © 2018 Eduard Levshteyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSUserDefaults (UIColor)

- (UIColor*)colorForKey:(NSString*)key;
- (void)setColor:(UIColor*)color forKey:(NSString*)key;

@end
