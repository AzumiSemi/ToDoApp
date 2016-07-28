//
//  NNDataSource.h
//  NNSampleToDoList
//
//  Created by TakeshiKomori on 2016/06/05.
//  Copyright © 2016年 TakeshiKomori. All rights reserved.
//


@interface NNFMDBManager : NSObject

@property (nonatomic, strong)NSArray *toDoListArray;

- (void)saveDate:(NSString *)dateString toDoList:(NSString *)toDoListString;
- (NNDataSource *)getToDoList;
- (void)deleteList:(NSInteger)listNumber;
- (id)init;

@end
