//
//  ZWStaticSwitchModel.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/18.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZWStaticModelProtocol.h"
@interface ZWStaticSwitchModel : NSObject<ZWStaticModelProtocol>
/** title*/
@property (nonatomic, copy) NSString *title;
/** switch开关点击事件*/
@property (nonatomic, copy) NSString *actionSwitchName;
@end
