//
//  MagicalCreature.m
//  MCMS
//
//  Created by Syed Amaanullah on 1/13/15.
//  Copyright (c) 2015 Syed Amaanullah. All rights reserved.
//

#import "MagicalCreature.h"


@implementation MagicalCreature

-(instancetype)initWithName:(NSString *)name {
    self = [super init];
    self.name = name;
    return self;
}

-(instancetype)initWithName:(NSString *)creature specialPower:(NSString *)powers {
    self = [self initWithName:creature];
    self.specialPower = powers;
    return self;
}
-(instancetype)initWithName:(NSString *)creature specialPower:(NSString *)powers creatureImage:(UIImage *)image {
    self = [self initWithName:creature specialPower:powers];
    self.creatureImage = image;
    return self;
}

- (instancetype) initWithName:(NSString *)creature specialPower:(NSString *)powers creatureImage:(UIImage *)image accessories:(NSMutableArray *)things{

    self = [self initWithName: creature
                 specialPower: powers
                creatureImage: image];
    self.accessories = things;

    return self;
}


@end
