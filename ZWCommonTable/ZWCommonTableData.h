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

//
#define IsCellSwitchOn          @"isCellSwitchOn"

@interface ZWCommonTableRow : NSObject
/** */
@property (nonatomic, copy) NSString *cellTitle;
/** */
@property (nonatomic, assign) CGFloat cellTitleFont;
/** */
@property (nonatomic, copy) NSString *cellImageName;
/** */
@property (nonatomic, copy) NSString *cellDetailTitle;
/** */
@property (nonatomic, assign) CGFloat cellDetailTitleFont;
/** custom cell*/
@property (nonatomic, copy) NSString *cellClassName;
/** default DidSelected to push ViewController */
@property (nonatomic, copy) NSString *cellPushVcClassName;
/** runtime setValue:forKey by dictionary value and key*/
@property (nonatomic, strong) NSDictionary *cellPushVcKeyValue;
/** custom cell action */
@property (nonatomic, copy) NSString *cellActionSelName;
/** */
@property (nonatomic, assign) CGFloat cellRowHeight;
/** */
@property (nonatomic, assign) BOOL isHiddenAccessory;
/** */
@property (nonatomic, assign) BOOL isForbidSelect;
/** extra*/
@property (nonatomic, strong) id cellExtraInfo;
//switch
@property (nonatomic, assign) BOOL isCellSwitchOn;

- (instancetype)initWithDic:(NSDictionary *)rowDict;

@end

@interface ZWCommonTableSection : NSObject
/** header*/
@property (nonatomic, copy) NSString *headerTitle;
/** footer*/
@property (nonatomic, copy) NSString *footerTitle;
/** headerHeight*/
@property (nonatomic, assign) CGFloat headerHeight;
/** footerHeigher*/
@property (nonatomic, assign) CGFloat footerHeight;
/** rows*/
@property (nonatomic, strong) NSArray<ZWCommonTableRow *> *tableRows;

- (instancetype)initWithDic:(NSDictionary *)secDict;
+ (NSArray *)sectionsWithData:(NSArray *)sectionsArr;
@end

