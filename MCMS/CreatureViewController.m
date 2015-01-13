//
//  CreatureViewController.m
//  MCMS
//
//  Created by Syed Amaanullah on 1/13/15.
//  Copyright (c) 2015 Syed Amaanullah. All rights reserved.
//

#import "CreatureViewController.h"

@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UITextField *changeNameTextField;

@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.creature.name;
}

- (IBAction)onEditButtonTapped:(UIButton *)sender {

    if (sender.isTouchInside) {

        self.changeNameTextField.hidden = NO;
        self.nameLabel.hidden = YES;
        self.creature.name = self.changeNameTextField.text;
        
        [sender setTitle: @"Done" forState: UIControlStateNormal];
    }   else {
        self.changeNameTextField.hidden = YES;
        self.nameLabel.hidden = NO;
        self.nameLabel.text = self.creature.name;
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
    }
 
    //[sender setTitle: @"Done" forState: UIControlStateNormal];
}


@end
