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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tlacitkaKariet;
@property (strong,nonatomic) PorovnavaciaKartovaHra *hra;
@property (weak, nonatomic) IBOutlet UILabel *skorePopisok;
@property (weak, nonatomic) IBOutlet UILabel *poslednyTahPopisok;

@end

@implementation ViewController

- (PorovnavaciaKartovaHra *)hra {
    if(!_hra) _hra = [[PorovnavaciaKartovaHra alloc] initWithPocetKariet:[self.tlacitkaKariet count]
        pouzitimBalickahKariet:[[BalicekHracichKariet alloc] init]];
    return _hra;
}

- (void)obnovUI {
    for (UIButton *tlacitko in self.tlacitkaKariet) {
        Karta *karta = [self.hra kartaNaIndexe:[self.tlacitkaKariet indexOfObject:tlacitko]];
        [tlacitko setTitle:karta.obsah forState:UIControlStateSelected];
        //[tlacitko setTitle:karta.obsah forState:UIControlStateSelected | UIControlStateDisabled];
        tlacitko.selected = karta.otocenaCelnouStranou;
        //tlacitko.enabled = !karta.hratelna;
        tlacitko.alpha = (karta.nehratelna ? 0.3 : 1.0);
        self.poslednyTahPopisok.text = self.hra.vysledokPoslednehoOtocenia;
    }
}

- (void)setTlacitkaKariet:(NSArray *)tlacitkaKariet {
    _tlacitkaKariet = tlacitkaKariet;
    [self obnovUI];
}

- (IBAction)otocKartu:(UIButton *)tlacitko {
    tlacitko.selected = !tlacitko.selected;
    [self.hra otocKartuNaIndexe:[self.tlacitkaKariet indexOfObject:tlacitko]];
    self.pocetOtoceni++;
    [self obnovUI];
    self.skorePopisok.text = [NSString stringWithFormat:@"Skore: %d",self.hra.skore];
}

-(void)setPocetOtoceni:(int)pocetOtoceni {
    _pocetOtoceni = pocetOtoceni;
    self.pocetOtoceniPopisok.text = [NSString stringWithFormat:@"Pocet otoceni: %d",self.pocetOtoceni];
}


@end
