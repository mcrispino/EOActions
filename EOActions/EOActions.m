//
//  EOActions.m
//  EOActions
//
//  Created by Marcos Crispino on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EOActions.h"

@interface EOActions (Handlers)
- (void)handleShowLowPriorityActions;
@end


@implementation EOActions

#pragma mark - Overrides

+ (BOOL)canHandleAction:(id <GXActionExternalObjectDescriptor>)actionExObjDesc {
	if (actionExObjDesc &&
		[@"EOActions" isEqualToString:[actionExObjDesc actionCallObjectName]]) {
		
		NSString *exObjMethod = [actionExObjDesc actionExternalObjectMethod];
		if ([exObjMethod hasPrefix:@"ShowLowPriorityActions"]) {
			return YES;
		}
	}
	return NO;
}

- (void)actionExecuteWithContext:(id<GXActionHandlerContext>)context
						delegate:(id<GXActionHandlerDelegate>)delegate {
	
    [super actionExecuteWithContext:context delegate:delegate];
	
    NSString *exObjMethod = [self.actionExObjDesc actionExternalObjectMethod];
    if ([exObjMethod hasPrefix:@"ShowLowPriorityActions"]) {
        [self handleShowLowPriorityActions];
	}
	else {
		[self onFinishedExecutingWithDefaultError];
	}
}

#pragma mark - Handlers

- (void)handleShowLowPriorityActions {
	// Get the current view controller
	UIViewController *vc = nil;
	id <GXActionHandlerViewController> actionHandlerViewController = nil;
	if ([[self delegate] respondsToSelector:@selector(actionHandlerViewControler:)]) {
		actionHandlerViewController = [[self delegate] actionHandlerViewControler:self];
	}
	if (actionHandlerViewController) {
		vc = [actionHandlerViewController actionHandlerViewController];
	}

    if ([vc isKindOfClass:[GXEntityViewController class]]) {
		[(GXEntityViewController *)vc handleBarButtonMoreActions:[[self actionHandlerContext] actionHandlerContextSender]];
		[self onFinishedExecutingWithSuccess];
		return;
	}
	
	[self onFinishedExecutingWithDefaultError];
}

@end
