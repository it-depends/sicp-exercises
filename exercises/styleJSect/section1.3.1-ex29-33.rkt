#lang racket

; Section 1.3.1: Procedures as Arguments

(require "common.rkt")

;   Exercise 1.29
;   =============
;   
;   Simpson's Rule is a more accurate method of numerical integration than
;   the method illustrated above.  Using Simpson's Rule, the integral of a
;   function f between a and b is approximated as
;   
;   h
;   ─ [y₀ + 4y₁ + 2y₂ + 4y₃ + 2y₄ + ... + 2y    + 4y    + y ]
;   3                                       ⁿ⁻²     ⁿ⁻¹    ⁿ
;   
;   where h = (b - a)/n, for some even integer n, and y_(k) = f(a + kh).
;   (Increasing n increases the accuracy of the approximation.) Define a
;   procedure that takes as arguments f, a, b, and n and returns the value
;   of the integral, computed using Simpson's Rule. Use your procedure to
;   integrate cube between 0 and 1 (with n = 100 and n = 1000), and compare
;   the results to those of the integral procedure shown above.
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.29]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.29
;   1.3.1 Procedures as Arguments - p60
;   ------------------------------------------------------------------------

(-start- "1.29")



(--end-- "1.29")

;   ========================================================================
;   
;   Exercise 1.30
;   =============
;   
;   The sum procedure above generates a linear recursion.  The procedure can
;   be rewritten so that the sum is performed iteratively. Show how to do
;   this by filling in the missing expressions in the following definition:
;   
;   (define (sum term a next b)
;     (define (iter a result)
;       (if <??>
;           <??>
;           (iter <??> <??>)))
;     (iter <??> <??>))
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.30]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.30
;   1.3.1 Procedures as Arguments - p60
;   ------------------------------------------------------------------------

(-start- "1.30")



(--end-- "1.30")

;   ========================================================================
;   
;   Exercise 1.31
;   =============
;   
;   a.  The sum procedure is only the simplest of a vast number of similar
;   abstractions that can be captured as higher-order procedures.⁽⁵¹⁾ Write
;   an analogous procedure called product that returns the product of the
;   values of a function at points over a given range. Show how to define
;   factorial in terms of product.  Also use product to compute
;   approximations to π using the formula⁽⁵²⁾
;   
;   π   2·4·4·6·6·8···
;   ─ = ──────────────
;   4   3·3·5·5·7·7···
;   
;   b.  If your product procedure generates a recursive process, write one
;   that generates an iterative process. If it generates an iterative
;   process, write one that generates a recursive process.
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.31]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.31
;   [Footnote 51]:   http://sicp-book.com/book-Z-H-12.html#footnote_Temp_95
;   [Footnote 52]:   http://sicp-book.com/book-Z-H-12.html#footnote_Temp_96
;   1.3.1 Procedures as Arguments - p60
;   ------------------------------------------------------------------------

(-start- "1.31")



(--end-- "1.31")

;   ========================================================================
;   
;   Exercise 1.32
;   =============
;   
;   a. Show that sum and product (exercise [1.31]) are both special cases of
;   a still more general notion called accumulate that combines a collection
;   of terms, using some general accumulation function:
;   
;   (accumulate combiner null-value term a next b)
;   
;   Accumulate takes as arguments the same term and range specifications as
;   sum and product, together with a combiner procedure (of two arguments)
;   that specifies how the current term is to be combined with the
;   accumulation of the preceding terms and a null-value that specifies what
;   base value to use when the terms run out.  Write accumulate and show how
;   sum and product can both be defined as simple calls to accumulate.
;   
;   b. If your accumulate procedure generates a recursive process, write one
;   that generates an iterative process. If it generates an iterative
;   process, write one that generates a recursive process.
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.32]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.32
;   [Exercise 1.31]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.31
;   1.3.1 Procedures as Arguments - p61
;   ------------------------------------------------------------------------

(-start- "1.32")



(--end-- "1.32")

;   ========================================================================
;   
;   Exercise 1.33
;   =============
;   
;   You can obtain an even more general version of accumulate (exercise
;   [1.32]) by introducing the notion of a filter on the terms to be
;   combined.  That is, combine only those terms derived from values in the
;   range that satisfy a specified condition.  The resulting
;   filtered-accumulate abstraction takes the same arguments as accumulate,
;   together with an additional predicate of one argument that specifies the
;   filter.  Write filtered-accumulate as a procedure.  Show how to express
;   the following using filtered-accumulate:
;   
;   a. the sum of the squares of the prime numbers in the interval a to b
;   (assuming that you have a prime? predicate already written)
;   
;   b. the product of all the positive integers less than n that are
;   relatively prime to n (i.e., all positive integers i < n such that
;   GCD(i,n) = 1).
;   
;   ------------------------------------------------------------------------
;   [Exercise 1.33]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.33
;   [Exercise 1.32]: http://sicp-book.com/book-Z-H-12.html#%_thm_1.32
;   1.3.1 Procedures as Arguments - p61
;   ------------------------------------------------------------------------

(-start- "1.33")



(--end-- "1.33")

