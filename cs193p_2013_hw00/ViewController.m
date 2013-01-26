//
//  ViewController.m
//  cs193p_2013_hw00
//
//  Created by Marek Hrušovský on 1/25/13.
//  Copyright (c) 2013 Marek Hrušovský. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *pocetOtoceniPopisok;
@property (nonatomic) int pocetOtoceni;

@end

@implementation ViewController

- (IBAction)otocKartu:(UIButton *)sender {
  sender.selected = !sender.isSelected;
  self.pocetOtoceni++;
}

-(void)setPocetOtoceni:(int)pocetOtoceni {
  _pocetOtoceni = pocetOtoceni;
  self.pocetOtoceniPopisok.text = [NSString stringWithFormat:@"Pocet otoceni: %d",self.pocetOtoceni];
}

@end
