//
//  LongPressMenuLabel.h
//  Jule
//
//  Created by xxx on 14-2-21.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LongPressMenuLabel : UILabel

typedef void (^TipBlock)();
@property(nonatomic, copy) TipBlock tipBlock;

@end
