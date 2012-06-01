MTHessian
=========

use MTHessian as the original hessianKit.first we get the connection.

    #define IMProxyEx [MTHessianConnection proxyWithURL:[NSURL\
                                        URLWithString:IMHessianAPI]\
                                        protocol:@protocol(DMHessianProxy)]
then we have two ways to get the request.

1.by the method name:

    ASIHTTPRequest *request = [IMProxyEx requestFor:@"methodName"     
                                param:[NSArray arrayWithObjects:
                                      [NSNumber numberWithInt:intParam],
                                      stringParam,nil]];
2.by the reflex, like the original hessianKit,but it return a request:

    ASIHTTPRequest *request = [IMProxyEx methodName:singleParam];