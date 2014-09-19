//
//  MapAnnotation.m
//  MapSample
//
//  Created by Noufal Abdul Khader on 7/21/14.
//  Copyright (c) 2014 Strietzel. All rights reserved.
//

#import "CustomAnnotation.h"
@interface CustomAnnotation(){
    
    
}


@end

@implementation CustomAnnotation
@synthesize pinImage;

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate
				   title:(NSString*)title{
    self = [super init];
	_coordinate = coordinate;
	_title = title;
	return self;
}
@end
