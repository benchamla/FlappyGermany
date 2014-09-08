//
//  Game.m
//  FlappyGermany
//
//  Created by ben on 15/07/2014.
//  Copyright (c) 2014 Ben Chamla. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game




-(void)GameOver{
    
    if (ScoreNumber > HighScoreNumber) {
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    [BrazilMovement invalidate];
    [FlagMovement invalidate];
    
    Replay.hidden = NO;
    Exit.hidden = NO;
    BrazilTop.hidden = YES;
    BrazilBottom.hidden = YES;
    Flag.hidden = YES;
    
}


-(IBAction)StartGame:(id)sender{
    
    StartGame.hidden = YES;
    
    
    FlagMovement = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(FlagMoving) userInfo:nil repeats:YES];
    
    [self PlaceBrazils];
    
    BrazilMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BrazilMoving) userInfo:nil repeats:YES];
    
    
    BrazilTop.hidden = NO;
    BrazilBottom.hidden = NO;
    
}



-(void)BrazilMoving{
    
    BrazilTop.center = CGPointMake(BrazilTop.center.x -1, BrazilTop.center.y);
    BrazilBottom.center = CGPointMake(BrazilBottom.center.x-1, BrazilBottom.center.y);
    
    if (BrazilTop.center.x < -55) {
        [self PlaceBrazils];
    }
    
    if (BrazilTop.center.x == 12){
        [self Score];
    }
    
    if (CGRectIntersectsRect(Flag.frame, BrazilTop.frame)){
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Flag.frame, BrazilBottom.frame)){
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Flag.frame, Top.frame)){
        [self GameOver];
    }
    if (CGRectIntersectsRect(Flag.frame, Bottom.frame)){
        [self GameOver];
    }
}

-(void)Score{
    
    ScoreNumber = ScoreNumber +1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i",ScoreNumber];
    
}


-(void)PlaceBrazils{
    
    RandomTopBrazilPosition = arc4random() %350;
    RandomTopBrazilPosition = RandomTopBrazilPosition - 228;
    RandomBottomBrazilPosition = RandomTopBrazilPosition + 640;
    
    BrazilTop.center = CGPointMake(340, RandomTopBrazilPosition);
    BrazilBottom.center = CGPointMake(340, RandomBottomBrazilPosition);
    
    
}



-(void)FlagMoving;
{
    
    Flag.center = CGPointMake(Flag.center.x, Flag.center.y - FlagFlight);
    
    FlagFlight = FlagFlight - 5;
    
    if (FlagFlight < -15) {
        FlagFlight = -15;
    }
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    FlagFlight = 20;
    
}






- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}

- (void)viewDidLoad
{
    
    BrazilTop.hidden = YES;
    BrazilBottom.hidden = YES;
    
    Replay.hidden = YES;
    Exit.hidden =YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)Replay:(id)sender{
  
    

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
