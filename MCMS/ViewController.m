//
//  ViewController.m
//  MCMS
//
//  Created by Syed Amaanullah on 1/13/15.
//  Copyright (c) 2015 Syed Amaanullah. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"
#import "BattleViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *creatureTextField;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];




    NSMutableArray *goblinAcc = [NSMutableArray arrayWithObjects:@"Axe", @"Sword", @"Exploding Pumpkins", nil];
    NSMutableArray *lochnessAcc = [NSMutableArray arrayWithObjects:@"Harpoon", @"Sheild", @"Explosives", nil];
    NSMutableArray *godzillaAcc = [NSMutableArray arrayWithObjects:@"Gloves", @"Boots", @"Glasses", nil];


    MagicalCreature *goblin = [[MagicalCreature alloc] initWithName: @"Goblin"
                                                       specialPower: @"Teleport"
                                                      creatureImage: [UIImage imageNamed: @"Goblin"]
                                                        accessories: goblinAcc];



   MagicalCreature *lochness = [[MagicalCreature alloc] initWithName: @"Loch Ness"
                                                          specialPower: @"Swim real fast"
                                                         creatureImage: [UIImage imageNamed: @"Lochness" ]
                                                           accessories: lochnessAcc];
    MagicalCreature *godzilla = [[MagicalCreature alloc] initWithName: @"Godzilla"
                                                         specialPower: @"Super strength"
                                                        creatureImage: [UIImage imageNamed: @"Godzilla"]
                                                          accessories: godzillaAcc];

    self.creatures = [NSMutableArray arrayWithObjects: goblin, lochness, godzilla, nil];

    

    
    [self.tableView reloadData];
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
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
    cell.detailTextLabel.text = creature.specialPower;



    return cell;
}

#pragma mark - Actions

- (IBAction)onAddButtonTapped:(UIButton *)sender
{
    MagicalCreature *newCreature = [[MagicalCreature alloc] initWithName: self.creatureTextField.text];
    [self.creatures addObject: newCreature];

    self.creatureTextField.text = @"";

    [self.tableView reloadData];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
    CreatureViewController *vc = segue.destinationViewController;
    MagicalCreature *creatureTapped = [self.creatures objectAtIndex:selectedIndexPath.row];
    vc.creature = creatureTapped;
}

/*-(void)prepareForSegueBattle:(UIStoryboardSegue *)segue sender:(id)sender {
    BattleViewController *battleView = segue.destinationViewController;
    NSArray *allImages = [[NSArray arrayWithArray:
}
*/





@end
