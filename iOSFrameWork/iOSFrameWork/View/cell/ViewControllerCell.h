//
//  ViewControllerCell.h
//  PanKeTong
//
//  Created by 李慧娟 on 17/2/13.
//  Copyright © 2017年 中原集团. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginEntity.h"
@interface ViewControllerCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@property (strong, nonatomic) LoginEntity *model;


+ (UINib *)nib;

@end
