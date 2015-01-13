//
//  CreatureViewController.m
//  MCMS
//
//  Created by Syed Amaanullah on 1/13/15.
//  Copyright (c) 2015 Syed Amaanullah. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UITextField *changeNameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.creature.name;
    self.creatureImageView.image = self.creature.creatureImage;
}



- (IBAction)onEditButtonTapped:(UIButton *)sender {

    if (sender.isTouchInside) {

        if ([sender.titleLabel.text isEqualToString: @"Edit"]) {

            self.changeNameTextField.hidden = NO;
            self.nameLabel.hidden = YES;
            self.creature.name = self.changeNameTextField.text;

            [sender setTitle: @"Done" forState: UIControlStateNormal];
        }

        if ([sender.titleLabel.text isEqualToString: @"Done"]) {

            self.changeNameTextField.hidden = YES;
            self.nameLabel.hidden = NO;
            self.creature.name = self.changeNameTextField.text;
            self.nameLabel.text = self.creature.name;

   }
}
}
@end
