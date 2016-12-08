//
//  ViewController.m
//  LocationInfo
//
//  Created by Student on 14/11/16.
//  Copyright © 2016 student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _manager=[[CLLocationManager alloc]init];
    _manager.desiredAccuracy=kCLLocationAccuracyBest;
    _manager.delegate=self;
    
    [_manager startUpdatingLocation];
    
    _geocoder=[[CLGeocoder alloc]init];
    
    
    NSString *address=@"Kothrud , Pune  ,Maharashtra  ,India  ,411038";
    
    [_geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *mylatlong =[placemarks objectAtIndex:0];
        
        CLLocation *location =mylatlong.location;
        
        NSLog(@"%f   %f",location.coordinate.latitude, location.coordinate.longitude);
    }];
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *mycureentlocation= [locations lastObject];
    
   [_geocoder reverseGeocodeLocation:mycureentlocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
       
       CLPlacemark *mylocationinfo=[placemarks objectAtIndex:0];
       MKPointAnnotation *point=[[MKPointAnnotation alloc]init];
       point.title=mylocationinfo.locality;
       point.subtitle=mylocationinfo.postalCode;
       
       CLLocationCoordinate2D loc;
       loc.longitude=mycureentlocation.coordinate.longitude;
       loc.latitude=mycureentlocation.coordinate.latitude;
       
       point.coordinate =loc;
       [self.mapview addAnnotation:point];
}];
    
    
//  NSLog(@"%f   %f", mycureentlocation.coordinate.latitude  , mycureentlocation.coordinate.longitude);
}


//-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
//{
//    
//    CLLocation *loc=[locations lastObject];
//    
//    NSLog(@"%f   %f",loc.coordinate.latitude,loc.coordinate.longitude);
//    
//}
//







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
