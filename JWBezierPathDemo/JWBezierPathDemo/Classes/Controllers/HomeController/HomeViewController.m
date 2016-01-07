//
//  HomeViewController.m
//  JWBezierPathDemo
//
//  Created by wangjun on 16/1/7.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import "HomeViewController.h"

static NSString *kHomeCellIdentifier = @"HomeViewTableCellIdentifier";

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSArray *homeArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Home";
    // Do any additional setup after loading the view.
    
    self.homeArray = @[@{@"title":@"基本画线、画矩形、画圆等",@"class":@"BaseBezierPathViewController"}];
    
    [self commitHomeViewUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)commitHomeViewUI
{
    UITableView *homeTable = [[UITableView alloc] initWithFrame:self.view.bounds
                                                          style:UITableViewStylePlain];
    homeTable.delegate = self;
    homeTable.dataSource = self;
    [homeTable registerClass:[UITableViewCell class]
      forCellReuseIdentifier:kHomeCellIdentifier];
    homeTable.tableFooterView = [UIView new];
    homeTable.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.view addSubview:homeTable];
    
    homeTable.sd_layout
    .leftEqualToView(self.view)
    .topEqualToView(self.view)
    .rightEqualToView(self.view)
    .bottomEqualToView(self.view);
}

#pragma mark - UITableView Delegate & Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.homeArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kHomeCellIdentifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (self.homeArray.count > indexPath.row)
    {
        cell.textLabel.text = self.homeArray[indexPath.row][@"title"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (self.homeArray.count <= indexPath.row) return;
    
    Class tempClass = NSClassFromString(self.homeArray[indexPath.row][@"class"]);
    UIViewController *tempController = [[tempClass alloc] init];
    [self.navigationController pushViewController:tempController animated:YES];
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
