//
//  GXCustomExternalObjectsMapper.m
//  SDPanel1
//
//  Created by Marcos Crispino on 20/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GXCustomExternalObjectsMapper.h"

@implementation GXCustomExternalObjectsMapper

- (NSString *)externalObjectClassNameForObjectName:(NSString *)objName {
	if ([objName isEqualToString:@"EOActions"]) {
		return @"EOActions";
	}
	
	return nil;
}

@end
