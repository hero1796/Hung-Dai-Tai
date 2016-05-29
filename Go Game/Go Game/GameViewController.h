//
//  GameViewController.h
//  Go Game
//
//  Created by Hung Ga 123 on 5/24/16.
//  Copyright © 2016 HungVu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"
@interface GameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *blackCapturedStoneCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *whiteCapturedStoneCountLabel;

@end
