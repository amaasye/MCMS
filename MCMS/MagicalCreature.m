//
//  MagicalCreature.m
//  MCMS
//
//  Created by Syed Amaanullah on 1/13/15.
//  Copyright (c) 2015 Syed Amaanullah. All rights reserved.
//

#import "MagicalCreature.h"


@implementation MagicalCreature

-(instancetype)initWithCreature:(NSString *)name {
    self = [super init];
    self.name = name;
    return self;
}

@end
