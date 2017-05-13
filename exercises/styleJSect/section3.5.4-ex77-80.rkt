#lang racket

; Section 3.5.4: Streams and Delayed Evaluation

(require "common.rkt")

;   Exercise 3.77
;   =============
;   
;   The integral procedure used above was analogous to the "implicit"
;   definition of the infinite stream of integers in section [3.5.2]. 
;   Alternatively, we can give a definition of integral that is more like
;   integers-starting-from (also in section [3.5.2]):
;   
;   (define (integral integrand initial-value dt)
;     (cons-stream initial-value
;                  (if (stream-null? integrand)
;                      the-empty-stream
;                      (integral (stream-cdr integrand)
;                                (+ (* dt (stream-car integrand))
;                                   initial-value)
;                                dt))))
;   
;   When used in systems with loops, this procedure has the same problem as
;   does our original version of integral.  Modify the procedure so that it
;   expects the integrand as a delayed argument and hence can be used in the
;   solve procedure shown above.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.77]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.77
;   [Section 3.5.2]: http://sicp-book.com/book-Z-H-24.html#%_sec_3.5.2
;   3.5.4 Streams and Delayed Evaluation - p348
;   ------------------------------------------------------------------------

(-start- "3.77")



(--end-- "3.77")

;   ========================================================================
;   
;   Exercise 3.78
;   =============
;   
;   Figure:
;   
;                       dy₀                 y₀
;                        |                  |  
;                        |                  |  
;                        v                  v  
;                  ┌────────────┐     ┌────────────┐  
;        ddy       │            │  dy │            │    y
;   ┌─────────────>│  integral  ├───┬─┤  integral  ├───┬──>
;   │              │            │   │ │            │   │
;   │              └────────────┘   │ └────────────┘   │
;   │                               │                  │
;   │                               │                  │
;   │              ┌────────────┐   │                  │
;   │              │            │   │                  │
;   │              │  scale: a  │<──┘                  │
;   │      ,-`│<───┤            │                      │
;   │   ,-`   │    └────────────┘                      │
;   └─<|  add │                                        │
;       `-,   │    ┌────────────┐                      │
;          `-,│<───┤            │                      │
;                  │  scale: b  │<─────────────────────┘
;                  │            │                     
;                  └────────────┘                     
;   
;   Figure 3.35: Signal-flow diagram for the solution to a second-order
;   linear differential equation.
;   
;   Consider the problem of designing a signal-processing system to study
;   the homogeneous second-order linear differential equation
;   
;   d²y     dy
;   ─── - a ── - by = 0
;   dt²     dt
;   
;   The output stream, modeling y, is generated by a network that contains a
;   loop. This is because the value of d²y/dt² depends upon the values of y
;   and dy/dt and both of these are determined by integrating d²y/dt².  The
;   diagram we would like to encode is shown in figure [3.35].  Write a
;   procedure solve-2nd that takes as arguments the constants a, b, and dt
;   and the initial values y₀ and dy₀ for y and dy/dt and generates the
;   stream of successive values of y.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.78]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.78
;   [Figure 3.35]:   http://sicp-book.com/book-Z-H-24.html#%_fig_3.35
;   3.5.4 Streams and Delayed Evaluation - p348
;   ------------------------------------------------------------------------

(-start- "3.78")



(--end-- "3.78")

;   ========================================================================
;   
;   Exercise 3.79
;   =============
;   
;   Generalize the solve-2nd procedure of exercise [3.78] so that it can be
;   used to solve general second-order differential equations d² y/dt² =
;   f(dy/dt, y).
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.79]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.79
;   [Exercise 3.78]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.78
;   3.5.4 Streams and Delayed Evaluation - p349
;   ------------------------------------------------------------------------

(-start- "3.79")



(--end-- "3.79")

