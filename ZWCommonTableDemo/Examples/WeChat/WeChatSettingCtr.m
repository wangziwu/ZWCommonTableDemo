//
//  WeChatSettingCtr.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/2/4.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "WeChatSettingCtr.h"
#import "ZWCommonTable.h"
@interface WeChatSettingCtr ()
@property (weak, nonatomic) IBOutlet UITableView *mTable;
/** */
@property (nonatomic, strong) ZWCommonTableDelegate *tableAdapter;
/** */
@property (nonatomic, strong) NSArray *dataSourceArr;
@end
#define headerHeight     @"20"
#define footerHeight     @"0.01"
@implementation WeChatSettingCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupTableView];
}
-(void)setupTableView{

    self.mTable.tableFooterView = [UIView new];
    self.mTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.mTable.frame.size.width, CGFLOAT_MIN)];
    self.mTable.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.mTable.delegate = self.tableAdapter;
    self.mTable.dataSource = self.tableAdapter;
}

- (NSArray *)dataSourceArr{
    NSArray *data = @[
                           @{
                               SectionHeaderTitle    :@"",
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterTitle    :@"",
                               SectionFooterHeight   :footerHeight,
                               SectionRows           :@[
                                       @{
                                           CellTitle           :@"账号与安全",
                                           CellDetailTitle     :@"已保护",
                                           CellClassName       :@"CommonDetailImageCell",
                                           IsHiddenAccessory   :@(NO)
                                           }
                                       ]
                               },
                           @{
                               SectionHeaderTitle    :@"",
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterTitle    :@"",
                               SectionFooterHeight   :footerHeight,
                               SectionRows           :@[
                                       @{
                                           CellTitle           :@"新消息通知",
                                           CellPushVcClassName :@"YLTAddressBookController"
                                           },
                                       @{
                                           CellTitle           :@"隐私",
                                           CellPushVcClassName :@"BYMyLiveCtr"
                                           },
                                       @{
                                           CellTitle           :@"通用",
                                           CellPushVcClassName :@"YLTDepartMgCtr"
                                           }
                                       ]
                               },
                           @{
                               SectionHeaderTitle    :@"",
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterTitle    :@"",
                               SectionFooterHeight   :footerHeight,
                               SectionRows           :@[
                                       @{
                                           CellTitle           :@"帮助与反馈"
                                           },
                                       @{
                                           CellTitle           :@"关于微信"
                                           }
                                       ]
                               },
                           @{
                               SectionHeaderTitle    :@"",
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterTitle    :@"",
                               SectionFooterHeight   :@"",
                               SectionRows           :@[
                                       @{
                                           CellTitle           :@"退出登录",
                                           CellClassName       :@"ZWStaticButtonCell",
                                           IsHiddenAccessory   :@(YES),
                                           CellRowHeight       :@"40",
                                           CellActionSelName   :@"actionExitLogin"
                                           }
                                       ]
                               },
                           ];
    return  [ZWCommonTableSection sectionsWithData:data];
}
-(void)actionExitLogin{
    [self.navigationController popViewControllerAnimated:YES];
}
-(ZWCommonTableDelegate *)tableAdapter{
    if (!_tableAdapter) {
        _tableAdapter = [[ZWCommonTableDelegate alloc] initWithTableData:^NSArray *{
            return self.dataSourceArr;;
        }];
    }
    return _tableAdapter;
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
