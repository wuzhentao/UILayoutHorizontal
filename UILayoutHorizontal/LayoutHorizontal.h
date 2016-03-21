//
//  LayoutHorizontal.h
//  UILayoutHorizontal
//
//  Created by wzt on 15/11/9.
//  Copyright © 2015年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  有些个别需求要使collectionView的横向排布，但原生的FlowLayout只能纵向排列不能横向填充，即：
   -----------------
   0  2  4  6
 
   1  3  5  7
   -----------------
  我们想达到的要求是横向填充即
   ----------------
   0  1  2  3
 
   4  5  6  7
  -----------------
  不用写Sction有多少，把rows告诉即可
 */

@interface LayoutHorizontal : UICollectionViewLayout
/**内边距 */
@property (nonatomic, assign) UIEdgeInsets  edgInsets;
/**想展示的行数*/
@property (nonatomic, assign) NSInteger     totalRow;
/**想展示的列数*/
@property (nonatomic, assign) NSInteger     totalColum;
/** 每一行之间的间距 */
@property (nonatomic, assign) CGFloat       rowMargin;
@property (nonatomic, assign) CGFloat       height;
@property (nonatomic, assign) CGFloat       width;
@end
