//
//  SCAreaPickerView.m
//  BaoChunHui
//
//  Created by BCH on 2016/12/22.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import "SCAreaPickerView.h"

#define kDuration 0.3


@interface SCAreaPickerView ()
{
   NSArray *provinces, *cities, *areas;
}

@end
@implementation SCAreaPickerView
- (id)initWithStyle:(SCAreaPickerStyle)pickerStyle withDelegate:(id<SCAreaPickerViewDelegate>)delegate andDataSource:(id<SCAreaPickerViewDataSource>)dataSource {
    self = [[[NSBundle mainBundle] loadNibNamed:@"SCAreaPickerView" owner:self options:nil] objectAtIndex:0];
    if (self) {
        self.delegate = delegate;
        self.pickerStyle = pickerStyle;
        self.dataSource = dataSource;
        self.locatePicker.dataSource = self;
        self.locatePicker.delegate = self;
        
        provinces = [self.dataSource areaPickerData:self];
        cities = [[provinces objectAtIndex:0] objectForKey:@"city_name"];
        self.state = [[provinces objectAtIndex:0] objectForKey:@"provice_name"];
        if (self.pickerStyle == SCAreaPickerWithStateAndCityAndDistrict) {
            self.city = [[cities objectAtIndex:0] objectForKey:@"city_name"];
            
            areas = [[cities objectAtIndex:0] objectForKey:@"county_name"];
            if (areas.count > 0) {
                self.district = [areas objectAtIndex:0];
            } else{
                self.district = @"";
            }
            
        } else{
            self.city = [cities objectAtIndex:0];
        }
    }
    
    return self;
}
#pragma mark - PickerView lifecycle

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (self.pickerStyle == SCAreaPickerWithStateAndCityAndDistrict) {
        return 3;
    } else{
        return 2;
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    switch (component) {
        case 0:
            return [provinces count];
            break;
        case 1:
            return [cities count];
            break;
        case 2:
            if (self.pickerStyle == SCAreaPickerWithStateAndCityAndDistrict) {
                return [areas count];
                break;
            }
        default:
            return 0;
            break;
    }
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (self.pickerStyle == SCAreaPickerWithStateAndCityAndDistrict) {
        switch (component) {
            case 0:
                return [[provinces objectAtIndex:row] objectForKey:@"provice_name"];
                break;
            case 1:
                return [[cities objectAtIndex:row] objectForKey:@"city_name"];
                break;
            case 2:
                if ([areas count] > 0) {
                    return [areas objectAtIndex:row];
                    break;
                }
            default:
                return @"";
                break;
        }
    }else{
        switch (component) {
            case 0:
                return [[provinces objectAtIndex:row] objectForKey:@"provice_name"];
                break;
            case 1:
                return [cities objectAtIndex:row];
                break;
            default:
                return @"";
                break;
        }
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (self.pickerStyle == SCAreaPickerWithStateAndCityAndDistrict) {
        switch (component) {
            case 0:
                cities = [[provinces objectAtIndex:row] objectForKey:@"city_name"];
                [self.locatePicker selectRow:0 inComponent:1 animated:YES];
                [self.locatePicker reloadComponent:1];
                areas = [[cities objectAtIndex:0] objectForKey:@"county_name"];
                [self.locatePicker selectRow:0 inComponent:2 animated:YES];
                [self.locatePicker reloadComponent:2];
                self.state = [[provinces objectAtIndex:row] objectForKey:@"provice_name"];
                self.city = [[cities objectAtIndex:0] objectForKey:@"city_name"];
                if ([areas count] > 0) {
                    self.district = [areas objectAtIndex:0];
                }else {
                    self.district = @"";
                }
                break;
            case 1:
                areas = [[cities objectAtIndex:row] objectForKey:@"county_name"];
                [self.locatePicker selectRow:0 inComponent:2 animated:YES];
                [self.locatePicker reloadComponent:2];
                self.city = [[cities objectAtIndex:row] objectForKey:@"city_name"];
                if ([areas count] > 0) {
                    self.district = [cities objectAtIndex:0];
                }else {
                    self.district = @"";
                }
                break;
            case 2:
                if ([areas count] > 0) {
                    self.district = [areas objectAtIndex:row];
                } else {
                    self.district = @"";
                }
                break;
            default:
                break;
        }
    }else{
        switch (component) {
            case 0:
                cities = [[provinces objectAtIndex:row] objectForKey:@"city_name"];
                [self.locatePicker selectRow:0 inComponent:1 animated:YES];
                [self.locatePicker reloadComponent:1];
                
                self.state = [[provinces objectAtIndex:row] objectForKey:@"provice_name"];
                self.city = [cities objectAtIndex:0];
                break;
            case 1:
                self.city = [cities objectAtIndex:row];
                break;
            default:
                break;
        }
    }
    
    if([self.delegate respondsToSelector:@selector(pickerDidChaneStatus:)]) {
        [self.delegate pickerDidChaneStatus:self];
    }

}
#pragma mark - animation

- (void)showInView:(UIView *) view
{
    self.frame = CGRectMake(0, view.frame.size.height, self.frame.size.width, self.frame.size.height);
    [view addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, view.frame.size.height - self.frame.size.height, self.frame.size.width, self.frame.size.height);
    }];
    
}

- (void)cancelPicker
{
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         self.frame = CGRectMake(0, self.frame.origin.y+self.frame.size.height, self.frame.size.width, self.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         [self removeFromSuperview];
                         
                     }];
    
}
@end
