//
//  ZWCommonTableData.h
//  YLTOA
//
//  Created by 王子武 on 2017/1/13.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//Section
#define SectionHeaderTitle      @"headerTitle"
#define SectionFooterTitle      @"footerTitle"
#define SectionHeaderHeight     @"headerHeight"
#define SectionFooterHeight     @"footerHeight"
#define SectionRows             @"tableRows"
//row
#define CellTitle               @"cellTitle"
#define CellTitleFont           @"cellTitleFont"

#define CellImageName           @"cellImageName"
#define CellDetailTitle         @"cellDetailTitle"
#define CellDetailTitleFont     @"cellDetailTitleFont"
#define CellClassName           @"cellClassName"
#define CellPushVcClassName     @"cellPushVcClassName"
#define CellActionSelName       @"cellActionSelName"
#define CellRowHeight           @"cellRowHeight"
#define CellPushVcKeyValue      @"cellPushVcKeyValue"
//extra
#define CellExtraInfo           @"cellExtraInfo"

//setting
#define IsHiddenCell            @"isHiddenCell"
#define IsHiddenAccessory       @"isHiddenAccessory"
#define IsForbidSelect          @"isForbidSelect"
#define IsHiddenSections        @"isHiddenSections"
@interface ZWCommonTableRow : NSObject
/** 
 *  默认title
 */
@property (nonatomic, copy) NSString *cellTitle;
/** 
 *  默认DetailTitle
 */
@property (nonatomic, copy) NSString *cellDetailTitle;
/** 
 *  image
 */
@property (nonatomic, copy) NSString *cellImageName;
/** 
 *  title字体大小
 */
@property (nonatomic, assign) CGFloat cellTitleFont;
/** 
 *  DetailTitle字体大小
 */
@property (nonatomic, assign) CGFloat cellDetailTitleFont;
/** 
 *  设定当前加载cell的类名
 */
@property (nonatomic, copy) NSString *cellClassName;
/** 
 *  设定默认执行PUSH的Controller
 */
@property (nonatomic, copy) NSString *cellPushVcClassName;
/** 
 *  cell点击事件方法名。
 *  自动去主控制器寻找该方法
 */
@property (nonatomic, copy) NSString *cellActionSelName;
/** 
 *  默认PUSH的Controller的KeyValue
 */
@property (nonatomic, strong) NSDictionary *cellPushVcKeyValue;

/** 
 *  cell高度
 */
@property (nonatomic, assign) CGFloat cellRowHeight;
/** 
 *  是否隐藏右侧箭头，默认YES
 */
@property (nonatomic, assign) BOOL isHiddenAccessory;
/** 
 *  是否禁止点击事件
 */
@property (nonatomic, assign) BOOL isForbidSelect;
/** 
 *  cell拓展,自定义cell数据来源
 */
@property (nonatomic, strong) id cellExtraInfo;

- (instancetype)initWithDic:(NSDictionary *)rowDict;

@end

@interface ZWCommonTableSection : NSObject
/** 
 *  section header title
 */
@property (nonatomic, copy) NSString *headerTitle;
/** 
 *  section footer title
 */
@property (nonatomic, copy) NSString *footerTitle;
/** 
 *  header高度
 */
@property (nonatomic, assign) CGFloat headerHeight;
/**
 *  footer高度
 */
@property (nonatomic, assign) CGFloat footerHeight;
/** 
 *  sectionRows集合
 */
@property (nonatomic, strong) NSArray<ZWCommonTableRow *> *tableRows;
/**
 *  是否隐藏section中所有cell
 *  默认：NO
 */
@property (nonatomic, assign) BOOL isHiddenSections;

- (instancetype)initWithDic:(NSDictionary *)secDict;
+ (NSArray *)sectionsWithData:(NSArray *)sectionsArr;
@end

