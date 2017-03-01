//
//  NotificationAlertView.m
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 28/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

#import "NotificationAlertAction.h"

@implementation NotificationAlertAction

//Notification Allert.
- (void)notification:(NSString *)message {
    UIAlertController * alert = [UIAlertController
                alertControllerWithTitle:message
                                 message:nil
                          preferredStyle:UIAlertControllerStyleAlert];



    UIAlertAction* okButton = [UIAlertAction
                    actionWithTitle:@"Ok"
                              style:UIAlertActionStyleDefault
                            handler:^(UIAlertAction * action) {
                                //Handle your yes please button action here
                            }];

    [alert addAction: okButton];
    
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    [vc presentViewController:alert animated:YES completion:nil];
}


@end
