//
//  XMCondition.m
//  MaptimizeKit
//
//  Created by Oleg Shnitko on 4/23/10.
//  olegshnitko@gmail.com
//
//  Copyright © 2010 Screen Customs s.r.o. All rights reserved.
//

#import "XMCondition.h"
#import "JSON.h"

#import "SCRMemoryManagement.h"

@implementation XMCondition

- (id)initWithFormat:(NSString *)format args:(NSArray *)arguments
{
    
    NSMutableArray *escapedArguments = [NSMutableArray array];
	for (NSUInteger i = 0; i < [arguments count]; i++)
	{
		NSObject *arg = [arguments objectAtIndex:i];
		NSObject *escapedArg = arg;
		
		if ([arg isKindOfClass:[NSNumber class]])
		{
			CFTypeID argTypeId = CFGetTypeID(arg);
			CFTypeID booleanTypeId = CFBooleanGetTypeID();
			if (argTypeId == booleanTypeId)
			{
				NSNumber *number = (NSNumber *)arg;
				if ([number boolValue])
				{
					escapedArg = @"true";
				}
				else
				{
					escapedArg = @"false";
				}
			}
		}
		else if ([arg isKindOfClass:[NSDate class]])
		{
			NSDate *date = (NSDate *)arg;
			NSTimeInterval interval = [date timeIntervalSince1970];
			NSNumber *number = @(interval);
			escapedArg = number;
		}
		else if ([arg isKindOfClass:[NSArray class]])
		{
			NSString *arrayString = [arg JSONRepresentation];
			escapedArg = arrayString;
		}
		else if ([arg isKindOfClass:[NSString class]])
		{
			NSString *escapedString = [NSString stringWithFormat:@"\"%@\"", arg];
			escapedArg = escapedString;
		}
		
		[escapedArguments addObject:escapedArg];
	}
	
	if (self = [super init])
	{
		if (!arguments)
		{
			_string = [format copy];
		}
		else
		{
            __unsafe_unretained id  *va_list = (__unsafe_unretained id  *) calloc(1UL, sizeof(id) * escapedArguments.count);
            for (NSInteger i = 0; i < escapedArguments.count; i++) {
                va_list[i] = arguments[i];
            }
            
            _string = [[NSString alloc] initWithFormat:format, *va_list];
            free (va_list);
		}
	}
	
	return self;
}

- (void)dealloc
{
	SCR_RELEASE_SAFELY(_string);
	[super dealloc];
}

- (void)mergeCondition:(XMCondition *)condition withOperator:(NSString *)operator
{
	if ([_string isEqualToString:@""])
	{
		[_string release];
		_string = [[NSString alloc] initWithFormat:@"%@", condition];
	}
	else
	{
		NSString *newString = [[NSString alloc] initWithFormat:@"(%@) %@ (%@)", _string, operator, condition];
		[_string release];
		_string = newString;
	}
}

- (void)appendAnd:(XMCondition *)condition
{
	[self mergeCondition:condition withOperator:@"AND"];
}

- (void)appendOr:(XMCondition *)condition
{
	[self mergeCondition:condition withOperator:@"OR"];
}

- (BOOL)isEqual:(id)object
{
	return [_string isEqualToString:[object description]];
}

- (NSString *)description
{
	return _string;
}

@end
