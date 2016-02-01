//
//  ViewController.m
//  汽车品牌
//
//  Created by 章芝源 on 16/2/1.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "ZYViewController.h"
#import "ZYGroup.h"
#import "ZYCar.h"

@interface ZYViewController ()<UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
//模型数组
@property(nonatomic, strong)NSArray *groups;
@end

@implementation ZYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
}

#pragma mark - tableView数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ZYGroup *group = self.groups[section];
    return group.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYGroup *group = self.groups[indexPath.section];
    ZYCar *car = group.cars[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xxx"];
    
    cell.imageView.image = [UIImage imageNamed:car.icon];
    cell.textLabel.text = car.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

//设置header
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    ZYGroup *group = self.groups[section];
    return group.title;
}

//设置索引列
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.groups valueForKeyPath:@"title"];
}

#pragma mark - 懒加载
- (NSArray *)groups
{
    if (!_groups) {
        _groups = [[NSArray alloc]init];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *arrayGroups = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in arrayGroups) {
            ZYGroup *group = [[ZYGroup alloc]initWithDict:dict];
            [arrayM addObject:group];
        }
        _groups = arrayM;
    }
    return _groups;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.frame = self.view.bounds;
        self.tableView = _tableView;
        [self.view addSubview:_tableView];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"xxx"];
    }
    return _tableView;
}


@end
