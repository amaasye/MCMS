//
//  MagicalCreature.h
//  MCMS
//
//  Created by Syed Amaanullah on 1/13/15.
//  Copyright (c) 2015 Syed Amaanullah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSString *specialPower;
@property UIImage *creatureImage;
-(instancetype)initWithName: (NSString *)creature;
-(instancetype)initWithName:(NSString *)creature specialPower:(NSString *)powers;
-(instancetype)initWithName:(NSString *)creature specialPower:(NSString *)powers creatureImage:(UIImage *)image;




@end
