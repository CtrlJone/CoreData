//
//  SetViewController.m
//  CoreData
//
//  Created by Jone ji on 15/4/21.
//  Copyright (c) 2015年 Jone ji. All rights reserved.
//

#import "SetViewController.h"
#import "CoreDataManager.h"

@interface SetViewController ()

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIButton *changeBtn;
@property (weak, nonatomic) IBOutlet UIButton *delBtn;

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickEnd)];
    [self.view addGestureRecognizer:tap];
    
    [self loadUI];
}

- (void) loadUI
{
    if (_type == ADD) {
        _changeBtn.hidden = YES;
        _delBtn.hidden = YES;
    }
    if (_type == CHANGE) {
        _saveBtn.hidden = YES;
        
        _tfName.text = _user.name;
        _tfSex.text = _user.sex;
        _tfAge.text = [NSString stringWithFormat:@"%d", _user.age.intValue];
    }
}

- (void) clickEnd
{
    [self.view endEditing:YES];
}

#pragma mark - Action
- (IBAction)clickAdd:(id)sender {
    if ([_tfName.text  isEqual: @""] || [_tfSex.text  isEqual: @""] || [_tfAge.text  isEqual: @""]) {
        [self showAlert];
        return;
    }
    
    _user = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:[CoreDataManager sharedCoreDataManager].managedObjContext];
    [_user setName:self.tfName.text];
    [_user setSex:self.tfSex.text];
    [_user setAge:@([self.tfAge.text integerValue])];
    NSError *error = nil;
    
//    托管对象准备好后，调用托管对象上下文的save方法将数据写入数据库
    BOOL isSaveSuccess = [[CoreDataManager sharedCoreDataManager].managedObjContext save:&error];
    if (!isSaveSuccess) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else
    {
        NSLog(@"Save successFull");
    }
    
}


- (IBAction)clickChange:(id)sender {
    if ([_tfName.text  isEqual: @""] || [_tfSex.text  isEqual: @""] || [_tfAge.text  isEqual: @""]) {
        [self showAlert];
        return;
    }
//    对同一个实体做数据改变
    [_user setName:self.tfName.text];
    [_user setSex:self.tfSex.text];
    [_user setAge:@([self.tfAge.text integerValue])];
    NSError *error = nil;
    
    //    托管对象准备好后，调用托管对象上下文的save方法将数据写入数据库
    BOOL isSaveSuccess = [[CoreDataManager sharedCoreDataManager].managedObjContext save:&error];
    if (!isSaveSuccess) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else
    {
        NSLog(@"Change successFull");
    }

}

- (IBAction)clickDel:(id)sender {
    
    [[CoreDataManager sharedCoreDataManager].managedObjContext deleteObject:_user];
    
    NSError *error = nil;
    
    //    托管对象准备好后，调用托管对象上下文的save方法将数据写入数据库
    BOOL isSaveSuccess = [[CoreDataManager sharedCoreDataManager].managedObjContext save:&error];
    if (!isSaveSuccess) {
        NSLog(@"Error: %@,%@",error,[error userInfo]);
    }else
    {
        NSLog(@"del successFull");
        
        _tfName.text = @"";
        _tfSex.text = @"";
        _tfAge.text = @"";
    }
}

- (void) showAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"请填满" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
