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
@property (weak, nonatomic) IBOutlet UITextField *powersTextField;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];




    NSMutableArray *goblinAcc = [NSMutableArray arrayWithObjects:@"Axe", @"Sword", @"Exploding Pumpkins", nil];
    NSMutableArray *lochnessAcc = [NSMutableArray arrayWithObjects:@"Razor Sharp Teeth", @"Constricting Power", @"Venom", nil];
    NSMutableArray *godzillaAcc = [NSMutableArray arrayWithObjects:@"Super Strength", @"Razor Sharp Teeth", @"Agility", nil];


    MagicalCreature *goblin = [[MagicalCreature alloc] initWithName: @"Goblin"
                                                       specialPower: @"Evil creature from the world of the unseen"
                                                      creatureImage: [UIImage imageNamed: @"Goblin"]
                                                        accessories: goblinAcc];



   MagicalCreature *lochness = [[MagicalCreature alloc] initWithName: @"Loch Ness"
                                                          specialPower: @"Mysterious killer sea creature"
                                                         creatureImage: [UIImage imageNamed: @"Lochness" ]
                                                           accessories: lochnessAcc];
    MagicalCreature *godzilla = [[MagicalCreature alloc] initWithName: @"Godzilla"
                                                         specialPower: @"The one and only"
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
    MagicalCreature *newCreature = [[MagicalCreature alloc] initWithName: self.creatureTextField.text specialPower:self.powersTextField.text];
    [self.creatures addObject: newCreature];

    self.creatureTextField.text = @"";
    self.powersTextField.text = @"";

    [self.tableView reloadData];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"ShowCreatureSegue"]) {

    NSIndexPath *selectedIndexPath = self.tableView.indexPathForSelectedRow;
    CreatureViewController *vc = segue.destinationViewController;
    MagicalCreature *creatureTapped = [self.creatures objectAtIndex:selectedIndexPath.row];
    vc.creature = creatureTapped;
    } else {
        BattleViewController *battleView = segue.destinationViewController;

        MagicalCreature *randomCreature = [self.creatures objectAtIndex:(arc4random()%[self.creatures count])];
    //  battleView.title = randomCreature.name;
        battleView.creature = randomCreature;
    }
}





@end
