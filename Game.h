//
//  Game.h
//  FlappyGermany
//
//  Created by ben on 15/07/2014.
//  Copyright (c) 2014 Ben Chamla. All rights reserved.
//

#import <UIKit/UIKit.h>

int FlagFlight;
int RandomTopBrazilPosition;
int RandomBottomBrazilPosition;
int ScoreNumber;
NSInteger HighScoreNumber;

@interface Game : UIViewController
{
    IBOutlet UIImageView *Flag;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *BrazilTop;
    IBOutlet UIImageView *BrazilBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UIButton *Replay;
    
    NSTimer *FlagMovement;
    NSTimer *BrazilMovement;
    
}

-(IBAction)StartGame:(id)sender;
-(void)FlagMoving;
-(void)BrazilMoving;
-(void)PlaceBrazils;
-(void)Score;
-(void)GameOver;
-(IBAction)Replay:(id)sender;



@end
