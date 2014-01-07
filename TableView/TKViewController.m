//
//  TKViewController.m
//  TableView
//
//  Created by Takaaki Kakinuma on 1/7/14.
//  Copyright (c) 2014 Takaaki Kakinuma. All rights reserved.
//

#import "TKViewController.h"

@interface TKViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) NSMutableArray *items;

@property (nonatomic) UIView *gridView;

@end

@implementation TKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    [self.view addSubview:self.gridView];
    [self.view addSubview:self.tableView];
}

- (UIView *)gridView {
    if (!_gridView) {
        CGFloat height = self.view.bounds.size.height;
        _gridView = [[UIView alloc] initWithFrame:CGRectMake(0, height/2 - 100/2, 320, 100)];
        _gridView.backgroundColor = [UIColor clearColor];
        _gridView.layer.borderColor = [UIColor redColor].CGColor;
        _gridView.layer.borderWidth = 1;
    }
    return _gridView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.backgroundView = nil;
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (NSMutableArray *)items {
    if (!_items) {
        _items = @[].mutableCopy;

        for (int i = 0; i < 100; i++) {
            _items[i] = [NSString stringWithFormat:@"%d", i];
        }
    }
    return _items;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        cell.backgroundView = nil;
        cell.contentView.backgroundColor = [UIColor clearColor];
    }

    cell.textLabel.text = self.items[indexPath.row];

    return cell;
}

//===========================================================================================================
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for (UITableViewCell *cell in [self.tableView visibleCells]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        CGRect rect = cell.frame;
        CGPoint offset =  self.tableView.contentOffset;
        rect.origin.x = rect.origin.x - offset.x;
        rect.origin.y = rect.origin.y - offset.y;
        NSLog(@"indexPath:%d, Rect:%@", indexPath.row, NSStringFromCGRect(rect));
        
        if (CGRectIntersectsRect(rect, self.gridView.frame)) {
            cell.textLabel.textColor = [UIColor blueColor];
        } else {
            cell.textLabel.textColor = [UIColor blackColor];
        }
    }
}
//===========================================================================================================

@end
