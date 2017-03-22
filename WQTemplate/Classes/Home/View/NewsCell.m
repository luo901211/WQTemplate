//
//  NewsCell.m
//  WQStartKit
//
//  Created by luo on 2017/3/13.
//  Copyright © 2017年 wenqi. All rights reserved.
//

#import "NewsCell.h"
#import "UIColor+HEX.h"

@interface NewsCell ()
{
    UILabel *_titleLabel;
    UILabel *_descLabel;
    UIImageView *_iconImageView;
}
@end

@implementation NewsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setup];
        [self updateConstraints];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setup {
    _iconImageView = [UIImageView new];
    _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
    _iconImageView.clipsToBounds = YES;
    _iconImageView.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    [self.contentView addSubview:_iconImageView];
    
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont boldSystemFontOfSize:16];
    _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    [self.contentView addSubview:_titleLabel];
    
    _descLabel = [UILabel new];
    _descLabel.font = [UIFont systemFontOfSize:13];
    _descLabel.numberOfLines = 0;
    _descLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    [self.contentView addSubview:_descLabel];
    
}

// tell UIKit that you are using AutoLayout
+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(10);
        make.left.equalTo(10);
        make.width.equalTo(100);
        make.height.equalTo(75);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(12);
        make.left.equalTo(_iconImageView.right).with.offset(8);
        make.right.equalTo(-10);
        make.height.equalTo(20);
    }];

    [_descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.bottom).with.offset(12);
        make.left.equalTo(_titleLabel.left);
        make.right.equalTo(_titleLabel.right);
        make.height.mas_lessThanOrEqualTo(40);
    }];

    //according to apple super should be called at end of method
    
    [super updateConstraints];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(NewsModel *)model {
    _model = model;
    
    // title
    _titleLabel.text = model.title;
    
    // desc
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:model.desc];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [model.desc length])];
    _descLabel.attributedText = attributedString;
    
    // image
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.imageSrc] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
}
@end
