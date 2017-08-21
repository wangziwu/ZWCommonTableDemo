//
//  InputSubmitViewModel.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/19.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfoModel.h"
@interface InputSubmitViewModel : NSObject
/** 布局data*/
@property (nonatomic, strong) NSArray *staticDataArray;
/** 动态绑定数据*/
@property (nonatomic, strong) UserInfoModel *dynamicData;
@end
