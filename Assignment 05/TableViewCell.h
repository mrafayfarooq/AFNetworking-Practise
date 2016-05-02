//
//  TableViewCell.h
//  Assignment 05
//
//  Created by Rafay Farooq on 02/07/2015.
//  Copyright (c) 2015 Folio3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *Keys;
@property (weak, nonatomic) IBOutlet UILabel *Values;

@end
