//
//  ViewController.m
//  Go Game
//
//  Created by Hung Ga 123 on 5/24/16.
//  Copyright © 2016 HungVu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property GameViewController *gameVCL;
@end

@implementation ViewController
- (IBAction)clickedStartGame:(id)sender {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    _gameVCL = [sb instantiateViewControllerWithIdentifier:@"1"];
    [self.navigationController pushViewController:_gameVCL animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
