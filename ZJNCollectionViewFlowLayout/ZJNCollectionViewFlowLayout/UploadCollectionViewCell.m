//
//  UploadCollectionViewCell.m
//  XmppTest
//
//  Created by 足球兄弟 on 15/11/23.
//  Copyright © 2015年 zhiyou. All rights reserved.
//

#import "UploadCollectionViewCell.h"

@implementation UploadCollectionViewCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        self.contentLabel.backgroundColor = [UIColor lightGrayColor];
        self.contentLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.contentLabel];

        
    }
    return self;
}
@end
