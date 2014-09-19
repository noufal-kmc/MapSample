//
//  ViewController.m
//  MapSample
//
//  Created by Noufal Abdul Khader on 7/21/14.
//  Copyright (c) 2014 Strietzel. All rights reserved.
//

#import "ViewController.h"
#import "CustomAnnotation.h"
#import "AnnotationViewImage.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initializeMapView];
}

-(void)initializeMapView
{
    [self.mapView setShowsUserLocation:YES];
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDistanceFilter:kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    CLLocationDegrees lat = 11.0421972;
    CLLocationDegrees lon = 76.9865066;
    CLLocation* coimbatoreLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    //self.mapView.delegate = self;
    [self.mapView setCenterCoordinate:[coimbatoreLocation coordinate] animated:YES];
    
    [self.mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    //[self setZoomLevel:coimbatoreLocation];
    
//    CLLocationCoordinate2D cordinates = CLLocationCoordinate2DMake(lat, lon);
//    MapAnnotation *annotation = [[MapAnnotation alloc] initWithCoordinate:[coimbatoreLocation coordinate]
//                                                                    title:@"Cleveland Circle"];
//    
//	[annotation setPinImage:@"image.png"];
//	[self.mapView addAnnotation:annotation];
    CLLocationCoordinate2D coord = [coimbatoreLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 10000.0, 10000.0);
    [self.mapView setRegion:region animated:YES];
    
    CustomAnnotation *annotation = [[CustomAnnotation alloc] initWithCoordinate:coord
                                                                    title:@"Cleveland Circle"];
    
	[annotation setPinImage:@"image.png"];
	[self.mapView addAnnotation:annotation];
}
-(void)setZoomLevel:(CLLocation*)location
{
    //11.0421972,76.9865066 - coimbatore
    //CLLocationDegrees lat = 11.0421972;
    //CLLocationDegrees lon = 76.9865066;
    //CLLocation* currentLocation = [[CLLocation alloc] initWithLatitude:lat longitude:lon];
    //CLLocation *location = [[CLLocation alloc] initWithLatitude:lat longitude:lon]; //Coimbatore location

//    CLLocation *location = [[CLLocation alloc] initWithLatitude:mapView.centerCoordinate.latitude longitude:mapView.centerCoordinate.longitude]; //Get your location and create a CLLocation
    
    MKCoordinateRegion region; //create a region.  No this is not a pointer
    region.center = location.coordinate;  // set the region center to your current location
    MKCoordinateSpan span; // create a range of your view
    span.latitudeDelta = 0.03 / 3;  // span dimensions.  I have BASE_RADIUS defined as 0.0144927536 which is equivalent to 1 mile
    span.longitudeDelta = 0.03 / 3;  // span dimensions
    region.span = span; // Set the region's span to the new span.
    [self.mapView setRegion:region animated:YES];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
	MKAnnotationView* annotationView = nil;
//	CustomAnnotation* csAnnotation = (CustomAnnotation*)annotation;
	// determine the type of annotation, and produce the correct type of annotation view for it.
//    NSString* identifier = @"Pin";
//    MKPinAnnotationView* pin = (MKPinAnnotationView*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
//    
//    if(nil == pin)
//    {
//        pin = [[MKPinAnnotationView alloc] initWithAnnotation:csAnnotation reuseIdentifier:identifier];
//    }
    
    
    NSString* identifier = @"Image";
    
    AnnotationViewImage* imageAnnotationView = (AnnotationViewImage*)[self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if(nil == imageAnnotationView)
    {
        imageAnnotationView = [[AnnotationViewImage alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    
    annotationView = imageAnnotationView;
	
	[annotationView setEnabled:YES];
	[annotationView setCanShowCallout:YES];
	
	return annotationView;
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
