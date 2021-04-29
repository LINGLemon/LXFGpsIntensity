//
//  ViewController.m
//  LXFGpsIntensity
//
//  Created by 凌煊峰 on 2021/4/28.
//

#import "ViewController.h"
#import "LXFGPSView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.containerView addSubview:[LXFGPSView gpsView]];
}


@end
