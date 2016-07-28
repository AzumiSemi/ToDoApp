//
//  ListTableViewCell.h
//  ToDoList
//
//  Created by Tsubasa Yonenaga on 2016/07/25.
//  Copyright © 2016年 Tsubasa Yonenaga. All rights reserved.
//


@interface ListTableViewCell : UITableViewCell {
    UILabel     *_dataLabel;
    UILabel     *_listLabel;
}

@property (nonatomic, strong) NNToDoList    *toDoList;
@property (nonatomic, strong) UILabel       *toDoDataLabel;
@property (nonatomic, strong) UILabel       *toDoTaskLabel;

@end
