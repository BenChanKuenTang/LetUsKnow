//
//  ListPostViewController.m
//  PublicHealth
//
//  Created by Ben Chan on 4/12/15.
//  Copyright © 2015 Ben Chan. All rights reserved.
//

#import "ListPostViewController.h"
#import "ListPostCell.h"
#import "ListTagViewController.h"
#import "PostDetailViewController.h"

@interface ListPostViewController ()

@end

@implementation ListPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    postTableView.rowHeight = UITableViewAutomaticDimension;
    postTableView.estimatedRowHeight = 50;
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tag List" style:UIBarButtonItemStylePlain target:self action:@selector(searchTag:)];
    
    [self showHUDWithTitle:@"Loading"];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = nil;
    NSString *api = [NSString stringWithFormat:@"%@%@", API_ENDPOINT, API_GET_CASE];
    
    __weak ListPostViewController *weakSelf = self;
    [manager POST:api parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        [weakSelf hideHUD];
        dataArray = [[NSArray alloc] initWithArray:responseObject[@"data"]];
        [ProjManager shared].caseArray = [[NSMutableArray alloc] initWithArray:dataArray];
        [postTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [weakSelf hideHUD];
    }];
}

- (void)searchTag:(id)sender {
    ListTagViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ListTagViewController"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [postTableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PostDetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PostDetailViewController"];
    vc.title = dataArray[indexPath.row][@"title"];
    vc.case_id = dataArray[indexPath.row][@"case_id"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"ListPostCell";
    ListPostCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
        cell = [[ListPostCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    
    [cell setData:dataArray[indexPath.row]];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(updateCount:)];
    tapRecognizer.numberOfTapsRequired = 1;
    [cell.postImage addGestureRecognizer:tapRecognizer];
    NSString *case_id = dataArray[indexPath.row][@"case_id"];
    cell.postImage.tag = [case_id intValue];
    cell.postImage.userInteractionEnabled = YES;
    
    return cell;
}

- (void)updateCount:(UITapGestureRecognizer*)sender {
    UIView *view = sender.view;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *case_id = [NSString stringWithFormat:@"%ld", (long)view.tag];
    NSDictionary *parameters = @{@"case_id":case_id, @"count":@"1"};
    NSString *api = [NSString stringWithFormat:@"%@%@", API_ENDPOINT, API_SET_CASE];
    
    __weak ListPostViewController *weakSelf = self;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:api parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Success: %@", responseObject);
        [weakSelf hideHUD];
        [postTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [weakSelf hideHUD];
    }];
    
    /*
     [manager POST:api parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
     } success:^(AFHTTPRequestOperation *operation, id responseObject) {
     NSLog(@"Success: %@", responseObject);
     [weakSelf hideHUD];
     [postTableView reloadData];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
     NSLog(@"Error: %@", error);
     [weakSelf hideHUD];
     }];
     */
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
//    return header;
//}

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
