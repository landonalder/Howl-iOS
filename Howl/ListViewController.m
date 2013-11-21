//
//  ListViewController.m
//  Howl
//
//  Created by Landon Alder on 10/24/13.
//  Copyright (c) 2013 Howl. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"
#import "Callback.h"
#import "NetworkCalls.h"
#import "ObjectFactory.h"
#import "Restaurant.h"

@interface ListViewController ()

@end

@implementation ListViewController
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
}

-(void)initView
{
    self.title = @"Howl";
    [NetworkCalls fetchData:[[NSURL alloc] initWithString:@"http://nodejs-discoverhowl.rhcloud.com/list/1"] withCallback:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [UITableViewCell new];
        Restaurant * restaurant = [ObjectFactory getRestaurant:indexPath.row];
        if (restaurant) {
            UILabel * restName = [UILabel new];
            restName.frame = CGRectMake(50, 0, 280, 44);
            restName.text = [restaurant getName];
            restName.backgroundColor = [UIColor clearColor];
            [cell addSubview:restName];
            
            UILabel * restNumber = [UILabel new];
            restNumber.frame = CGRectMake(30, 0, 20, 44);
            restNumber.text = [NSString stringWithFormat:@"%d", indexPath.row + 1];
            restNumber.backgroundColor = [UIColor clearColor];
            [cell addSubview:restNumber];
            
            UILabel * restDistance = [UILabel new];
            restDistance.frame = CGRectMake(230, 0, 60, 44);
            restDistance.backgroundColor = [UIColor clearColor];
            [cell addSubview:restDistance];
            
            // TODO: Add touch sensor for vote method
            UIButton * upVote = [[UIButton alloc] initWithFrame:CGRectMake(10, 5, 15, 15)];
            [upVote setImage:[UIImage imageNamed:@"up.png"] forState:UIControlStateNormal];
            [upVote addTarget:restaurant action:@selector(increaseVotes) forControlEvents:UIControlEventTouchUpInside];
            [cell addSubview:upVote];
            
            UIButton * downVote = [[UIButton alloc] initWithFrame:CGRectMake(10, 25, 15, 15)];
            [downVote setImage:[UIImage imageNamed:@"down.png"] forState:UIControlStateNormal];
            [cell addSubview:downVote];
        }
    }
    
    
    return cell;
}

-(void)onAction:(NSString *)action object:(NSObject *)value
{
    NSArray * restList = (NSArray *)value;
    NSDictionary * temp;
    Restaurant * r;
    for (int i = 0; i < [restList count]; i++)
    {
        temp = [restList objectAtIndex:i];
        r = [Restaurant new];
        [r setNumber:i];
        [r setName: [temp objectForKey:@"restname"]];
        [r setAddress:[temp objectForKey:@"restaddress"]];
        [r setPhone:[temp objectForKey:@"restphone"]];
        [r setLatitude:[[temp objectForKey:@"restlat"] doubleValue]];
        [r setLongitude:[[temp objectForKey:@"restlong"] doubleValue]];
        [r setVotes:[[temp objectForKey:@"restvotes"] integerValue]];
        [ObjectFactory addRestaurant:r];
    }
    [self.tableView reloadData];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"Detail" bundle:nil];

    [detailViewController setRestNum:indexPath.row];
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
