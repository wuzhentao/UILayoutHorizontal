//
//  LayoutHorizontal.m
//  UILayoutHorizontal
//
//  Created by wzt on 15/11/9.
//  Copyright © 2015年 Baidu. All rights reserved.
//

#import "LayoutHorizontal.h"

@interface LayoutHorizontal()
@property (nonatomic, strong) NSMutableArray *attrbutarray;
@end

@implementation LayoutHorizontal

- (NSMutableArray *)attrbutarray {
    if (!_attrbutarray) {
        _attrbutarray = [NSMutableArray array];
    }
    return _attrbutarray;
}

- (instancetype)init {
    if (self = [super init]) {
        self.edgInsets = UIEdgeInsetsMake(20, 20, 20, 20);
        self.rowMargin = 20;
    }
    return self;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat sectionWidth = 0;
    for (int i = 1 ; i <= indexPath.section; i ++) {
        sectionWidth  += [UIScreen mainScreen].bounds.size.width * ([self.collectionView numberOfItemsInSection:i- 1] / (self.totalColum *self.totalRow) + 1);
    }
    CGFloat baseWidth =  sectionWidth + indexPath.item / (self.totalColum *self.totalRow) * [UIScreen mainScreen].bounds.size.width;
    CGFloat marginX = ([UIScreen mainScreen].bounds.size.width -  self.edgInsets.left - self.edgInsets.right - self.width * self.totalColum ) / (self.totalColum - 1);
    
    CGFloat X = baseWidth + self.edgInsets.left + (indexPath.item % self.totalColum)* (self.width +marginX);
    CGFloat Y = self.edgInsets.top + ((indexPath.item %(self.totalColum *self.totalRow))/ self.totalColum) * (self.height + self.rowMargin);
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attr.frame = CGRectMake(X, Y, self.width, self.height);
    return attr;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    [self.attrbutarray removeAllObjects];
    NSInteger sections = [self.collectionView numberOfSections];
    for (int i = 0 ; i < sections; i ++) {
        NSInteger count = [self.collectionView numberOfItemsInSection:i];
        for (NSInteger j = 0; j < count; j ++) {
            NSIndexPath *index = [NSIndexPath indexPathForItem:j inSection:i];
            UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:index];
            [self.attrbutarray addObject:attr];
        }
    }
        return self.attrbutarray;
}

- (CGSize)collectionViewContentSize {
    
    CGFloat Width  ;
    for (int i = 0 ; i < [self.collectionView numberOfSections]; i ++) {
        Width  += [UIScreen mainScreen].bounds.size.width * ([self.collectionView numberOfItemsInSection:i] / (self.totalColum *self.totalRow) + 1);
    }
    return CGSizeMake(Width , self.edgInsets.top + self.edgInsets.bottom + self.height * self.totalRow + (self.totalRow - 1)* self.rowMargin);
}

@end
