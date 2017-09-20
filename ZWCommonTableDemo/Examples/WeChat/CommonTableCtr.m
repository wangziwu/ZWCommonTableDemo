//
//  CommonTableCtr.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/2/7.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "CommonTableCtr.h"
#import "ZWCommonTable.h"
#import "WeChatInfoModel.h"
#import "WeChatSettingCtr.h"
@interface CommonTableCtr ()
/** 
 *  adapter
 */
@property (nonatomic, strong) ZWCommonTableDelegate *comDelegate;
/** 
 *  data
 */
@property (nonatomic, strong) NSArray *dataSourceArr;
/** 
 *  开启消息验证
 */
@property (nonatomic, assign) BOOL isInvateOn;
/**
 *  开启推荐
 */
@property (nonatomic, assign) BOOL isrecommendOn;
@end

@implementation CommonTableCtr

#define headerHeight     @"20"
#define footerHeight     @"0.01"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
-(NSArray *)dataSourceArr{
    WeChatInfoModel *infoModel  = [[WeChatInfoModel alloc] init];
    infoModel.headerImage       = @"WechatIMG2";
    infoModel.name              = @"wang_ziwu";
    infoModel.weChatName        = @"KingWeChat";
    
    ZWStaticSwitchModel *msgValidModel = [[ZWStaticSwitchModel alloc] init];
    msgValidModel.title = @"消息验证";
    msgValidModel.actionSwitchName = @"actionSwitch:";
    msgValidModel.isSwitchOn = self.isInvateOn;
    
    ZWStaticSwitchModel *recommendModel = [[ZWStaticSwitchModel alloc] init];
    recommendModel.title = @"像我推荐通讯录朋友";
    recommendModel.isSwitchOn = self.isrecommendOn;
    
    NSArray *array = @[
                           @{
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterHeight   :footerHeight,
                               SectionRows           :@[
                                       @{
                                           IsHiddenAccessory    :@(NO),
                                           CellRowHeight        :@"100",
                                           CellExtraInfo        :infoModel
                                           }
                                       ]
                               },
                           @{
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterHeight   :footerHeight,
                               SectionRows           :@[
                                       @{
                                           CellTitle            :@"微信事例一",
                                           CellImageName        :@"MoreMyAlbum_25x25_",
                                           CellPushVcClassName  :@"WeChatMineCtr",
                                           IsHiddenAccessory    :@(NO)
                                           },
                                       @{
                                           CellTitle            :@"微信事例二",
                                           CellImageName        :@"MoreMyFavorites_25x25_",
                                           CellActionSelName    :@"actionToExampCtr",
                                           IsHiddenAccessory    :@(NO)
                                           }
                                       ]
                               },
                           @{
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterHeight   :footerHeight,
                               SectionRows           :@[
                                       @{
                                           CellTitle            :@"字体大小",
                                           CellDetailTitle      :@"小号字体",
                                           },
                                       @{
                                           CellTitle            :@"缓存大小",
                                           CellDetailTitle      :@"1000KB",
                                           CellActionSelName    :@"actionClearCach",
                                           IsHiddenAccessory    :@(NO)
                                           }
                                       ]
                               },
                           @{
                               SectionHeaderHeight   :headerHeight,
                               SectionFooterTitle    :@"开启后，为你推荐已经开通微信的手机联系人",
                               SectionFooterHeight   :@"50",
                               SectionRows           :@[
                                       @{
                                           CellExtraInfo        :msgValidModel
                                           },
                                       @{
                                           CellExtraInfo        :recommendModel
                                           }
                                       ]
                               },
                           @{
                               SectionHeaderHeight   :headerHeight,
                               SectionRows           :@[
                                       @{
                                           CellTitle            :@"退出",
                                           CellRowHeight        :@"40",
                                           CellClassName        :@"ZWStaticButtonCell",
                                           CellActionSelName    :@"actionExitLogin"
                                           }
                                       ]
                               },
                           ];
    return  [ZWCommonTableSection sectionsWithData:array];
}
-(void)actionToExampCtr{
    WeChatSettingCtr *setCtr = [[WeChatSettingCtr alloc] init];
    [self.navigationController pushViewController:setCtr animated:YES];
}
-(void)actionClearCach{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"清空缓存" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)actionSwitch:(UISwitch *)mSwitch{
    NSString *alertMessage;
    if (mSwitch.on) {
        alertMessage = @"open";
    }else{
        alertMessage = @"close";
    }
    self.isInvateOn = mSwitch.on;
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
