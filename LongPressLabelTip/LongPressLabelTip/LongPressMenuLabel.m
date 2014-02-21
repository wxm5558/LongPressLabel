//
//  LongPressMenuLabel.m
//  Jule
//
//  Created by xxx on 14-2-21.
//  Copyright (c) 2014年 xxx. All rights reserved.
//

#import "LongPressMenuLabel.h"

@interface LongPressMenuLabel()
@end

@implementation LongPressMenuLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
	{
		[self initSelf];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if(self)
	{
		[self initSelf];
	}
	return self;
}

- (void)awakeFromNib
{
	[super awakeFromNib];
	[self.gestureRecognizers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
		
		if ([obj isKindOfClass:UILongPressGestureRecognizer.class])
		{
			[self initSelf];
			*stop = YES;
		}
	}];
}

- (void)initSelf
{
	self.userInteractionEnabled = YES;
	UILongPressGestureRecognizer*longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
	[self addGestureRecognizer:longPress];
}

- (BOOL)canBecomeFirstResponder
{
	return YES;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    return (action == @selector(copy:));
}

-(void)copy:(id)sender
{
	if(self.tipBlock)
	{
		self.tipBlock();
	}
}

- (void)longPressed:(id)sender
{
	[self doActionWithTipBlock:self.tipBlock];
}
	
- (void)doActionWithTipBlock:(TipBlock)tipBlock
{
	[self becomeFirstResponder];
	UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copy:)];
	[[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
	[[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
	[[UIMenuController sharedMenuController] setMenuVisible:YES animated: YES];
}

@end
