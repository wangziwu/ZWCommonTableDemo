//
//  ZWCommonTableCtr.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/18.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ZWCommonTableCtr.h"
#import "ZWCommonTableDelegate.h"
@interface ZWCommonTableCtr ()
@property (nonatomic, strong) ZWCommonTableDelegate *tableAdapter;
/** static Data*/
@property (nonatomic, strong) NSArray *staticDataArray;
@end

@implementation ZWCommonTableCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configTable];
}
#pragma mark - config
- (void)configTable{
    [self.view addSubview:self.mTable];
}
#pragma mark - lifeCycle
//override
- (NSArray *)staticDataArray{
    return @[];
}
#pragma mark - delegate
#pragma mark - actionFunction
#pragma mark - function
#pragma mark - layzing
-(ZWCommonTableDelegate *)tableAdapter{
    if (!_tableAdapter) {
        _tableAdapter = [[ZWCommonTableDelegate alloc] initWithTableData:^NSArray *{
            return self.staticDataArray;
        }];
    }
    return _tableAdapter;
}
-(UITableView *)mTable{
    if (!_mTable) {
        _mTable = [[UITableView alloc] initWithFrame:CGRectZero
                                               style:UITableViewStyleGrouped];
        _mTable.frame = self.view.bounds;
        _mTable.delegate = self.tableAdapter;
        _mTable.dataSource = self.tableAdapter;
        _mTable.tableFooterView = [UIView new];
        _mTable.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _mTable;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
