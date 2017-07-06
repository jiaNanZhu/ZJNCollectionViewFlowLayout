//
//  ViewController.m
//  CollectionViewDemo
//
//  Created by 朱佳男 on 9/19/16.
//  Copyright © 2016 ShangYuKeJi. All rights reserved.
//

#import "ViewController.h"
#import "Utile.h"
#import "HeaderCollectionReusableView.h"
#import "UploadCollectionViewCell.h"
#import "ZJNCollectionViewFlowLayout.h"
//获取屏幕宽高
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
static NSString *reuseIdentifier = @"headerId";

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSArray *itemArr;
}
@property (nonatomic , strong) UICollectionView *collectionV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *positionTypeArr = @[@"不限",@"金融",@"服务业",@"生产 制造",@"销售 客服 市场",@"财务 人力资源 行政",@"项目 质量  高级管理",@"IT 互联网 通信",@"房产 建筑 物业管理",@"采购 贸易 交通 物流",@"传媒 印刷 艺术 设计",@"咨询 法律 教育 翻译",@"能源 环保 农业 科研",@"兼职 实习 社工 其他"];
    NSArray *payArr = @[@"不限",@"2千以下",@"2千-5千",@"5千-8千",@"8千-1万",@"1万-1.5万",@"1.5万-2万",@"2万-3万",@"3万-5万",@"5万-7万",@"7万-10万",@"10万以上"];
    itemArr = @[positionTypeArr,payArr];
    //    创建一个collectionview，用来展示上传的照片
    ZJNCollectionViewFlowLayout *flowLayout = [[ZJNCollectionViewFlowLayout alloc]init];
    flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 30);
    
    _collectionV = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 22, SCREEN_WIDTH, SCREEN_HEIGHT-22) collectionViewLayout:flowLayout];
    _collectionV.backgroundColor = [UIColor whiteColor];
    _collectionV.delegate = self;
    _collectionV.dataSource = self;
    
    [self.view addSubview:_collectionV];
    [_collectionV registerClass:[UploadCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_collectionV registerClass:[HeaderCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier];

    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark--UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return itemArr.count;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderCollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    view.headerLabel.text = [NSString stringWithFormat:@"我也忘了这是显示的啥%ld",(long)indexPath.section];
    
    return view;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *array = itemArr[section];
    return array.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    UploadCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell)
    {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    
    cell.contentLabel.text = itemArr[indexPath.section][indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *itemStr = itemArr[indexPath.section][indexPath.row];
    NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15],NSFontAttributeName, nil];
    CGSize size = [itemStr boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-16, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return size;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
