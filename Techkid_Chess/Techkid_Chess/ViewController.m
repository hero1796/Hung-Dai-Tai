//
//  ViewController.m
//  Techkid_Chess
//
//  Created by Ta Hoang Minh on 5/28/16.
//  Copyright © 2016 TechKid. All rights reserved.
//

#import "ViewController.h"
#import "ChatRoomViewController.h"
@interface ViewController ()

@property ChatRoomViewController *socketRoom;
@property int messageIdx;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.socketRoom = [[ChatRoomViewController alloc] initWithUserName:_txtUsername.text room:@"co_vay_01"];
    [self.socketRoom startSocket];
    
    [self sendMessage:@"Ahihi"];
    self.messageIdx = 0;
    [self customNavigation];
}

- (void) sendMessage:(NSString *)message
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.socketRoom.roomReady) {
            [self.socketRoom.socket emit:@"message" withItems:@[message, self.socketRoom.roomName, self.socketRoom.userName]];
        }
        [self sendMessage:[NSString stringWithFormat:@"message %d", self.messageIdx++]];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void) chooseGame {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _chooseVC = [storyboard instantiateViewControllerWithIdentifier:@"ChooseGameID"];
    
    [self.navigationController pushViewController:_chooseVC animated:YES];
}

- (void) customNavigation {
    //---------------------------------------------------------
    //change back button icon
    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"back"];
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"back"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    //---------------------------------------------------------
    //set color for navigation bar
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:3.0f/255.0f green:155.0f/255.0f blue:229.0f/255.0f alpha:1.0f];
    
    //---------------------------------------------------------
    //set title for back button
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //---------------------------------------------------------
    //set first title
    self.navigationItem.title = @"Total Stickers";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"ChalkboardSE-Bold" size:23], NSFontAttributeName, nil]];
    
    //---------------------------------------------------------
    //change style of StatusBar
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleLightContent;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)btnLoginTouchUpInside:(id)sender {
    [self chooseGame];
}

@end
