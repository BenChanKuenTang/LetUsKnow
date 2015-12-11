//
//  PostDetailViewController.m
//  PublicHealth
//
//  Created by Ben Chan on 11/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "PostDetailViewController.h"
#import "PostDetailCell.h"

@interface PostDetailViewController ()

@end

@implementation PostDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    detailTableView.rowHeight = UITableViewAutomaticDimension;
    detailTableView.estimatedRowHeight = 50;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Refresh" style:UIBarButtonItemStylePlain target:self action:@selector(refresh)];
    
    lbTitle.text = self.title;
    [self refresh];
}

- (void)refresh {
    [self showHUDWithTitle:@"Loading"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"case_id":self.case_id};
    NSString *api = [NSString stringWithFormat:@"%@%@", API_ENDPOINT, API_GET_CHAT];
    
    __weak PostDetailViewController *weakSelf = self;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:api parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        [weakSelf hideHUD];
        dataArray = [[NSMutableArray alloc] initWithArray:responseObject[@"data"]];
        [detailTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [weakSelf hideHUD];
    }];
    
    tfMsg.text = @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"PostDetailCell";
    PostDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
        cell = [[PostDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    
    cell.lbDetail.text = dataArray[indexPath.row][@"msg"];
    
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

- (IBAction)btnSendClicked:(id)sender {
    [self showHUDWithTitle:@"Loading"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"case_id":self.case_id, @"msg":tfMsg.text};
    NSString *api = [NSString stringWithFormat:@"%@%@", API_ENDPOINT, API_SET_CHAT];
    
    __weak PostDetailViewController *weakSelf = self;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:api parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        [weakSelf hideHUD];
        [self refresh];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [weakSelf hideHUD];
    }];
}

@end
