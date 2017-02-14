//
//  CommonTableCtr.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/2/7.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "CommonTableCtr.h"
#import "ZWCommonTableDelegate.h"
#import "ZWCommonTableData.h"
#import "WeChatInfoModel.h"
@interface CommonTableCtr ()
/** */
@property (nonatomic, strong) ZWCommonTableDelegate *comDelegate;
/** */
@property (nonatomic, strong) NSArray *dataSourceArr;
@end

@implementation CommonTableCtr

#define headerHeight     @"20"
#define footerHeight     @"0.01"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setData];
    [self setupTableView];
}
-(void)setupTableView{
    __weak typeof(self) weakSelf = self;
    _comDelegate = [[ZWCommonTableDelegate alloc] initWithTableData:^NSArray *{
        return weakSelf.dataSourceArr;
    }];
    UITableView *mTable = [[UITableView alloc] initWithFrame:self.view.bounds
                                                       style:UITableViewStyleGrouped];
    mTable.tableFooterView = [UIView new];
    mTable.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mTable.frame.size.width, CGFLOAT_MIN)];
    mTable.backgroundColor = [UIColor groupTableViewBackgroundColor];
    mTable.delegate = _comDelegate;
    mTable.dataSource = _comDelegate;
    [self.view addSubview:mTable];
}
-(void)setData{
    WeChatInfoModel *infoModel  = [[WeChatInfoModel alloc] init];
    infoModel.headerImage       = @"WechatIMG2";
    infoModel.name              = @"Kingzzz";
    infoModel.weChatName        = @"KingWeChat";
    self.dataSourceArr = @[
                           @{
                               SectionHeaderTitle    :@"",
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterTitle    :@"",
                               SectionFooterHeight   :footerHeight,
                               SectionRows           :@[
                                       @{
                                           CellRowHeight       :@"100",
                                           CellClassName       :@"WeChatMineInfoCell",
                                           CellExtraInfo       :infoModel
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
                                           CellTitle           :@"微信事例一",
                                           CellImageName       :@"MoreMyAlbum_25x25_",
                                           CellPushVcClassName :@"WeChatMineCtr"
                                           },
                                       @{
                                           CellTitle           :@"微信事例二",
                                           CellImageName       :@"MoreMyFavorites_25x25_",
                                           CellPushVcClassName :@"WeChatSettingCtr"
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
                                           CellTitle           :@"字体大小",
                                           CellDetailTitle     :@"小号字体",
                                           IsHiddenAccessory   :@(YES)
                                           },
                                       @{
                                           CellTitle           :@"缓存大小",
                                           CellDetailTitle     :@"1000KB",
                                           CellActionSelName   :@"actionClearCach"
                                           }
                                       ]
                               },
                           @{
                               SectionHeaderTitle    :@"",
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterTitle    :@"开启后，为你推荐已经开通微信的手机联系人\
                               开启后，为你推荐已经开通微信的手机联系人等等等等等",
                               SectionFooterHeight   :@"50",
                               SectionRows           :@[
                                       @{
                                           CellTitle           :@"消息验证",
                                           IsHiddenAccessory   :@(YES),
                                           CellClassName       :@"ZWCommonSwitchCell",
                                           IsForbidSelect      :@(YES),
                                           CellActionSelName   :@"messVavid:"
                                           },
                                       @{
                                           CellTitle           :@"像我推荐通讯录朋友",
                                           IsHiddenAccessory   :@(YES),
                                           CellClassName       :@"ZWCommonSwitchCell",
                                           IsForbidSelect      :@(YES)
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
                                           CellTitle           :@"退出",
                                           CellClassName       :@"ZWCommonButtonCell",
                                           IsHiddenAccessory   :@(YES),
                                           CellRowHeight       :@"40",
                                           CellActionSelName   :@"actionExitLogin"
                                           }
                                       ]
                               },
                           ];
    self.dataSourceArr = [ZWCommonTableSection sectionsWithData:self.dataSourceArr];
}
-(void)actionClearCach{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"清空缓存" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)messVavid:(UISwitch *)mSwitch{
    NSString *alertMessage;
    if (mSwitch.on) {
        alertMessage = @"open";
    }else{
        alertMessage = @"close";
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:^{
        
    }];
}
-(void)actionExitLogin{
    [self.navigationController popViewControllerAnimated:YES];
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
