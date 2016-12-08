//
//  ViewController.h
//  LocationInfo
//
//  Created by Student on 14/11/16.
//  Copyright © 2016 student. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapview;

@property(nonatomic,retain)CLLocationManager *manager;

@property(nonatomic,retain)CLGeocoder *geocoder;

@end

