//
//  ListTableViewController.m
//  
//
//  Created by Tsubasa Yonenaga on 2016/07/25.
//
//

#import "ListTableViewController.h"
#import "ListTableViewCell.h"
#import "ListEditViewController.h"

@interface ListTableViewController () {
    NNFMDBManager   *_dbManager;
    NSMutableArray  *_changeOrderArry;
}

@property (nonatomic, strong) NNToDoList    *toDoList;

@end

@implementation ListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ToDoList";
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarButtonTapped)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    self.navigationItem.leftBarButtonItem  = self.editButtonItem;
    _dbManager = [NNFMDBManager new];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    NNDataSource *dataSource = [_dbManager getToDoList];
    _changeOrderArry = [[[dataSource.dataSourceArray reverseObjectEnumerator] allObjects] mutableCopy];
    [self.tableView reloadData];
}

- (void)rightBarButtonTapped {
    ListEditViewController *editViewController = [ListEditViewController new];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:editViewController];
    [self presentViewController:navi animated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _changeOrderArry.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        _toDoList = _changeOrderArry[indexPath.row];
        [_changeOrderArry removeObjectAtIndex:indexPath.row];
        [_dbManager deleteList:_toDoList.listID];
    }
    [tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    _toDoList = _changeOrderArry[indexPath.row];
    if (indexPath.section == 0) {
        [(ListTableViewCell *) cell setToDoList:_toDoList];
    }
    return cell;
}

@end
