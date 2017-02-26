//
//  User.m
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 26/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

#import "User.h"

@implementation User

- (User *)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        _login = dic[@"login"];
        _avatarUrl = dic[@"avatar_url"];
    }
    return self;
}


@end
