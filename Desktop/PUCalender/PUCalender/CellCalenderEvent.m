//
//  CellCalenderEvent.m
//  PUCalender
//
//  Created by c196 on 07/03/17.
//  Copyright © 2017 checkmate. All rights reserved.
//

#import "CellCalenderEvent.h"

@implementation CellCalenderEvent
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self.collAllEvents registerNib:[UINib nibWithNibName:@"CellHorizontalScroll" bundle:nil] forCellWithReuseIdentifier:@"CellHorizontalScroll"];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
