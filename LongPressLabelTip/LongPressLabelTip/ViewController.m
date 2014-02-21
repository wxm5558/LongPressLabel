//
//  ViewController.m
//  LongPressLabelTip
//
//  Created by xiaomanwang on 14-2-21.
//  Copyright (c) 2014年 xiaomanwang. All rights reserved.
//

#import "ViewController.h"
#import "LongPressMenuLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	LongPressMenuLabel*label = [[LongPressMenuLabel alloc] initWithFrame:CGRectMake(30, 100, 200, 30)];
	label.textAlignment = NSTextAlignmentCenter;
	label.font = [UIFont systemFontOfSize:20];
	label.text = @"Long Press me";
	[self.view addSubview:label];
	
	__weak UILabel*labelTemp = label;
	[label setTipBlock:^{
		UIPasteboard *pb = [UIPasteboard generalPasteboard];
		pb.string = labelTemp.text;
		[[[UIAlertView alloc] initWithTitle:@"tip" message:@"copyed" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
	}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
