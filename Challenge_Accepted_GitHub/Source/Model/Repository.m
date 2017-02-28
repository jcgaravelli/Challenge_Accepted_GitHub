//
//  Repository.m
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 26/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

#import "Repository.h"
#import "Challenge_Accepted_GitHub-Swift.h"

@implementation Repository

- (Repository *)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _name = dict[@"name"];
        _fullName = dict[@"full_name"];
        _language = dict[@"language"];
        _descriptionRepo = dict[@"description"];
        _fork = dict[@"fork"];
        _forks = dict[@"forks"];
        _stargazers = dict[@"stargazers_count"];
        _updatedAt = dict[@"updated_at"];
    }
    return self;
}

@end
