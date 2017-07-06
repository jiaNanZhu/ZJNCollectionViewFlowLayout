//
//  ZJNCollectionViewFlowLayout.m
//  CollectionViewFlowLayoutDemo
//
//  Created by 朱佳男 on 2017/6/27.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ZJNCollectionViewFlowLayout.h"

@implementation ZJNCollectionViewFlowLayout
const NSInteger kMaxCellSpacing = 10;
//让item居左
- (void)prepareLayout{
    [super prepareLayout];
    
    self.minimumLineSpacing = 20;
    self.minimumInteritemSpacing = 10;
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    self.collectionView.showsVerticalScrollIndicator = YES;
    self.collectionView.alwaysBounceVertical = YES;
}
//定义屏幕展示的范围和数量
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {

    NSArray *answer = [super layoutAttributesForElementsInRect:rect];
    // 遍历结果
    for(int i = 1; i < [answer count]; ++i) {
        // 获取cell的Attribute，根据上一个cell获取最大的x，定义为origin
        UICollectionViewLayoutAttributes *currentLayoutAttributes = answer[i];
        UICollectionViewLayoutAttributes *prevLayoutAttributes = answer[i - 1];
        NSInteger origin;
        if (currentLayoutAttributes.indexPath.section != prevLayoutAttributes.indexPath.section) {
            origin = 0;
        }else{
            origin = CGRectGetMaxX(prevLayoutAttributes.frame);
        }
        // 设置cell最大间距
        NSInteger maximumSpacing = 10;
        // 若当前cell和precell在同一行：①判断当前的cell加间距后的最大宽度是否小于ContentSize的宽度，②判断当前cell的x是否大于precell的x（否则cell会出现重叠）
        //满足则给当前cell的frame属性赋值（不满足的cell会根据系统布局换行）
        CGRect frame = currentLayoutAttributes.frame;
        if (origin+maximumSpacing+frame.size.width+10>[UIScreen mainScreen].bounds.size.width) {
            
        }else{
            frame.origin.x = origin + maximumSpacing;
        }
        
        currentLayoutAttributes.frame = frame;
    }
    return answer;
}

@end
