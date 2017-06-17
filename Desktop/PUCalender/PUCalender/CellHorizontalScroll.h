//
//  CellHorizontalScroll.h
//  PUCalender
//
//  Created by c196 on 08/03/17.
//  Copyright © 2017 checkmate. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HorizontalScrollCellAction;
@protocol HorizontalScrollCellDelegate <NSObject>
@optional
-(void)cellSelected:(id)sender;
@end

@interface CellHorizontalScroll : UICollectionViewCell <UIScrollViewDelegate>
{
    CGFloat supW;
    CGFloat off;
    CGFloat diff;
}


@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
-(void)setUpCellWithArray:(NSArray *)array;

@property (nonatomic,strong) id<HorizontalScrollCellDelegate> cellDelegate;

@end
