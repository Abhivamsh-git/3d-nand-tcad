; 3D diode structure generation
(sde:clear)
; set coordinate system up direction 
(sde:set-process-up-direction "+z")


(sdegeo:create-rectangle (position 0 0 0)  (position 10 2 0) "Silicon" "region_p")
(sdegeo:create-rectangle (position 0 2 0)  (position 10 4 0) "Silicon" "region_n")

(sdegeo:define-contact-set "Cathode" 4 (color:rgb 1 0 0) "##")
(sdegeo:define-contact-set "Anode" 4 (color:rgb 1 0 1) "##")

(sdegeo:set-current-contact-set "Cathode")
(sdegeo:set-contact (list (car (find-edge-id (position 5 0 0)))) "Cathode")

(sdegeo:set-current-contact-set "Anode")
(sdegeo:set-contact (list (car (find-edge-id (position 5 4 0)))) "Anode")

(sdedr:define-constant-profile "ConstantProfileDefinition_n" "PhosphorusActiveConcentration" 1e16)
(sdedr:define-constant-profile-region "ConstantProfilePlacement_n" "ConstantProfileDefinition_n" "region_n")

(sdedr:define-constant-profile "ConstantProfileDefinition_p" "BoronActiveConcentration" 1e16)
(sdedr:define-constant-profile-region "ConstantProfilePlacement_p" "ConstantProfileDefinition_p" "region_p")

(define res 0.125)

(sdedr:define-refeval-window "Ref_window1" "Rectangle" (position -0.1 -0.1 0) (position 10.1 4.1 0))
(sdedr:define-refinement-size "RefDefination_1" 0.1 0.1 0.01 0.01 )
(sdedr:define-refinement-placement "RefDefination_1" "RefDefination_1" (list "window" "Ref_window1" ))

(sdedr:define-refeval-window "Ref_window2" "Rectangle" (position -0.1 1.5 0) (position 10.1 2.5 0))
(sdedr:define-refinement-size "RefDefination_2" 0.01 0.01 0.001 0.001 )
(sdedr:define-refinement-placement "RefDefination_2" "RefDefination_2" (list "window" "Ref_window2" ))

(sdesnmesh:delaunizer 
  "maxPoints" 1e6 
  "maxConnectivity" 120
  "delaunayTolerance" 0. 
  "minDihedralAngleAllowed" 1  
)

(sde:build-mesh "n@node@")
