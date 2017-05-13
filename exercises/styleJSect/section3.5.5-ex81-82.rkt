#lang racket

; Section 3.5.5: Modularity of Functional Programs and Modularity of Objects

(require "common.rkt")

;   Exercise 3.81
;   =============
;   
;   Exercise [3.6] discussed generalizing the random-number generator to
;   allow one to reset the random-number sequence so as to produce
;   repeatable sequences of "random" numbers.  Produce a stream formulation
;   of this same generator that operates on an input stream of requests to
;   generate a new random number or to reset the sequence to a specified
;   value and that produces the desired stream of random numbers.  Don't use
;   assignment in your solution.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.81]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.81
;   [Exercise 3.6]:  http://sicp-book.com/book-Z-H-24.html#%_thm_3.6
;   3.5.5 Modularity of Functional Programs and Modularity of Objects - p353
;   ------------------------------------------------------------------------

(-start- "3.81")



(--end-- "3.81")

;   ========================================================================
;   
;   Exercise 3.82
;   =============
;   
;   Redo exercise [3.5] on Monte Carlo integration in terms of streams.  The
;   stream version of estimate-integral will not have an argument telling
;   how many trials to perform.  Instead, it will produce a stream of
;   estimates based on successively more trials.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.82]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.82
;   [Exercise 3.5]:  http://sicp-book.com/book-Z-H-24.html#%_thm_3.5
;   3.5.5 Modularity of Functional Programs and Modularity of Objects - p354
;   ------------------------------------------------------------------------

(-start- "3.82")



(--end-- "3.82")
