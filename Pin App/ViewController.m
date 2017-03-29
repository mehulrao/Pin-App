//
//  ViewController.m
//  Pin App
//
//  Created by Mehul Rao on 3/24/17.
//  Copyright © 2017 Mehul Rao. All rights reserved.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>
#import <spawn.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <fcntl.h>

extern char StatusText;

@interface ViewController ()



@end

@implementation ViewController

char passwd;
char StatusText;
char textField;

- (IBAction)PinButton:(UIButton *)sender {
    passwd = _password;
    system("echo meghana | sudo -S" && "echo io.github.ethanrdoesmc.gandalf102 install | dpkg --set-selections");
    NSLog(@"%@", _password);
    NSString *StatusText = @"Pinned";
    [[NSUserDefaults standardUserDefaults] setObject:StatusText forKey:@"isPinned"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSString *textField = self.password;
    [[NSUserDefaults standardUserDefaults] setObject:textField forKey:@"textView"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.StatusLabel.text=@"Pinned";
    NSLog(@"Pinned");
}


- (IBAction)UnPinButton:(UIButton *)sender {
    passwd =_password ;
    system("echo meghana | sudo -S" && "echo io.github.ethanrdoesmc.gandalf102 install | dpkg --set-selections");
    NSLog(@"%c", passwd);
    NSString *StatusText = @"UnPinned";
    [[NSUserDefaults standardUserDefaults] setObject:StatusText forKey:@"isPinned"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSString *textField = self.password;
    [[NSUserDefaults standardUserDefaults] setObject:textField forKey:@"textView"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.StatusLabel.text=@"Unpinned";
    NSLog(@"Unpinned");
}


- (IBAction)RespringButton:(UIButton *)sender {
    CFNotificationCenterPostNotification (CFNotificationCenterGetDarwinNotifyCenter(),
                                          CFSTR("respringDevice"),
                                          NULL,
                                          NULL,
                                          false);
    
    NSLog(@"Gonna Respring");
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"isPinned"];
    NSString *textField = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"textView"];
    
    
    self.StatusLabel.text=savedValue;
    self.StatusLabel.textColor = [UIColor redColor];
    
    self.password.text=textField;
    }




@end
