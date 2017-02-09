//
//  ViewController.m
//  CeckColor
//
//  Created by 美迅 on 16/9/21.
//  Copyright © 2016年 ShouQu. All rights reserved.
//

#import "ViewController.h"
#import "IPADViewController.h"
#import "WLTScrollview.h"
@interface ViewController ()

@end

@implementation ViewController{
    
    UIImageView * image ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
  //BOOL ret =  [UIColor checkBorderWhite:[UIImage imageNamed:@"10"]];
    
    
     //NSLog(@"%@", [UIColor getBorderWhite:[UIImage imageNamed:@"999.jpg"]]);
    
    
   image = [[UIImageView alloc]initWithFrame:CGRectMake(30, 20, 300, 300)];
    image.image =[UIColor drawImage:[UIImage imageNamed:@"000.jpg"]];
    
    [self.view addSubview:image];
    
    
    
    
//
//    UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(20, 100, 100, 100)];
//    
//    imageview.image =[UIImage imageNamed:@"10"];
//    
//    [self.view addSubview:imageview];
//    
//    if (ret) {
//        
//        imageview.layer.masksToBounds = YES;
//        
//        imageview.layer.borderColor = [UIColor blackColor].CGColor;
//        
//        imageview.layer.borderWidth = 1;
//        
//        imageview.layer.cornerRadius = 10;
//    }
    
//    
//    
//    
//    
//    NSLog(@"==================%ld",(long)ret);
    
//    WLTScrollview *scr = [[WLTScrollview alloc]initWithFrame:self.view.frame];
//    
//    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    view.backgroundColor = [UIColor redColor];
//    
//    [scr addSubview:view];
//    
//    scr.contentSize = CGSizeMake(self.view.frame.size.width*2, self.view.frame.size.height);
//    [self.view addSubview:scr];
    
    
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView transitionWithView:image duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        image.image = [UIImage imageNamed:@"999.jpg"];
    } completion:nil];

    
//    IPADViewController *ipad = [[IPADViewController alloc]initWithNibName:@"IPADViewController~IPAD" bundle:nil];
//    
//    
//    
//    
//    [self presentViewController:ipad animated:YES completion:nil];
    
    
    
}
@end
