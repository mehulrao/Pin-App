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

char StatusText;
- (IBAction)PinButton:(UIButton *)sender {
    pid_t pid;
    int status;
    const char *argv2[] = {"/private/var/mobile/Documents/GandalfDocs/pin.sh"};
    posix_spawn(&pid, "/bin/bash", NULL, NULL, (char* const*)argv2, NULL);
    waitpid(pid, &status, WEXITED);
    NSString *StatusText = @"Pinned";
    [[NSUserDefaults standardUserDefaults] setObject:StatusText forKey:@"isPinned"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.StatusLabel.text=@"Pinned";
    NSLog(@"Pinned");
}


- (IBAction)UnPinButton:(UIButton *)sender {
    pid_t pid;
    int status;
    const char *argv[] = {"/private/var/mobile/Documents/GandalfDocs/unpin.sh"};
    posix_spawn(&pid, "/bin/bash", NULL, NULL, (char* const*)argv, NULL);
    waitpid(pid, &status, WEXITED);
    NSString *StatusText = @"UnPinned";
    [[NSUserDefaults standardUserDefaults] setObject:StatusText forKey:@"isPinned"];
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
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *savedValue = [[NSUserDefaults standardUserDefaults]
                            stringForKey:@"isPinned"];
    
    self.StatusLabel.text=savedValue;
    self.StatusLabel.textColor = [UIColor redColor];
    }



@end
