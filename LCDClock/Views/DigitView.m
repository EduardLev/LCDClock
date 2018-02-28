//
//  DigitVIew.m
//  LCDClock
//
//  Created by Eduard Lev on 2/23/18.
//  Copyright © 2018 Eduard Levshteyn. All rights reserved.
//

#import "DigitView.h"
#import <CoreGraphics/CoreGraphics.h>
#import "ClockViewController.h"


@interface DigitView()

@property (nonatomic) float length; // length of a digit piece
@property (nonatomic) float width; // width of a digit piece
@property (nonatomic) float cap; // length of a digit piece cap
@property (nonatomic) float frameWidth; // width of the view frame
@property (nonatomic) float frameHeight; // height of the view frame

@end

@implementation DigitView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
  [self createDigit];
}

// SetNeedsLayoutHere
- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
     [self setNeedsDisplay];
}

- (void)updateDigitPaths {
  // first reduce visibility of all paths
  for (int i = 0; i < 7; i++) {
    [self.paths[i] fillWithBlendMode:kCGBlendModeNormal alpha:0.1];
  }
  
  // then use logic to determine which paths to "turn on" to display a certain digit
  switch (self.number) {
    case 0:
      [self.paths[0] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[2] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[3] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[4] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[5] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[6] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      break;
    case 1:
      [self.paths[3] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[4] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      break;
    case 2:
      [self.paths[0] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[1] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[2] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[3] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[6] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      break;
    case 3:
      [self.paths[0] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[1] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[2] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[3] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[4] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      break;
    case 4:
      [self.paths[1] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[3] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[4] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[5] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      break;
    case 5:
      [self.paths[0] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[1] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[2] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[4] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[5] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      break;
    case 6:
      [self.paths[0] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[1] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[2] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[4] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[5] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[6] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      break;
    case 7:
      [self.paths[0] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[3] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[4] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      break;
    case 8:
      [self.paths[0] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[1] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[2] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[3] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[4] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[5] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[6] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      break;
    case 9:
      [self.paths[0] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[1] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[2] fillWithBlendMode:kCGBlendModeHue alpha:1.0];
      [self.paths[3] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[4] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      [self.paths[5] fillWithBlendMode:kCGBlendModeNormal alpha:1.0];
      break;
  }
  
  //[self setNeedsDisplay];
  //[self.paths[0] fillWithBlendMode:kCGBlendModeNormal alpha:0.3];
}

- (void)setNumber:(int)number {
  _number = number;
  [self setNeedsDisplay];
}

- (void)createDigit {
  // initialize mutable array
  self.paths = [[NSMutableArray alloc] init];
  
  // initialize height and width of the frame
  self.frameWidth = self.frame.size.width; // width of this digit view
  self.frameHeight = self.frame.size.height; // height of this digit view
  
  // initialize array of Bezier Paths
   for (int i = 0; i < 7; i++) {
    self.paths[i] = [[UIBezierPath alloc] init];
  }
  
  // create all the pieces of the digit
  [self createDigitPieces];
  [self.fillColor setFill];
  
  [self updateDigitPaths];
}

/**
 * Sends a call to other functions to draw the 7 pieces of a digit
 *
 * Initializes the frame boundaries for the drawing, as well as defines
 * the desired length, cap and height properties for horizontal and vertical
 * digit pieces.
 *
 * To change the look of the digit, adjust the width and height multipliers.
 * Be sure to confirm that the pieces are symmetrical and look correctly proportioned
 * in this view.
 *
 */
- (void)createDigitPieces {
  float startX, startY; // starting x and y points for pieces

  // set the constants for the horizontal pieces
  [self setHorizontalConstants];
  
  // create three horizontal pieces with indexes 0, 1, 2.
  for (int i = 0; i < 3; i++) {
    startX = self.frameWidth*3/10; // same x value for all x pieces
    startY = self.frameHeight*1/34 + i*(self.frameHeight*14/34); // y value + 14/34 of the screen
    [self createOneHorizontalDigitPieceWithX:startX
                                        AndY:startY
                                       Index:i];
  }
  
  // sets the constants for the vertical pieces
  [self setVerticalConstants];

  // creates the two right-side vertical pieces
  for (int i = 3; i < 5; i++) {
    startX = self.frameWidth*3/4;
    startY = self.frameHeight*6/34 +(i-3)*(self.frameHeight*14/34);
    [self createOneVerticalDigitPieceWithX:startX AndY:startY Index:i];
  }
  
  // creates the two left-side vertical pieces
  for (int i = 5; i < 7; i++) {
    startX = self.frameWidth*1/20;
    startY = self.frameHeight*6/34 +(i-5)*(self.frameHeight*14/34);
    [self createOneVerticalDigitPieceWithX:startX AndY:startY Index:i];
  }
}

/**
 * This function draws a horizontal digit piece given a starting X and Y position in the
 * frame of the subview, along with length, height and cap parameters. Each piece should be
 * indexed with a unique number so that it can be modified in other functions in order to display
 * the correct clock functionality.
 *
 * @param x Starting X value of horizontal piece - must be top left
 * @param y Starting Y value of horizontal piece - must be top left
 * @param i Index of Bezier Path. Each call to this function should be on a unique index.
 *
 */
- (void)createOneHorizontalDigitPieceWithX:(float)x
                                      AndY:(float)y
                                     Index:(int)i
{
  // x and y are the starting points on the top left of the horizontal piece
  [self.paths[i] moveToPoint:CGPointMake(x, y)];
  [self.paths[i] addLineToPoint:CGPointMake(x + self.length, y)];
  [self.paths[i] addLineToPoint:CGPointMake(x + self.length + self.cap, y + self.width/2)];
  [self.paths[i] addLineToPoint:CGPointMake(x + self.length, y + self.width)];
  [self.paths[i] addLineToPoint:CGPointMake(x, y + self.width)];
  [self.paths[i] addLineToPoint:CGPointMake(x - self.cap, y + self.width/2)];
  [self.paths[i] closePath];
}

/**
 * This function draws a vertical digit piece given a starting X and Y position in the
 * frame of the subview, along with length, height and cap parameters. Each piece should be
 * indexed with a unique number so that it can be modified in other functions in order to display
 * the correct clock functionality.
 *
 * @param x Starting X value of horizontal piece - must be top left
 * @param y Starting Y value of horizontal piece - must be top left
 * @param i Index of Bezier Path. Each call to this function should be on a unique index.
 *
 */
- (void)createOneVerticalDigitPieceWithX:(float)x
                                    AndY:(float)y
                                    Index:(int)i
{
  // x and y are the starting points on the top left of the vertical piece
  [self.paths[i] moveToPoint:CGPointMake(x, y)];
  [self.paths[i] addLineToPoint:CGPointMake(x, y + self.length)];
  [self.paths[i] addLineToPoint:CGPointMake(x + self.width/2, y + self.length + self.cap)];
  [self.paths[i] addLineToPoint:CGPointMake(x + self.width, y + self.length)];
  [self.paths[i] addLineToPoint:CGPointMake(x + self.width, y)];
  [self.paths[i] addLineToPoint:CGPointMake(x + self.width/2, y - self.cap)];
  [self.paths[i] closePath];
}

/**
 * This function sets the length, cap and width dimensions for a horizontal digit piece
 *
 * They are all proportional to the frame boundaries. To adjust the look of the horizontal pieces,
 * adjust the fractions in the function. Make sure to maintain symmetry.
 */
- (void)setHorizontalConstants {
  self.length = self.frameWidth*2/5; // length of the horizontal pieces
  self.cap = self.frameWidth*1/20; // length of the horizontal caps
  self.width = self.frameHeight*4/34; // width of the horizontal pieces
}

/**
 * This function sets the length, cap and width dimensions for a horizontal digit piece
 *
 * They are all proportional to the frame boundaries. To adjust the look of the horizontal pieces,
 * adjust the fractions in the function. Make sure to maintain symmetry.
 */
- (void)setVerticalConstants {
  self.length = self.frameHeight*8/34; // length of the vertical pieces
  self.cap = self.frameHeight*2/34; // length of the vertical caps
  self.width = self.frameWidth*2/10; // width of the vertical pieces
}

@end
