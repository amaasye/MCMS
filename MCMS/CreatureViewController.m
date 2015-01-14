//
//  CreatureViewController.m
//  MCMS
//
//  Created by Syed Amaanullah on 1/13/15.
//  Copyright (c) 2015 Syed Amaanullah. All rights reserved.
//

#import "CreatureViewController.h"
#import "MagicalCreature.h"

@interface CreatureViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UITextField *changeNameTextField;
@property (weak, nonatomic) IBOutlet UIImageView *creatureImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nameLabel.text = self.creature.name;
    self.creatureImageView.image = self.creature.creatureImage;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creature.accessories.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    cell.textLabel.text = [self.creature.accessories objectAtIndex:indexPath.row];
    return cell;
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
