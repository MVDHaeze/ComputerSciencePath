#lang racket
 (define (square x) (* x x))

 (define (fast-expt b n) 
   (define (cube x) (* x x x)) 
   (define (fast-expt-iter b a counter) 
     (cond ((= counter 0) a) 
           ((= counter 1) (* a b)) 
           ((even? counter) (fast-expt-iter  
                              (square b) 
                              (* (square b) a) 
                              (- (/ counter 2) 1))) 
           (else (fast-expt-iter  
                   (square b)  
                   (* (cube b) a) 
                   (- (/ (- counter 1) 2) 1))))) 
   (fast-expt-iter b 1 n)) 