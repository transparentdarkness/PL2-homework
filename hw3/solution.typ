#show math.equation.where(block: true): it => align(left, it)
//#show heading.where(level:1): it=>block(inset:(left:0em, top:1cm),it)
//#show heading.where(level:2): it=>block(inset:(left:1em),it)
//#show heading.where(level:3): it=>block(inset:(left:2em),it)
#set heading(numbering: "1.")

= task 1

$
&(lambda x. lambda y. y) (lambda a. a a)\
-> &(lambda y. y)
$
#v(1cm)

$
&((lambda x. lambda y. x y) (lambda z. lambda w. w)) (lambda a. a a)\
-> &(lambda y. (lambda z. lambda w. w) y) (lambda a. a a)\
-> &(lambda z. lambda w. w) (lambda a. a a)\
-> &lambda w. w
$

= task 2
$ "sum" := lambda t. "fold" (plus) (lambda x. x) t $

$ "sum_leaves" := lambda t. "fold" (lambda a. lambda b. lambda c. (plus) b c) (lambda x. x) t $
$ "map" := lambda m. "fold" (lambda v. lambda l. lambda r. "node" (m v) l r) (lambda v. "leaf" (m v)) $
$ "size" := "fold" (lambda v. lambda l. lambda r plus (plus c_1 l) r) (lambda v. c_1) $

#pagebreak()
= task 3
== inference rules:

$ (t_1 -> t_1') / (t_1 t_2 -> t_1' t_2) $

$ (lambda x. t_12) t_2 --> [x |-> t_2]t_12 $

== evaluate:

=== cbv

0. $ (lambda f. lambda v. v v) ((lambda x. x) (lambda y. lambda z. y)) ((lambda a. a a) (lambda y. y)) $

+ $ (lambda f. lambda v. v v) (lambda y. lambda z. y) ((lambda a. a a) (lambda y. y)) $

+ $ (lambda v. v v) ((lambda a. a a) (lambda y. y)) $

+ $ (lambda v. v v) ((lambda y. y) (lambda y. y)) $

+ $ (lambda v. v v) (lambda y. y) $

+ $ (lambda y. y) (lambda y. y) $

+ $ (lambda y. y) $

=== cbn

0. $ (lambda f. lambda v. v v) ((lambda x. x) (lambda y. lambda z. y)) ((lambda a. a a) (lambda y. y)) $

+ $ (lambda v. v v) ((lambda a. a a) (lambda y. y)) $

+ $ ((lambda a. a a) (lambda y. y)) ((lambda a. a a) (lambda y. y)) $

+ $ ((lambda y. y) (lambda y. y)) ((lambda a. a a) (lambda y. y)) $

+ $ (lambda y. y) ((lambda a. a a) (lambda y. y)) $

+ $ (lambda a. a a) (lambda y. y) $

+ $ (lambda y. y) (lambda y. y) $

+ $ (lambda y. y) $

== comparison
upsides cbn:
- unused arguments dont have to be evaluated
- if an argument diverges but is not used it can be ignored and evaluation can continue

upsides cbv:
- every argument only has to be evaluated once, even if it is used more than once inside a function

