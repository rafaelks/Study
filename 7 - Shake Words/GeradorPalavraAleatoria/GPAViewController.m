//
//  GPAViewController.m
//  GeradorPalavraAleatoria
//
//  Created by Gabriel Tondin on 17/12/13.
//  Copyright (c) 2013 otondin. All rights reserved.
//

#import "GPAViewController.h"
#import "Lexicontext.h"

@interface GPAViewController ()
@property (weak, nonatomic) IBOutlet UITextField *silabas;
@property (weak, nonatomic) IBOutlet UIButton *gerarPalavra;
@property (weak, nonatomic) IBOutlet UILabel *palavraAleatoria;
@property (weak, nonatomic) IBOutlet UIStepper *numSilabas;

@end

@implementation GPAViewController

- (IBAction)controleSilabas:(UIStepper *)sender
{
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (event.subtype == UIEventSubtypeMotionShake)
    {
        
        int validarSilabas = [self.silabas.text intValue] ;
        NSArray *palavras1 = @[@"Olá", @"Oi", @"Tchau", @"Foo", @"Bar"];
        NSArray *palavras2 = @[@"Mesa", @"Aula", @"Copa", @"Maçã", @"Mundo"];
        NSArray *palavras3 = @[@"Calorão", @"Turista", @"Programar", @"Código", @"Cadeira"];
        if ([self.silabas.text isEqualToString:@""])
            self.palavraAleatoria.text = @"Informe o número de sílabas entre 1 e 3!";
        if ([self.silabas.text isEqualToString:@"1"])
            self.palavraAleatoria.text = [palavras1 objectAtIndex:rand() % 5];
        if ([self.silabas.text isEqualToString:@"2"])
            self.palavraAleatoria.text = [palavras2 objectAtIndex:rand() % 5];
        if ([self.silabas.text isEqualToString:@"3"])
            self.palavraAleatoria.text = [palavras3 objectAtIndex:rand() % 5];
        if (validarSilabas > 3)
            self.palavraAleatoria.text = @"Atenção, você deve informar o número de sílabas entre 1 e 3!";
        
        [self.palavraAleatoria setHidden:NO];
        [self.view endEditing:YES];
    }
    
    if ([super respondsToSelector:@selector(motionEnded:withEvent:)])
        [super motionEnded:motion withEvent:event];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (IBAction)gerarPalavraAleatoria:(UIButton *)sender {
    
//    Lexicontext *dic = [Lexicontext sharedDictionary];
//    NSString *palavra = [dic randomWord];
//    NSLog(@"%@", palavra);
    
    int validarSilabas = [self.silabas.text intValue] ;
    NSArray *palavras1 = @[@"Olá", @"Oi", @"Tchau", @"Foo", @"Bar"];
    NSArray *palavras2 = @[@"Babá", @"Bebê", @"Foobar", @"Pato", @"Linha"];
    NSArray *palavras3 = @[@"Tubarão", @"Turista", @"Programar", @"Código"];
    if ([self.silabas.text isEqualToString:@""])
        self.palavraAleatoria.text = @"Informe o número de sílabas entre 1 e 3!";
    if ([self.silabas.text isEqualToString:@"1"])
        self.palavraAleatoria.text = [palavras1 objectAtIndex:rand() % 2];
    if ([self.silabas.text isEqualToString:@"2"])
        self.palavraAleatoria.text = [palavras2 objectAtIndex:rand() % 2];
    if ([self.silabas.text isEqualToString:@"3"])
        self.palavraAleatoria.text = [palavras3 objectAtIndex:rand() % 2];
    if (validarSilabas > 3)
        self.palavraAleatoria.text = @"Atenção, você deve informar o número de sílabas entre 1 e 3!";
    
    [self.palavraAleatoria setHidden:NO];
    [self.view endEditing:YES];

}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.palavraAleatoria setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
