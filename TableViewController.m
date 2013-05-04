//
//  TableViewController.m
//  BlogReader2
//
//  Created by Class Account on 3/30/13.
//  Copyright (c) 2013 Kush Agrawal. All rights reserved.
//

#import "TableViewController.h"
#import "BlogPost.h"
#import "DetailViewController.h"


@interface TableViewController ()
-(IBAction)refresh:(id)sender;


@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

 
    BlogPost *blogPost = [[BlogPost alloc] init];
    
    blogPost.title = @"some title";
    blogPost.author = @"some author";
    
    
    
    NSURL *blogURL2 = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/user_timeline.json?screen_name=jack&include_entities=t&include_rts=t"];
    NSData *jsonData2 = [NSData dataWithContentsOfURL:blogURL2];
    
    NSError *error2 = nil;
    
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:jsonData2 options:0 error:&error2];
    
    self.blogPosts2 = jsonArray;
    
//    printf("%i",self.blogPosts2.count);
    
    
}

-(IBAction)refresh:(id)sender{
    [self viewDidLoad];
    
    [self.tableView reloadData];
    
}

    


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return self.blogPosts2.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *blogPost = [self.blogPosts2 objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [blogPost valueForKey:@"text"];
    
    NSString *detailed = [[NSString alloc] initWithString:[[blogPost valueForKey:@"user"] valueForKey:@"name"]];
    detailed = [detailed stringByAppendingString:@" "];
    detailed = [detailed stringByAppendingString:[blogPost valueForKey:@"created_at"]];
    
    cell.detailTextLabel.text = detailed;
    
    NSURL *imageURL = [NSURL URLWithString:[[blogPost valueForKey:@"user"] valueForKey:@"profile_image_url"]];
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
    
    cell.imageView.image = image;
    
    

    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {

        NSIndexPath *indexPath =[self.tableView indexPathForSelectedRow];
        
        NSDictionary *blogPost = [self.blogPosts2 objectAtIndex:indexPath.row];
   
        
        NSString *someOtherString = [NSString stringWithFormat: @"https://twitter.com/jack/status/%@", [blogPost valueForKey:@"id_str"]];
        
        [[segue destinationViewController] setUrlstr:someOtherString];
 
          
        
                      }
}

@end
