(declare-const p00 Bool)
(declare-const p01 Bool)
(declare-const p02 Bool)

(declare-const p10 Bool)
(declare-const p11 Bool)
(declare-const p12 Bool)

(declare-const p20 Bool)
(declare-const p21 Bool)
(declare-const p22 Bool)

(declare-const p30 Bool)
(declare-const p31 Bool)
(declare-const p32 Bool)

(declare-const p40 Bool)
(declare-const p41 Bool)
(declare-const p42 Bool)

;all vertices gets a color
(assert ((_ at-least 1) p00 p01 p02))
(assert ((_ at-least 1) p10 p11 p12))
(assert ((_ at-least 1) p20 p21 p22))
(assert ((_ at-least 1) p30 p31 p32))
(assert ((_ at-least 1) p40 p41 p42))

;all vertices gets at most one color
(assert ((_ at-most 1) p00 p01 p02))
(assert ((_ at-most 1) p10 p11 p12))
(assert ((_ at-most 1) p20 p21 p22))
(assert ((_ at-most 1) p30 p31 p32))
(assert ((_ at-most 1) p40 p41 p42))

;adjacent vertices cannot get same color
(assert (not (and p00 p10)))
(assert (not (and p01 p11)))
(assert (not (and p02 p12)))

(assert (not (and p00 p20)))
(assert (not (and p01 p21)))
(assert (not (and p02 p22)))

(assert (not (and p10 p20)))
(assert (not (and p11 p21)))
(assert (not (and p12 p22)))

(assert (not (and p10 p30)))
(assert (not (and p11 p31)))
(assert (not (and p12 p32)))

(assert (not (and p10 p40)))
(assert (not (and p11 p41)))
(assert (not (and p12 p42)))

(assert (not (and p20 p30)))
(assert (not (and p21 p31)))
(assert (not (and p22 p32)))

(assert (not (and p20 p40)))
(assert (not (and p21 p41)))
(assert (not (and p22 p42)))


(check-sat)
(get-model)
