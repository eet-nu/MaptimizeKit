//
//  XMTileInfo.m
//  MaptimizeKit
//
//  Created by Oleg Shnitko on 5/20/10.
//  olegshnitko@gmail.com
//  
//  Copyright © 2010 Screen Customs s.r.o. All rights reserved.
//

#import "XMTileInfo.h"

#import "SCRMemoryManagement.h"

@implementation XMTileInfo

@synthesize tile = _tile;
@synthesize state = _state;
@synthesize graph = _graph;
@synthesize data = _data;

- (void)dealloc
{
	SCR_RELEASE_SAFELY(_graph);
	SCR_RELEASE_SAFELY(_data);
	
	[super dealloc];
}

@end
