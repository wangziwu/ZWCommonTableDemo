//
//  ZWStaticModelProtocol.h
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/19.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>

//配置cell模板
#define ZWConfigCellModel(cellName) \
@synthesize zw_cellClassName = _zw_cellClassName;\
-(NSString *)zw_cellClassName{  \
if (!_zw_cellClassName) {\
_zw_cellClassName = cellName;\
}\
return _zw_cellClassName;\
}\
//------------------------redmine-----------------------//
/** 
 *  使用自定义cell的Model，必须实现该协议。
 *  并且给zw_cellClassName赋值
 *  eg:
 *  ZWConfigCellModel(@"ZWStaticInputCell");
 */
@protocol ZWStaticModelProtocol <NSObject>
/** cellName*/
@property (nonatomic, copy) NSString *zw_cellClassName;
@end
