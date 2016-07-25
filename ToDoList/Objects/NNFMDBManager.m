//
//  NNDataSource.m
//  NNSampleToDoList
//
//  Created by TakeshiKomori on 2016/06/05.
//  Copyright © 2016年 TakeshiKomori. All rights reserved.
//

#import "NNFMDBManager.h"
#import "FMDatabase.h"

@interface NNFMDBManager ()
{
    FMDatabase * _db;
}

@end

@implementation NNFMDBManager

- (id)init {
    self = [super init];
    if (self) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
        NSString *dir = [paths objectAtIndex:0];
        _db = [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:DB_FILE_NAME]];
        [_db open];
        [_db executeUpdate:SQL_CREATE];
        [_db close];
    }
    return self;
}

- (void)saveDate:(NSString *)dateString toDoList:(NSString *)toDoListString {
    [_db open];
    [_db executeUpdate:SQL_INSERT, dateString, toDoListString];
    [_db close];
}

- (NNDataSource *)getToDoList {
    [_db open];
    FMResultSet *results = [_db executeQuery:SQL_SELECT];
    NNDataSource *dataSource = [NNDataSource new];
    dataSource.dataSourceArray = [[NSMutableArray alloc]initWithCapacity:0];
    while( [results next] ) {
        NNToDoList *toDoList = [NNToDoList new];
        toDoList.listID = [results intForColumnIndex:0];
        toDoList.date = [results stringForColumnIndex:1];
        toDoList.list = [results stringForColumnIndex:2];
        [dataSource.dataSourceArray addObject:toDoList];
    }
    [_db close];
    return dataSource;
}

- (void)deleteList:(NSInteger)listNumber {
    [_db open];
    [_db executeUpdate:SQL_DELETE, [NSNumber numberWithInteger:listNumber]];
    [_db close];
}

@end
