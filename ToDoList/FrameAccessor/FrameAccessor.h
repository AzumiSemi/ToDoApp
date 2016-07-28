//
//  FrameAccessor.h
//  FrameAccessor
//
//  Created by Alex Denisov on 18.03.12.
//  Copyright (c) 2013 okolodev.org. All rights reserved.
//

/*
2014/12/12
値を挿入した時にNanが挿入されて落ちることがあったので、
Nanの時は0を代入する用に修正した。
 */

#import "ViewFrameAccessor.h"

#define commonDeviceHeight [UIScreen mainScreen].bounds.size.height
#define commonDeviceWidth  [UIScreen mainScreen].bounds.size.width

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
    #import "ScrollViewFrameAccessor.h"

#endif
