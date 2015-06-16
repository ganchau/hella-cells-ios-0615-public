//
//  FISHellaMasterTableTableViewController.m
//  HellaCells
//
//  Created by Gan Chau on 6/16/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISHellaMasterTableViewController.h"
#import "FISHellaDetailViewController.h"

@interface FISHellaMasterTableViewController ()

@property (nonatomic, strong) NSMutableArray *numbers;
@property (nonatomic, strong) NSString *tappedNumber;

@end

@implementation FISHellaMasterTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.accessibilityIdentifier = @"Table";
    self.numbers = [@[] mutableCopy];
    
    for (NSUInteger i = 0; i < 100; i++) {
        NSString *numberForArray = [NSString stringWithFormat:@"%lu", i + 1];
        [self.numbers addObject:numberForArray];
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.numbers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HellaCellReuseID" forIndexPath:indexPath];
    
    // Configure the cell...
    NSUInteger cellRow = indexPath.row;
    NSString *number = self.numbers[cellRow];
    cell.textLabel.text = number;
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    self.tappedNumber = self.numbers[indexPath.row];
//    NSLog(@"Tapped row: %@", self.tappedNumber);
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    FISHellaDetailViewController *HDVC = segue.destinationViewController;
    NSInteger index = self.tableView.indexPathForSelectedRow.row;
    HDVC.numberString = self.numbers[index];
    
    NSLog(@"Sending tapped number: %@", HDVC.numberString);
}


@end
