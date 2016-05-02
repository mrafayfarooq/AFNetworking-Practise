//
//  TableViewController.m
//  Assignment 05
//
//  Created by Rafay Farooq on 01/07/2015.
//  Copyright (c) 2015 Folio3. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "AFHTTPRequestOperationManager.h"
@interface TableViewController ()
{
    AFHTTPRequestOperationManager *manager1;
    unsigned long total1;
    TableViewCell *cell1;
    NSMutableArray *dictFinalValues1;
    NSArray * dictKeys1;
    BOOL showList_1;
    AFHTTPRequestOperationManager *manager2;
    unsigned long total2;
    TableViewCell *cell2;
    NSMutableArray *dictFinalValues2;
    NSArray * dictKeys2;
    BOOL showList_2;
    
    
}
@end

@implementation TableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
/*--------------------------------------------------------------------------------------------------*/
    dictFinalValues1 = [[NSMutableArray alloc] init];
    manager1 = [AFHTTPRequestOperationManager manager];
    [manager1 GET:@"http://f3demo1.folio3.com/SCB/FXRate_Server/jsonFiles/quotes1.json" parameters:nil
        success:^(AFHTTPRequestOperation *operation, id list1) {
        NSLog(@"Success");
            //Count the total number of Cells in order to initialize the cells
            total1 = [[list1 objectForKey: @"q"] count];
            //NSLog(@"%lu",total);
            //Reload the Table View after initializing the Row Count
            
           // NSLog(@"%@", [dic objectForKey:@"q"]);
            NSDictionary *sub_dictionary1 = [list1 objectForKey:@"q"];
            dictKeys1=[sub_dictionary1 allKeys];
            NSArray *dictValues1=[sub_dictionary1 allValues];
            NSDictionary *temp1;
            NSString *temp_string1;
            NSArray *dictSubValues1;
            for (int i=0;i<total1;i++){
                temp1 = [dictValues1 objectAtIndex:i];
                dictSubValues1 = [temp1 allValues];
                temp_string1 = dictSubValues1[0];
                [dictFinalValues1 addObject: temp_string1];
            }
        }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
/*---------------------------------------------------------------------------------------------------*/
    dictFinalValues2 = [[NSMutableArray alloc] init];
    manager2 = [AFHTTPRequestOperationManager manager];
    [manager2 GET:@"http://f3demo1.folio3.com/SCB/FXRate_Server/jsonFiles/quotes2.json" parameters:nil
         success:^(AFHTTPRequestOperation *operation, id list2) {
             NSLog(@"Success");
             //Count the total number of Cells in order to initialize the cells
             total2 = [[list2 objectForKey: @"q"] count];
             //NSLog(@"%lu",total);
             //Reload the Table View after initializing the Row Count
             
             // NSLog(@"%@", [dic objectForKey:@"q"]);
             NSDictionary *sub_dictionary2 = [list2 objectForKey:@"q"];
             dictKeys2=[sub_dictionary2 allKeys];
             NSArray *dictValues2=[sub_dictionary2 allValues];
             NSDictionary *temp2;
             NSString *temp_string2;
             NSArray *dictSubValues2;
             for (int i=0;i<total2;i++){
                 temp2 = [dictValues2 objectAtIndex:i];
                 dictSubValues2 = [temp2 allValues];
                 temp_string2 = dictSubValues2[0];
                 [dictFinalValues2 addObject: temp_string2];
             }
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(showList_1)
        return total1;
    else if (showList_2)
        return total2;
    else
        return 0;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    if (cell1 == nil){
        cell1 = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"myCell"];
        return cell1;
    }
    else if (showList_1){
        
        cell1 = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
        cell1.Keys.text = [dictKeys1 objectAtIndex:indexPath.row];
        cell1.Values.text = [dictFinalValues1 objectAtIndex:indexPath.row];
        return cell1;
    }
    else if (showList_2){
        cell2 = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
        cell2.Keys.text = [dictKeys2 objectAtIndex:indexPath.row];
        cell2.Values.text = [dictFinalValues2 objectAtIndex:indexPath.row];
        return cell2;
    }
    
    else{
        cell1.hidden=YES;
        cell2.hidden=YES;
        return cell1;
    }
}


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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)ShowList1:(id)sender {
    showList_1=TRUE;
    showList_2=FALSE;
    [self.tableView reloadData];
}

- (IBAction)ShowList2:(id)sender {
    showList_1=FALSE;
    showList_2=TRUE;
    [self.tableView reloadData];

}
@end
