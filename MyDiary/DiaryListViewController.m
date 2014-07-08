//
//  DiaryListViewController.m
//  MyDiary
//
//  Created by 刘铭 on 12-11-14.
//  Copyright (c) 2012年 刘铭. All rights reserved.
//

#import "DiaryListViewController.h"
#import "DetailDiaryViewController.h"
#import "Diary.h"

@interface DiaryListViewController ()

@end

@implementation DiaryListViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"DetailDiary"]) {
        // 获取表格中被选择的行
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSInteger row = [indexPath row];
        
        // 获取数组中选中行的Diary对象
        Diary *diary = [self.diaries objectAtIndex:row];
        
        // 通过segue获取被故事板初始化的对象，然后将数据传递给它
        DetailDiaryViewController *detailDiaryViewController = (DetailDiaryViewController *)[segue destinationViewController];
        detailDiaryViewController.diary = diary;
    }
    
    if ([segue.identifier isEqualToString:@"AddDiary"]) {
        CreateDiaryViewController *createDiaryViewController = (CreateDiaryViewController *)[segue destinationViewController];
        // 设置createDiaryViewController对象的delegate属性
        createDiaryViewController.delegate = self;
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    Diary *a = [[Diary alloc] initWithTitle:@"第一篇日记"
                                    content:@"第一篇日记的内容。"];
    Diary *b = [[Diary alloc] initWithTitle:@"第二篇日记"
                                    content:@"第二篇日记的内容。"];
    Diary *c = [[Diary alloc] initWithTitle:@"第三篇日记"
                                    content:@"第三篇日记的内容。"];
    Diary *d = [[Diary alloc] initWithTitle:@"第四篇日记"
                                    content:@"第四篇日记的内容。"];
    Diary *e = [[Diary alloc] initWithTitle:@"第五篇日记"
                                    content:@"第五篇日记的内容。"];
    self.diaries = [NSMutableArray arrayWithObjects:a, b, c, d, e, nil];
    NSLog(@"diaries 的元素有：%@", self.diaries);
    
    [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
    
    // 设置导航栏的标题
    [[self navigationItem] setTitle:@"日记列表"];
}

-(void)addNewDiary:(id)sender
{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Create Diary View Controller Delegate
-(void)createDiaryViewControllerDidCancel:(CreateDiaryViewController *)createDiaryController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)createDiaryViewController:(CreateDiaryViewController *)createDiaryController
                didSaveWithDiary:(Diary *)theDiary
{
    Diary *diary = theDiary;
    NSLog(@"title:%@, content:%@",diary.title, diary.content);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.diaries addObject:diary];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.diaries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // CellIdentifier所指向的字符串必须与故事板中Table View Cell对象的Indentifier属性一致
    static NSString *CellIdentifier = @"DiaryCell";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // 获取与指定单元格相对应的日记数组中的条目
    Diary *diary = [self.diaries objectAtIndex:indexPath.row];
    
    // 设置新闻条目的标题
    cell.textLabel.text = [diary title];
    
    // 设置新闻条目的副标题，这里显示的是新闻创建的日期和时间
    cell.detailTextLabel.text = [[diary dateCreate] description];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
