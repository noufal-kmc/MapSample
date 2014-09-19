//
//  ViewController.h
//  MapSample
//
//  Created by Noufal Abdul Khader on 7/21/14.
//  Copyright (c) 2014 Strietzel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
