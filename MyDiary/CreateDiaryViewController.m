//
//  CreateDiaryViewController.m
//  MyDiary
//
//  Created by 刘 铭 on 12-11-15.
//  Copyright (c) 2012年 刘铭. All rights reserved.
//

#import "CreateDiaryViewController.h"

@interface CreateDiaryViewController ()

@end

@implementation CreateDiaryViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"TakePicture"]) {
        CameraViewController *cameraViewController = (CameraViewController *)[segue destinationViewController];
        // 设置createDiaryViewController对象的delegate属性
        cameraViewController.delegate = self;
        
        cameraViewController.diary = self.diary;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.diary = [[Diary alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.diary = [[Diary alloc] init];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy年M月d日 'at' h:mm a"];
    NSString* date = [df stringFromDate: [NSDate date]];
    self.diaryDate.text = date;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self.delegate createDiaryViewControllerDidCancel:self];
}

- (IBAction)saveDiary:(id)sender {
    self.diary.title = self.diaryTitle.text;
    self.diary.content = self.diaryContent.text;
    
    [self.delegate createDiaryViewController:self didSaveWithDiary:self.diary];
}

#pragma mark - camera view controller Delegate
-(void)cameraViewControllerDidReturn:(CameraViewController *)cameraViewController
{
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}


#pragma mark - Text Field Delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
