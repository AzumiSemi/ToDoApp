//
//  NNToDoList.h
//  NNSampleToDoList
//
//  Created by TakeshiKomori on 2016/06/05.
//  Copyright © 2016年 TakeshiKomori. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NNToDoList : NSObject

@property (nonatomic, assign)NSInteger listID;
@property (nonatomic, strong)NSString *date;
@property (nonatomic, strong)NSString *list;


@end
