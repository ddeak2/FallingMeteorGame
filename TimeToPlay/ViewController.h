//
//  ViewController.h
//  TimeToPlay
//
//  Created by Deak, David on 4/19/16.
//  Copyright © 2016 Deak, David. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCore/CADisplayLink.h"

@interface ViewController : UIViewController {
    CADisplayLink * theTimer;
}

@property (weak, nonatomic) IBOutlet UIImageView *theMeteor;
@property (weak, nonatomic) IBOutlet UIImageView *theGround;
@property (weak, nonatomic) IBOutlet UIImageView *David;
@property (weak, nonatomic) IBOutlet UIButton *playAgainButton;
@property (weak, nonatomic) IBOutlet UILabel *endLabel;

@property (weak, nonatomic) IBOutlet UILabel * score;
@property (nonatomic) CGPoint firstTouch;
@property (nonatomic) CGPoint lastTouch;

- (IBAction)ResetGame:(id)sender;

@end

