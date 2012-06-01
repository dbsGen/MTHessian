//
//  MTHessian.m
//  DateManager
//
//  Created by apple on 12-4-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MTHessian.h"
#import "CWDistantHessianObject+Private.h"
#import "CWHessianArchiver+Private.h"

@implementation MTHessian

- (id)init
{
    return self;
}

-(void)forwardInvocation:(NSInvocation *)invocation;
{
	NSData* requestData = [self archivedDataForInvocation:invocation];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:self.URL];
    request.timeOutSeconds = 12;
    [request setRequestMethod:@"POST"];
    [request appendPostData:requestData];
    [request addRequestHeader:@"Content-type" value:@"text/xml"];
    
    [self performSelector:@selector(setReturnValue:invocation:) 
               withObject:request withObject:invocation];
}

- (ASIHTTPRequest *)requestFor:(NSString*)methord param:(NSArray*)param
{
    NSMutableData* data = [NSMutableData data];
    CWHessianArchiver* archiver = [[[CWHessianArchiver alloc] initWithConnection:self.connection mutableData:data] autorelease];
    [archiver writeChar:'c'];
    [archiver writeChar:0x01];
    [archiver writeChar:0x00];
    [self writeHeadersToArchiver:archiver];
    [archiver writeChar:'m'];
    
    [archiver writeString:methord withTag:'S'];
    int count = [param count];
    for (int index = 0; index < count; index++) {
        id obj = [param objectAtIndex:index];
        [archiver writeTypedObject:obj];
    }
    [archiver writeChar:'z'];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:self.URL];
    request.timeOutSeconds = 12;
    [request setRequestMethod:@"POST"];
    [request appendPostData:data];
    [request addRequestHeader:@"Content-type" value:@"text/xml"];
    
    return request;
    
}

@end
