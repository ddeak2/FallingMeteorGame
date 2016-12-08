//
//  ViewController.m
//  TimeToPlay
//
//  Created by Deak, David on 4/19/16.
//  Copyright © 2016 Deak, David. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

 int theScore;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeTimer];
}

- (IBAction)ResetGame:(id)sender {
    theScore = 0;
    [self updateScore];
    _theMeteor.center = CGPointMake(64, 64);
    [self.David setImage: [UIImage imageNamed:@"David_shrunk"]];
    _endLabel.hidden = true;
    _playAgainButton.hidden = true;
    _playAgainButton.enabled = false;
    [self gameLogic:theTimer];
    
    
}

- (void)updateScore {
    _score.text = [[NSString alloc] initWithFormat:@"%d",theScore];
}


- (void) initializeTimer {
    if(theTimer == nil)
    {
        theTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(gameLogic:)];
    }
    theTimer.frameInterval = 1;
    [theTimer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void) gameLogic:(CADisplayLink *) theTimer {
    if((!CGRectIntersectsRect(_theMeteor.frame, _David.frame)) && (theScore < 15)){
        if(_endLabel.hidden == true){
        if(_theMeteor.center.y >600){
            int num = arc4random() % 3;
            if(num == 0){
                _theMeteor.center = CGPointMake(64, 64);
            }
            else if(num == 1){
                _theMeteor.center = CGPointMake(192, 64);
            }
            else if(num == 2){
                _theMeteor.center = CGPointMake(320, 64);
            }
            theScore = theScore + 1;
            [self updateScore];
            }
            _theMeteor.center = CGPointMake(_theMeteor.center.x, _theMeteor.center.y+11);    }}
    
    else if(theScore == 15){
        
        _theMeteor.center = CGPointMake(_theMeteor.center.x, _theMeteor.center.y);
        _endLabel.text = @"YOU WIN!";
        _endLabel.hidden = false;
        _playAgainButton.hidden = false;
        _playAgainButton.enabled = true;
        
        
    }
    else{
        _theMeteor.center = CGPointMake(64, 64);
        _endLabel.text = @"YOU LOSE!";
        _endLabel.hidden = false;
        _playAgainButton.hidden = false;
        _playAgainButton.enabled = true;
       [self.David setImage: [UIImage imageNamed:@"David_shrunk_killed"]];
    }
    
}

- (void) touchesBegan:(NSSet *) touches withEvent:(UIEvent *) event {
    UITouch *touch = [touches anyObject];
    _firstTouch = [touch locationInView:self.view];
    _lastTouch = [touch locationInView:self.view];
    
    _David.center = CGPointMake(_firstTouch.x, _David.center.y);
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    _firstTouch = [touch locationInView:self.view];
    _lastTouch = [touch locationInView:self.view];
    
    _David.center = CGPointMake(_firstTouch.x, _David.center.y);}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    _firstTouch = [touch locationInView:self.view];
    _lastTouch = [touch locationInView:self.view];
   
    _David.center = CGPointMake(_firstTouch.x, _David.center.y);}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
