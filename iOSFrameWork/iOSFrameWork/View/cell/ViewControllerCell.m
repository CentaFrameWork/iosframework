//
//  ViewControllerCell.m
//  PanKeTong
//
//  Created by 李慧娟 on 17/2/13.
//  Copyright © 2017年 中原集团. All rights reserved.
//

#import "ViewControllerCell.h"

@implementation ViewControllerCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"ViewControllerCell" bundle:nil];
}

- (void)setModel:(LoginEntity *)model
{
    if (_model != model) {
        _model = model;
    }
    
    LoginResultEntity *result = model.result;
    
    self.leftLabel.text = result.loginDomainUser.domainAccount;
    self.rightLabel.text = result.loginDomainUser.staffNo;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
