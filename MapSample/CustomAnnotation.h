//
//  CustomAnnotation.h
//  MapSample
//
//  Created by Noufal Abdul Khader on 7/21/14.
//  Copyright (c) 2014 Strietzel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface CustomAnnotation : NSObject<MKAnnotation>

-(id) initWithCoordinate:(CLLocationCoordinate2D)coordinate
				   title:(NSString*)title;
@property (nonatomic, strong) NSString* pinImage;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@end