;   ========================================================================
;   
;   Exercise 3.80
;   =============
;   
;   A series RLC circuit consists of a resistor, a capacitor, and an
;   inductor connected in series, as shown in figure [3.36]. If R, L, and C
;   are the resistance, inductance, and capacitance, then the relations
;   between voltage (v) and current (i) for the three components are
;   described by the equations
;   
;   v  = i R
;    ᴿ    ᴿ
;   
;            di 
;              ᴸ
;   V  = L · ───
;    ᴸ       dt
;   	
;            dv 
;              ᶜ
;   i  = C · ───
;    ᶜ       dt
;   
;   and the circuit connections dictate the relations
;   
;   i  = i  = -i
;    ᴿ    ᴸ     ᶜ
;   
;   v  = v  + V
;    ᶜ    ᴸ    ᴿ
;   
;   Combining these equations shows that the state of the circuit
;   (summarized by v_(C), the voltage across the capacitor, and i_(L), the
;   current in the inductor) is described by the pair of differential
;   equations
;   
;   dv      i
;     ᶜ      ᴸ
;   ─── = - ──
;   dt      C
;   
;   di
;     ᴸ   1      R
;   ─── = ─ v  - ─ i
;   dt    L  ᶜ   L  ᴸ
;   
;   The signal-flow diagram representing this system of differential
;   equations is shown in figure [3.37].
;   
;   Figure:
;   
;         i   +        v      - 
;          ᴿ   /\    /\ ᴿ  /\      
;        ┌─>──/  \  /  \  /  \  /─────┐ 
;        │        \/    \/    \/      V i
;        │            R               │  ᴸ
;        │                            └─-,
;        │                                \  +
;        V i                        ,---, /
;   +    │  ᶜ                      (     X
;      ──┴──                        `---` \
;   V        C                      ,---, / 
;    ᶜ                          L  (     X   v   
;      ──┬──                        `---` \   ᴸ
;   -    │                          ,---, /
;        │                         (     X
;        │                          `---` \
;        │                                /  -
;        │                             ┌─`
;        └─────────────────────────────┘
;   
;   Figure 3.36: A series RLC circuit.
;   
;   Figure:
;   
;                     ┌─────────────┐
;                     │             │
;   ┌─────────────────┤ scale: 1/L  │<─┐
;   │                 │             │  │
;   │                 └─────────────┘  │
;   │                                  │
;   │                 ┌─────────────┐  │  V
;   │                 │             │  │   ᶜ
;   │          dv  ┌─>│  integral   ├──┴─────>
;   │            ᶜ │  │             │
;   │              │  └─────────────┘      
;   │              │        ^     v
;   │              │        └ ─ ─  ᶜ⁰
;   │              │                  
;   │              │  ┌─────────────┐
;   │              │  │             │
;   │              └──┤ scale: -1/C │<─┐
;   │                 │             │  │
;   │                 └─────────────┘  │   
;   │                                  │
;   └─>│`-,      di   ┌─────────────┐  │  i
;      │   `-,     ᴸ  │             │  │   ᴸ
;      │ add  |>─────>│  integral   ├──┼─────>
;      │   ,-`        │             │  │
;   ┌─>│,-`           └─────────────┘  │
;   │                       ^     i    │  
;   │                       └ ─ ─  ᴸ⁰  │
;   │                                  │
;   │                 ┌─────────────┐  │
;   │                 │             │  │
;   └─────────────────┤ scale: -R/L │<─┘
;                     │             │
;                     └─────────────┘
;   
;   Figure 3.37: A signal-flow diagram for the solution to a series RLC
;   circuit.
;   
;   Write a procedure RLC that takes as arguments the parameters R, L, and C
;   of the circuit and the time increment dt.  In a manner similar to that
;   of the RC procedure of exercise [3.73], RLC should produce a procedure
;   that takes the initial values of the state variables, v_(C₀) and i_(L₀),
;   and produces a pair (using cons) of the streams of states v_(C) and
;   i_(L).  Using RLC, generate the pair of streams that models the behavior
;   of a series RLC circuit with R = 1 ohm, C = 0.2 farad, L = 1 henry, dt =
;   0.1 second, and initial values i_(L₀) = 0 amps and v_(C₀) = 10 volts.
;   
;   ------------------------------------------------------------------------
;   [Exercise 3.80]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.80
;   [Exercise 3.73]: http://sicp-book.com/book-Z-H-24.html#%_thm_3.73
;   [Figure 3.36]:   http://sicp-book.com/book-Z-H-24.html#%_fig_3.36
;   [Figure 3.37]:   http://sicp-book.com/book-Z-H-24.html#%_fig_3.37
;   3.5.4 Streams and Delayed Evaluation - p349
;   ------------------------------------------------------------------------

(-start- "3.80")



(--end-- "3.80")
