//
//  XMPlacemark.m
//  MaptimizeKit
//
//  Created by Oleg Shnitko on 4/22/10.
//  olegshnitko@gmail.com
//  
//  Copyright © 2010 Screen Customs s.r.o. All rights reserved.
//

#import "XMPlacemark.h"
#import "SCRMemoryManagement.h"

@implementation XMPlacemark

@synthesize tile = _tile;
@synthesize data = _data;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate {

	NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
	self = [self initWithCoordinate:coordinate data:data];
	[data release];
	return self;
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate data:(NSMutableDictionary *)data
{
	if (self = [super init])
	{
		_coordinate = coordinate;
		_data = [data retain];
	}
	
	return self;
}

- (void)dealloc
{
	SCR_RELEASE_SAFELY(_data);
	
	[super dealloc];
}

- (CLLocationCoordinate2D)coordinate
{
	return _coordinate;
}


@end
