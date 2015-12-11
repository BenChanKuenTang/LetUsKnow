//
//  PostByAddressViewController.m
//  PublicHealth
//
//  Created by Ben Chan on 12/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "PostByAddressViewController.h"
#import "ListTagCell.h"

@interface PostByAddressViewController ()

@end

@implementation PostByAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    addressTableView.rowHeight = UITableViewAutomaticDimension;
    addressTableView.estimatedRowHeight = 50;
    
    [self showHUDWithTitle:@"Loading"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"tag":self.searchTag};
    NSString *api = [NSString stringWithFormat:@"%@%@", API_ENDPOINT, API_GET_CASE];
    
    __weak PostByAddressViewController *weakSelf = self;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:api parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        [weakSelf hideHUD];
        dataArray = [[NSMutableArray alloc] initWithArray:responseObject[@"data"]];
        [addressTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [weakSelf hideHUD];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [addressTableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"ListTagCell";
    ListTagCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
        cell = [[ListTagCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    
    //    [cell setData:tagArray[indexPath.row]];
    cell.lbTitle.text = dataArray[indexPath.row][@"address"];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(nonnull NSString *)title atIndex:(NSInteger)index {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
