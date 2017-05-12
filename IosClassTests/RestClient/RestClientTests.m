//
//  RestClientTests.m
//  IosClass
//
//  Created by admin on 2017/5/12.
//  Copyright © 2017年 Brian. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "RestClient.h"
#import "RestRequest.h"

@interface RestClientTests : XCTestCase

@end

@implementation RestClientTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPath {
    id authenticator = [OCMockObject mockForProtocol:@protocol(RequestAuthenticator)];
    RestClient* client = [[RestClient alloc] initWithEndPoint:@"http://localhost/ws" andAuthenticator:authenticator];
    
    [[authenticator expect] authenticate:[OCMArg checkWithBlock:^BOOL(id obj) {
        return [@"http://localhost/ws/accounts" isEqualToString:((RestRequest*)obj).completeURL];
    }]];
    RestRequest* request = [client path:@"/accounts"];
    XCTAssertNotNil(request);
    [authenticator verify];
}


- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
