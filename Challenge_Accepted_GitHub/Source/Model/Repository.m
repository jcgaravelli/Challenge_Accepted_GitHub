//
//  Repository.m
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 26/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

#import "Repository.h"

@implementation Repository

- (Repository *)initWithDictionary:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        _name = dic[@"name"];
        _fullName = dic[@"full_name"];
        _language = dic[@"language"];
        _descriptionRepo = dic[@"description"];
        _fork = dic[@"fork"];
        _forks = dic[@"forks"];
        _stargazers = dic[@"stargazers_count"];
        _updatedAt = dic[@"updated_at"];
    }
    return self;
}

@end
