//
//  MTHessian.h
//  DateManager
//
//  Created by apple on 12-4-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CWDistantHessianObject.h"
#import "ASIHTTPRequest.h"

@interface CWDistantHessianObject(add)

- (id)unarchiveData:(NSData*)data;

@end

@interface MTHessian : CWDistantHessianObject {
    
}
- (id)init;

- (ASIHTTPRequest *)requestFor:(NSString*)methord param:(NSArray*)param;

@end
