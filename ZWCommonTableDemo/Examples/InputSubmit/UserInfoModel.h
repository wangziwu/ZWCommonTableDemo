//
//  UserInfoModel.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/19.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject
/** 用户名*/
@property (nonatomic, copy) NSString *uname;
/** 手机号*/
@property (nonatomic, copy) NSString *uphone;
/** 性别*/
@property (nonatomic, copy) NSString *usex;
/** 地址*/
@property (nonatomic, copy) NSString *uAddress;
/** 备注*/
@property (nonatomic, copy) NSString *remark;
@end
