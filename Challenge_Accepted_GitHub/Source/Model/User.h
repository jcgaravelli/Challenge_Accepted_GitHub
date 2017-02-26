//
//  User.h
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 26/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *login;
@property (nonatomic, strong) NSString *avatarUrl;

- (User *)initWithDictionary:(NSDictionary *)dic;

@end
