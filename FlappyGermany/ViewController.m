//
//  ViewController.m
//  FlappyGermany
//
//  Created by ben on 15/07/2014.
//  Copyright (c) 2014 Ben Chamla. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults]integerForKey:@"HihgScoreSaved"];
    HighScore.text = [NSString stringWithFormat:@"High Score: %li", (long)HighScoreNumber];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
