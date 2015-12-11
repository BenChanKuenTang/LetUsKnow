//
//  ListTagViewController.m
//  PublicHealth
//
//  Created by Ben Chan on 11/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "ListTagViewController.h"
#import "ListTagCell.h"
#import "PostByAddressViewController.h"

@interface ListTagViewController ()

@end

@implementation ListTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tagTableView.rowHeight = UITableViewAutomaticDimension;
    tagTableView.estimatedRowHeight = 50;
    
    tagArray = [[NSMutableArray alloc] initWithArray:[ProjManager shared].caseArray];
    for (NSDictionary *dict in tagArray) {
        
//        for (NSDictionary *tagDict in tagArray) {
//            if (![tagDict[@"tag"] containsObject:dict[@"tag"]]) {
//                //add tag
//                NSMutableDictionary *dictToAdd = [NSMutableDictionary new];
//                [dictToAdd setObject:dict[@"tag"] forKey:@"tag"];
//                [dictToAdd setObject:dict[@"count"] forKey:@"count"];
//                [tagArray addObject:dictToAdd];
//            }
//        }
    }
//    for (NSDictionary *dict in [ProjManager shared].caseArray) {
//        NSMutableDictionary *tempDict = [NSMutableDictionary new];
//        if (![tagArray containsObject:dict[@"tag"]]) {
//            //add tag
//            [tempDict setObject:dict[@"tag"] forKey:@"tag"];
//            [tempDict setObject:dict[@"count"] forKey:@"count"];
//            [tagArray addObject:dict];
//        }
//        else {
//            //add count
//            int count = [dict[@"count"] intValue];
//            [tagArray removeObject:dict];
//            [tagArray ];
//        }
//    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tagTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PostByAddressViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PostByAddressViewController"];
    vc.searchTag = tagArray[indexPath.row][@"tag"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"ListTagCell";
    ListTagCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
        cell = [[ListTagCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    
//    [cell setData:tagArray[indexPath.row]];
    cell.lbTitle.text = tagArray[indexPath.row][@"tag"];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(nonnull NSString *)title atIndex:(NSInteger)index {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tagArray.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
