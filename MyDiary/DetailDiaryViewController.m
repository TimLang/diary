//
//  DetailDiaryViewController.m
//  MyDiary
//
//  Created by 刘铭 on 12-11-14.
//  Copyright (c) 2012年 刘铭. All rights reserved.
//

#import "DetailDiaryViewController.h"
#import "ImageStore.h"

@interface DetailDiaryViewController ()

@end

@implementation DetailDiaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.diaryTitle.text = self.diary.title;
    self.diaryContent.text = self.diary.content;
    
    NSString *photoKey = [self.diary photoKey];
    
    if (photoKey) {
        UIImage *imageToDisplay = [[ImageStore defaultImageStore]
                                   imageForKey:photoKey];
        [self.diaryPhoto setImage:imageToDisplay];
    }else {
        [self.diaryPhoto setImage:nil];
    }
    
    // 修改导航栏标题为“日记内容”
    [[self navigationItem] setTitle:@"日记内容"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
