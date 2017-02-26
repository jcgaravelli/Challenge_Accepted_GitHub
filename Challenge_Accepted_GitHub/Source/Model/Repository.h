//
//  Repository.h
//  Challenge_Accepted_GitHub
//
//  Created by Júlio César Garavelli on 26/02/17.
//  Copyright © 2017 Júlio César Garavelli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repository : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *descriptionRepo;
@property (nonatomic, strong) NSString *fork;
@property (nonatomic, strong) NSString *forks;
@property (nonatomic, strong) NSString *stargazers;
@property (nonatomic, strong) NSDictionary *updatedAt;

- (Repository *)initWithDictionary:(NSDictionary *)dic;


@end
