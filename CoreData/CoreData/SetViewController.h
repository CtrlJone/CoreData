//
//  SetViewController.h
//  CoreData
//
//  Created by Jone ji on 15/4/21.
//  Copyright (c) 2015年 Jone ji. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataManager.h"
#import "User.h"


@interface SetViewController : UIViewController

typedef enum : NSUInteger {
    ADD,
    CHANGE
} Type;

@property (weak, nonatomic) IBOutlet UITextField *tfName;

@property (weak, nonatomic) IBOutlet UITextField *tfSex;

@property (weak, nonatomic) IBOutlet UITextField *tfAge;

@property (nonatomic, assign) Type type;
@property (nonatomic, strong) User *user;

@end
