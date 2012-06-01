//
//  MTHessianConnection.m
//  DateManager
//
//  Created by apple on 12-4-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MTHessianConnection.h"
#import "CWDistantHessianObject+Private.h"
#import "MTHessian.h"

@implementation MTHessianConnection

+(id)proxyWithURL:(NSURL*)URL protocol:(Protocol*)aProtocol;
{
	MTHessian* proxy = nil;
	MTHessianConnection* connection = [[self alloc] initWithHessianVersion:CWHessianVersion1_00];
	if (connection) {
        proxy = [connection proxyWithURL:URL protocol:aProtocol];
        if (proxy) {
            proxy.connection = connection;
        }
        [connection release];
    }
    return proxy;
}

-(id)proxyWithURL:(NSURL*)URL protocol:(Protocol*)aProtocol;
{
	MTHessian* proxy = [MTHessian alloc];
    [proxy initWithConnection:self URL:URL protocol:aProtocol];
    return [proxy autorelease];
}

@end
