//
//  SettingsViewController.h
//  LCDClock
//
//  Created by Eduard Lev on 2/23/18.
//  Copyright © 2018 Eduard Levshteyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+colorWithHexString.h"
#import "ClockViewController.h"
#import "NSUserDefaults+UIColor.h"

@interface SettingsViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

// Green, Red, Blue and Forest Green clock color buttons
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *colorButtons;

// The view that the clock color buttons are in
@property (weak, nonatomic) IBOutlet UIView *colorView;

// Toggle switch for 12 or 24 hour setting
@property (weak, nonatomic) IBOutlet UISwitch *twentyFourHourSwitch;

// Time zone picker
@property (weak, nonatomic) IBOutlet UIPickerView *timeZonePicker;

// Color selected for clock digits
@property (nonatomic) UIColor *clockLettersColor;


@end
