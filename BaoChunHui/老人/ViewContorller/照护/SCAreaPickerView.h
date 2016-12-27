//
//  SCAreaPickerView.h
//  BaoChunHui
//
//  Created by BCH on 2016/12/22.
//  Copyright © 2016年 xudogn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    SCAreaPickerWithStateAndCity,
    SCAreaPickerWithStateAndCityAndDistrict
} SCAreaPickerStyle;

@class SCAreaPickerView;
@protocol SCAreaPickerViewDataSource <NSObject>

- (NSArray *)areaPickerData:(SCAreaPickerView *)picker;

@end

@protocol SCAreaPickerViewDelegate <NSObject>

@optional
- (void)pickerDidChaneStatus:(SCAreaPickerView *)picker;

@end
@interface SCAreaPickerView : UIView<UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic,weak) id<SCAreaPickerViewDataSource> dataSource;
@property (nonatomic) id<SCAreaPickerViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIPickerView *locatePicker;
@property (nonatomic) SCAreaPickerStyle pickerStyle;
- (id)initWithStyle:(SCAreaPickerStyle)pickerStyle withDelegate:(id <SCAreaPickerViewDelegate>)delegate andDataSource:(id<SCAreaPickerViewDataSource>)dataSource;
- (void)showInView:(UIView *)view;
- (void)cancelPicker;
//=====
@property (copy, nonatomic) NSString *country;
@property (copy, nonatomic) NSString *state;
@property (copy, nonatomic) NSString *city;
@property (copy, nonatomic) NSString *district;
@property (copy, nonatomic) NSString *street;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;

@end
