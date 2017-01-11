//
//  AVViewController.m
//  Some
//
//  Created by mac on 15/12/21.
//  Copyright © 2015年 mac. All rights reserved.
//

#import "AVViewController.h"
#import "VideoView.h"

@interface AVViewController () <VideoSomeDelegate>

@property (nonatomic ,strong) VideoView *videoView;

@property (nonatomic ,strong) NSMutableArray<NSLayoutConstraint *> *array;

@property (nonatomic ,strong) UISlider *videoSlider;

@property (nonatomic ,strong) NSMutableArray<NSLayoutConstraint *> *sliderArray;

@end

@implementation AVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initVideoView];
}

- (void)initVideoView {
    
    NSString *path = @"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4";
    @autoreleasepool {
        _videoView = [[VideoView alloc] initWithUrl:path delegate:self];
        _videoView.someDelegate = self;
        [_videoView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.view addSubview:_videoView];
    }
    
    [self initVideoSlider];
    
    if (self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
        [self installLandspace];
    } else {
        [self installVertical];
    }
}
- (void)installVertical {
    if (_array != nil) {
        [self.view removeConstraints:_array];
        [_array removeAllObjects];
        [self.view removeConstraints:_sliderArray];
        [_sliderArray removeAllObjects];
    } else {
        _array = [NSMutableArray array];
        _sliderArray = [NSMutableArray array];
    }
    id topGuide = self.topLayoutGuide;
    NSDictionary *dic = @{@"top":@100,@"height":@180,@"edge":@20,@"space":@80};
    [_array addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_videoView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_videoView)]];
    [_array addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(edge)-[_videoSlider]-(edge)-|" options:0 metrics:dic views:NSDictionaryOfVariableBindings(_videoSlider)]];
    [_array addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topGuide]-(top)-[_videoView(==height)]-(space)-[_videoSlider]" options:0 metrics:dic views:NSDictionaryOfVariableBindings(_videoView,topGuide,_videoSlider)]];
    [self.view addConstraints:_array];
    
    
    
}
- (void)installLandspace {
    if (_array != nil) {
        
        [self.view removeConstraints:_array];
        [_array removeAllObjects];
        
        [self.view removeConstraints:_sliderArray];
        [_sliderArray removeAllObjects];
    } else {
        
        _array = [NSMutableArray array];
        _sliderArray = [NSMutableArray array];
    }
    
    id topGuide = self.topLayoutGuide;
    NSDictionary *dic = @{@"edge":@20,@"space":@30};
    
    [_array addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_videoView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_videoView)]];
    [_array addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topGuide][_videoView]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_videoView,topGuide)]];
    [self.view addConstraints:_array];
    
    [_sliderArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(edge)-[_videoSlider]-(edge)-|" options:0 metrics:dic views:NSDictionaryOfVariableBindings(_videoSlider)]];
    [_sliderArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_videoSlider]-(space)-|" options:0 metrics:dic views:NSDictionaryOfVariableBindings(_videoSlider)]];
    [self.view addConstraints:_sliderArray];
}
- (void)initVideoSlider {
    
    _videoSlider = [[UISlider alloc] init];
    [_videoSlider setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_videoSlider setThumbImage:[UIImage imageNamed:@"sliderButton"] forState:UIControlStateNormal];
    [_videoSlider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_videoSlider];
    
}
- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {

    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context) {
        
        if (newCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
            [self installLandspace];
        } else {
            [self installVertical];
        }
        [self.view setNeedsLayout];
    } completion:nil];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)sliderValueChange:(UISlider *)slider {
    
    [_videoView seekValue:slider.value];
    
}
- (void)dealloc {
    [_videoView stop];
    _videoView = nil;
    NSLog(@"dealloc of VC");
}
#pragma mark -
- (void)flushCurrentTime:(NSString *)timeString sliderValue:(float)sliderValue {
    _videoSlider.value = sliderValue;
}

- (instancetype)initWithURL:(NSURL *)url{
    self = [super init];
    if (self) {
        self.url = url;
    }
    return self;
}





@end
