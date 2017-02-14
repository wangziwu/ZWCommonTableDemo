//
//  ZWCommonTableDelegate.m
//  YLTOA
//
//  Created by 王子武 on 2017/1/17.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWCommonTableDelegate.h"
#import "ZWCommonTableData.h"
#import "ZWCommonTableCellProtocol.h"
@interface ZWCommonTableDelegate ()
/** */
@property (nonatomic, copy) NSArray *(^ReciverData)(void);
@end

#define DefaultCommonTableCell  @"UITableViewCell"

@implementation ZWCommonTableDelegate
- (instancetype)initWithTableData:(ReturnTableData)tableData{
    self = [super init];
    if (self) {
        self.ReciverData = tableData;
    }
    return self;
}
-(NSArray *)tableData{
    return self.ReciverData();
}
#pragma mark - UITableView
#pragma mark - UITableViewDataSource+UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.tableData.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ZWCommonTableSection *sectionModel = self.tableData[section];
    return sectionModel.tableRows.count;
}
//header
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    ZWCommonTableSection *sectionModel = self.tableData[section];
    return sectionModel.headerHeight;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    ZWCommonTableSection *sectionModel = self.tableData[section];
    return sectionModel.headerTitle;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ZWCommonTableSection *sectionModel = self.tableData[section];
    return sectionModel.headerTitle.length?nil:[UIView new];
}
//footer
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    ZWCommonTableSection *sectionModel = self.tableData[section];
    return sectionModel.footerHeight;
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    ZWCommonTableSection *sectionModel = self.tableData[section];
    return sectionModel.footerTitle;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    ZWCommonTableSection *sectionModel = self.tableData[section];
    return sectionModel.footerTitle.length?nil:[UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZWCommonTableSection *sectionModel = self.tableData[indexPath.section];
    ZWCommonTableRow *cellRows = sectionModel.tableRows[indexPath.row];
    return cellRows.cellRowHeight;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZWCommonTableSection *sectionModel = self.tableData[indexPath.section];
    ZWCommonTableRow *cellRows = sectionModel.tableRows[indexPath.row];
    NSString *identify = cellRows.cellClassName.length?cellRows.cellClassName:DefaultCommonTableCell;
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        Class cellClass = NSClassFromString(identify);
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
        NSString *path = [[NSBundle mainBundle] pathForResource:identify ofType:@".nib"];
        if (path) {
            //custom cell use xib
            cell = [[NSBundle mainBundle] loadNibNamed:identify owner:nil options:nil][0];
        }
    }
    if ([cell respondsToSelector:@selector(refreshCellData:tableView:)]) {
        [(id<ZWCommonTableCellProtocol>)cell refreshCellData:cellRows tableView:tableView];
    }else{
        [self refreshCellData:cellRows cell:cell];
    }
    //isHiddenAccessory (>)
    cell.accessoryType = cellRows.isHiddenAccessory?UITableViewCellAccessoryNone:UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消选中的颜色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ZWCommonTableSection *sectionModel = self.tableData[indexPath.section];
    ZWCommonTableRow *cellRows = sectionModel.tableRows[indexPath.row];
    if (cellRows.isForbidSelect) return;
    //custom function
    UIViewController *superVc = [self getSuperViewController:tableView];
    SEL sel = NSSelectorFromString(cellRows.cellActionSelName);
    BOOL goSel = sel&&[superVc respondsToSelector:sel];
    if (goSel) {
        [superVc performSelectorOnMainThread:sel withObject:nil waitUntilDone:YES];
        return;
    }
    //default push
    Class vcClass = NSClassFromString(cellRows.cellPushVcClassName);
    UIViewController *vc = [[vcClass alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    //pamer
    NSDictionary *dic = cellRows.cellPushVcKeyValue;
    for (NSString *key in dic.allKeys) {
        @try {
            [vc setValue:dic[key] forKey:key];
        } @catch (NSException *exception) {
            NSLog(@"cellPushVcKeyValue exception !");
        } @finally {
            
        }
    }
    [superVc.navigationController pushViewController:vc animated:YES];
}
- (void)refreshCellData:(ZWCommonTableRow *)cellRows cell:(UITableViewCell *)cell{
    cell.imageView.image = [UIImage imageNamed:cellRows.cellImageName];
    cell.textLabel.text = cellRows.cellTitle;
    cell.textLabel.font = [UIFont systemFontOfSize:cellRows.cellTitleFont];
    cell.detailTextLabel.text = cellRows.cellDetailTitle;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:cellRows.cellDetailTitleFont];
}
//util
-(UIViewController *)getSuperViewController:(UIView *)view{
    for (UIView* next = view; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
