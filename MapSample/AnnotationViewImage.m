//
//  AnnotationViewImage.m
//  MapSample
//
//  Created by Noufal Abdul Khader on 7/21/14.
//  Copyright (c) 2014 Strietzel. All rights reserved.
//

#import "AnnotationViewImage.h"
#import "CustomAnnotation.h"
#define kHeight 40
#define kWidth  40
#define kBorder 2
@implementation AnnotationViewImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
	self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
	self.frame = CGRectMake(0, 0, kWidth, kHeight);
	self.backgroundColor = [UIColor whiteColor];
	
	CustomAnnotation* cAnnotation = (CustomAnnotation*)annotation;
	
	UIImage* image = [UIImage imageNamed:cAnnotation.pinImage];
	_imageView = [[UIImageView alloc] initWithImage:image];
	[_imageView.layer setCornerRadius:20];
    [_imageView.layer setMasksToBounds:YES];
    self.backgroundColor = [UIColor clearColor];
    
	_imageView.frame = CGRectMake(kBorder, kBorder, kWidth - 2 * kBorder, kWidth - 2 * kBorder);
	[self addSubview:_imageView];
	
	return self;
	
}
@end
