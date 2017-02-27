//
//  User.m
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 26/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

#import "User.h"

@implementation User

- (User *)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _login = dict[@"login"];
        _avatarUrl = dict[@"avatar_url"];
    }
    return self;
}


@end
