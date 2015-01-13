//
//  ViewController.m
//  MCMS
//
//  Created by Syed Amaanullah on 1/13/15.
//  Copyright (c) 2015 Syed Amaanullah. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *creatureTextField;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalCreature *goblin = [[MagicalCreature alloc]initWithCreature:@"Goblin"];
    MagicalCreature *lochness = [[MagicalCreature alloc]initWithCreature:@"Loch Ness"];
    MagicalCreature *godzilla = [[MagicalCreature alloc]initWithCreature:@"Godzilla"];
    self.creatures = [NSMutableArray arrayWithObjects:goblin, lochness, godzilla, nil];


    
}

#pragma mark - UITableView Data Source

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section
{
    return [self.creatures count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"MyCellID"
                                                            forIndexPath:indexPath];

    MagicalCreature *creature = [self.creatures objectAtIndex: indexPath.row];
    cell.textLabel.text = creature.name;


    return cell;
}

#pragma mark - Actions

- (IBAction)onAddButtonTapped:(UIButton *)sender
{
    MagicalCreature *newCreature = [[MagicalCreature alloc] initWithCreature: self.creatureTextField.text];
    [self.creatures addObject: newCreature];

    self.creatureTextField.text = @"";

    [self.tableView reloadData];
    
}

@end
