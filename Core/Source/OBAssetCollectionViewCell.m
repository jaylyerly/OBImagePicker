//
//
// Created by Rene Pirringer.
//
// 
//


#import "OBAssetCollectionViewCell.h"
#import "OBAsset.h"
#import "OBGradientView.h"


@implementation OBAssetCollectionViewCell {

	UIView *_highlighedView;
	OBGradientView *_gradientView;
	UILabel *_durationLabel;
}


- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.imageView = [[UIImageView alloc] init];
		[self.contentView addSubview:self.imageView];
	}

	return self;
}


- (void)layoutSubviews {
	[super layoutSubviews];
	self.imageView.frame = self.contentView.frame;


}

- (void)showVideoIndicatorWithDuration:(NSString *)text {
	if (!_gradientView) {
		CGRect frame = CGRectMake(0, self.frame.size.height - 18.0, self.frame.size.width, 18.0);
		UIColor *startColor = [UIColor colorWithWhite:0.0 alpha:0.0];
		UIColor *endColor = [UIColor colorWithWhite:0.0 alpha:0.8];
		_gradientView = [[OBGradientView alloc] initWithFrame:frame startColor:startColor endColor:endColor];

		UIImage *iconImage = [UIImage imageNamed:@"OBVideoIcon.png"];
		UIImageView *icon = [[UIImageView alloc] initWithImage:iconImage];

		icon.frame = CGRectMake(5, _gradientView.frame.size.height - 5 - iconImage.size.height, iconImage.size.width, iconImage.size.height);
		[_gradientView addSubview:icon];

		_durationLabel = [[UILabel alloc] init];

		CGFloat x = icon.frame.origin.x + icon.frame.size.width;
		_durationLabel.frame = CGRectMake(x, icon.frame.origin.y - 1, _gradientView.frame.size.width - x - 5, icon.frame.size.height + 2);
		[_gradientView addSubview:_durationLabel];
		_durationLabel.textAlignment = NSTextAlignmentRight;
		_durationLabel.textColor = [UIColor whiteColor];
		_durationLabel.font = [UIFont systemFontOfSize:12.0f];
	}
	if (_gradientView.superview != self) {
		[self addSubview:_gradientView];
	}
	_durationLabel.text = text;

}

- (void)setAsset:(OBAsset *)asset {
	_asset = asset;
	self.imageView.image = _asset.thumbnailImage;

	if (_asset.isVideo) {
		NSInteger duration = _asset.duration;
		int minutes = (int)(duration / 60);
		int seconds = duration % 60;
		NSString *time = [NSString stringWithFormat:@"%d:%02d", minutes, seconds];
		[self showVideoIndicatorWithDuration:time];
	} else {
		[_gradientView removeFromSuperview];
	}
}


- (void)setSelected:(BOOL)selected {
	[super setSelected:selected];
	if(selected && !_highlighedView) {
		_highlighedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
		_highlighedView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.3];

		UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"OBAssertCheckedImage.png"]];
		imageView.frame = CGRectOffset(imageView.frame, _highlighedView.frame.size.width-imageView.frame.size.width, _highlighedView.frame.size.height-imageView.frame.size.height);
		[_highlighedView addSubview:imageView];

		[self addSubview:_highlighedView];
	}
	_highlighedView.hidden = !selected;
}


@end