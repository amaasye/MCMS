//
//  BattleViewController.m
//  MCMS
//
//  Created by Syed Amaanullah on 1/13/15.
//  Copyright (c) 2015 Syed Amaanullah. All rights reserved.
//

#import "BattleViewController.h"
#import "MagicalCreature.h"

@interface BattleViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *winnerImage;

@end

@implementation BattleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.winnerImage.image = self.creature.creatureImage;
    self.title = self.creature.name;

}





@end
