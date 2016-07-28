//
//  NNConst.h
//  NNSampleToDoList
//
//  Created by TakeshiKomori on 2016/06/06.
//  Copyright © 2016年 TakeshiKomori. All rights reserved.
//

#ifndef NNConst_h
#define NNConst_h

#define DB_FILE_NAME @"toDoListApp.db"

#define SQL_CREATE @"CREATE TABLE IF NOT EXISTS toDoLists (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, list TEXT);"
#define SQL_INSERT @"INSERT INTO toDoLists (date, list) VALUES(?, ?);"
#define SQL_SELECT @"SELECT id, date, list FROM toDoLists;"
#define SQL_DELETE @"DELETE FROM toDoLists WHERE id = ?;"

#endif 