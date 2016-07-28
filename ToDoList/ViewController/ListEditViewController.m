//
//  ListEditViewController.m
//  ToDoList
//
//  Created by Tsubasa Yonenaga on 2016/07/26.
//  Copyright © 2016年 Tsubasa Yonenaga. All rights reserved.
//

#import "ListEditViewController.h"

@protocol ListEditViewControllerViewDelegate;
@interface ListEditViewControllerView : UIView <UITextFieldDelegate>

@property (nonatomic, strong) UITextField   *dataTextField;
@property (nonatomic, strong) UITextField   *taskTextField;

@end

@implementation ListEditViewControllerView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _dataTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 80)];
        _dataTextField.placeholder = @"日付";
        _dataTextField.layer.borderWidth = 1;
        _dataTextField.layer.cornerRadius = 5;
        _dataTextField.enabled = YES;
        _dataTextField.delegate = self;
        [self addSubview:_dataTextField];
        
        _taskTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 250, 200, 80)];
        _taskTextField.placeholder = @"タスク";
        _taskTextField.layer.borderWidth = 1;
        _taskTextField.layer.cornerRadius = 5;
        _taskTextField.enabled = YES;
        _taskTextField.delegate = self;
        [self addSubview:_taskTextField];
        
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [_dataTextField resignFirstResponder];
    [_taskTextField resignFirstResponder];
    return YES;
}

@end

@interface ListEditViewController() {
    ListEditViewControllerView  *_editView;
}

@end

@implementation ListEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"EditPage";
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonTapped)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
    _editView = [[ListEditViewControllerView alloc] initWithFrame:self.view.bounds];
    _editView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_editView];
    
}

- (void)saveButtonTapped {
    NNFMDBManager *db = [NNFMDBManager new];
    NSString *dataString = _editView.dataTextField.text;
    NSString *taskString = _editView.taskTextField.text;
    
    if (!(dataString == nil)&&!(taskString == nil)) {
        [db saveDate:dataString toDoList:taskString];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }

}

@end
