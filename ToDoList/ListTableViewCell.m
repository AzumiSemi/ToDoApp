//
//  ListTableViewCell.m
//  ToDoList
//
//  Created by Tsubasa Yonenaga on 2016/07/25.
//  Copyright © 2016年 Tsubasa Yonenaga. All rights reserved.
//

#import "ListTableViewCell.h"

const CGFloat cellMargin = 20;

@implementation ListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(cellMargin, cellMargin, 60, 40)];
        _dataLabel.text = @"日付";
        [self.contentView addSubview:_dataLabel];
        _toDoDataLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, cellMargin, commonDeviceWidth - 60, 40)];
        [self.contentView addSubview:_toDoDataLabel];

        _listLabel = [[UILabel alloc] initWithFrame:CGRectMake(cellMargin, 80, 60, 40)];
        _listLabel.text = @"タスク";
        [self.contentView addSubview:_listLabel];
        _toDoTaskLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 60, commonDeviceWidth - 60, 40)];
        [self.contentView addSubview:_toDoTaskLabel];
    }
    return self;
}

- (void)setToDoList:(NNToDoList *)toDoList {
    _toDoList = toDoList;
    _toDoDataLabel.text = _toDoList.date;
    _toDoTaskLabel.text = _toDoList.list;
}

@end
