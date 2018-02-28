//
//  ViewController.h
//  LCDClock
//
//  Created by Eduard Lev on 2/23/18.
//  Copyright © 2018 Eduard Levshteyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"
#import "DigitView.h"
#import "NSUserDefaults+UIColor.h"

@interface ClockViewController : UIViewController

// Outlet for settings button
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;

// Outlet for color of clock letters

// This needs to be strong
@property (strong, nonatomic) UIColor *clockLettersColor;

// Properties for each digit view, along with the clock dots
@property (weak, nonatomic) IBOutlet DigitView *hourDigitOne;
@property (weak, nonatomic) IBOutlet DigitView *hourDigitTwo;
@property (weak, nonatomic) IBOutlet DigitView *minuteDigitOne;
@property (weak, nonatomic) IBOutlet DigitView *minuteDigitTwo;
@property (weak, nonatomic) IBOutlet DigitView *secondDigitOne;
@property (weak, nonatomic) IBOutlet DigitView *secondDigitTwo;
@property (weak, nonatomic) IBOutlet UILabel *upperDot;
@property (weak, nonatomic) IBOutlet UILabel *lowerDot;

@property (weak, nonatomic) IBOutlet UIImageView *background;

@property (weak, nonatomic) IBOutlet UILabel *AM;
@property (weak, nonatomic) IBOutlet UILabel *PM;

@property (nonatomic) BOOL twentyFourHour;
@property (nonatomic) NSString *timeZoneSelected;
@property (nonatomic) NSArray *timeZoneNames;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) NSDate *lastTime;
- (NSString*)lastTimeString;
- (void)updateLastTime:(NSTimer *)t;

@end

