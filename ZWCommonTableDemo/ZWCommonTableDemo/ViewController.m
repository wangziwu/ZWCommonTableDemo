//
//  ViewController.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/1/21.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "ViewController.h"
#import "ZWCommonTableDelegate.h"
#import "ZWCommonTableData.h"
@interface ViewController ()
/** */
@property (nonatomic, strong) ZWCommonTableDelegate *comDelegate;
/** */
@property (nonatomic, strong) NSArray *dataSourceArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setData];
    [self setupTableView];
}
-(void)setupTableView{
    __weak typeof(self) weakSelf = self;
    _comDelegate = [[ZWCommonTableDelegate alloc] initWithTableData:^NSArray *{
        return weakSelf.dataSourceArr;
    }];
    UITableView *mTable = [[UITableView alloc] initWithFrame:self.view.bounds
                                                       style:UITableViewStylePlain];
    mTable.tableFooterView = [UIView new];
    mTable.delegate = _comDelegate;
    mTable.dataSource = _comDelegate;
    [self.view addSubview:mTable];
}
-(void)setData{
    self.dataSourceArr = @[
                           @{
                               SectionHeaderTitle    :@"",
                               SectionHeaderHeight   :@"",
                               SectionFooterTitle    :@"",
                               SectionFooterHeight   :@"",
                               SectionRows           :@[
                                       @{
                                           CellTitle           :@"微信-事例一",
                                           CellPushVcClassName :@"WeChatMineCtr"
                                           },
                                       @{
                                           CellTitle           :@"微信_事例二",
                                           CellPushVcClassName :@"WeChatSettingCtr"
                                           },
                                       @{
                                           CellTitle           :@"通用",
                                           CellImageName       :@"icon_profile_depart",
                                           CellPushVcClassName :@"CommonTableCtr"
                                           }
                                       ]
                               },
                           ];
    self.dataSourceArr = [ZWCommonTableSection sectionsWithData:self.dataSourceArr];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
