//
//  ViewController.m
//  getIP
//
//  Created by Lorne Flindall on 2016-09-14.
//  Copyright © 2016 Lorne Flindall. All rights reserved.
//

#import "ViewController.h"
#include <ifaddrs.h>
#include <arpa/inet.h>


@interface ViewController ()
@property (nonatomic, weak) IBOutlet UILabel *messageLabel;

@end

@implementation ViewController

@synthesize messageLabel;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Create the label object and set its frame
    //UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(460, 500, 400, 50)];
    //label.textColor = [UIColor redColor];
    //label.textColor = [UIColor greenColor];
  
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0)
    {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL)
        {
            if(temp_addr->ifa_addr->sa_family == AF_INET)
            {
                // Get NSString from C String
                address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    
    // Free memory
    freeifaddrs(interfaces);
    
    

    // Set the text property of the label
    messageLabel.text = address;
    messageLabel.textColor = [UIColor redColor];
    NSLog(@"IPAddress: %@",address);
    
    
    //  label.text = address;
    // Add the label object to the view
  //  [self.view addSubview:label];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
