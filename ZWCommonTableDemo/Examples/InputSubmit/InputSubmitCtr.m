//
//  InputSubmitCtr.m
//  ZWCommonTableDemo
//
//  Created by 王子武 on 2017/8/18.
//  Copyright © 2017年 wang_ziwu. All rights reserved.
//

#import "InputSubmitCtr.h"
#import "InputSubmitViewModel.h"
@interface InputSubmitCtr ()
/** */
@property (nonatomic, strong) InputSubmitViewModel *viewModel;
@end

@implementation InputSubmitCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self configNav];
}
#pragma mark - config
- (void)configNav{
    UIButton *rightBarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBarBtn setTitle:@"保存" forState:UIControlStateNormal];
    [rightBarBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    rightBarBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBarBtn addTarget:self action:@selector(actionSaveInfo) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithCustomView:rightBarBtn];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    [rightBarBtn sizeToFit];
}
#pragma mark - lifeCycle
- (NSArray *)staticDataArray{
    return self.viewModel.staticDataArray;
}
#pragma mark - delegate
#pragma mark - actionFunction
- (void)actionSaveInfo{
    if (!self.viewModel.dynamicData.uname.length) {
        NSLog(@"姓名不能为空！");
        return;
    }
    if (!self.viewModel.dynamicData.usex.length) {
        NSLog(@"请选择性别！");
        return;
    }
    //net todo
}
- (void)actionSelectSex{
    __weak typeof(self) weakSelf = self;
    UIAlertController *alertCtr = [UIAlertController alertControllerWithTitle:@"性别选择" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *manSheet = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.viewModel.dynamicData.usex = @"男";
        [weakSelf.mTable reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }];
    UIAlertAction *womenSheet = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        weakSelf.viewModel.dynamicData.usex = @"女";
        [weakSelf.mTable reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:2 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    }];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertCtr addAction:manSheet];
    [alertCtr addAction:womenSheet];
    [alertCtr addAction:cancle];
    [self presentViewController:alertCtr animated:YES completion:nil];
}
#pragma mark - function
#pragma mark - layzing
-(InputSubmitViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[InputSubmitViewModel alloc] init];
    }
    return _viewModel;
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
