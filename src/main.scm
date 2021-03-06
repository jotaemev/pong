;; Copyright (c) 2012, Alvaro Castro-Castilla. All rights reserved.
;; Game by: Daniel Sanchez, Alejandro Cabeza, Carlos Belmonte and Juan Maria Vergara
(pg:app
 setup: (lambda (resources)
          (make-environment 600 400 resources #f))
 main-loop: (lambda (env)
             (let* ((graphics (environment-graphics env))
                    (surface (graphics-surface graphics))
                    (canvas (graphics-canvas graphics))
                    (maxx (environment-size-x env))
                    (maxy (environment-size-y env))
                    (box-size-x (/ (* maxx 1) 100))
                    (box-size-y (/ (* maxy 20) 100))
                    (box-1-pos-x (/ (* maxx 5) 100))
                    (box-2-pos-x (- maxx (/ (* maxx 5) 100)))
                    (max-pos-y (- maxy box-size-y))
                    (min-pos-y box-size-y)
                    (init-c-pos-x (/ (* maxx 50) 100))
                    (init-c-pos-y (/ (* maxy 50) 100))
                    (c-size (/ (* maxy 1) 100)))
               (let loop ((box-1-pos-y (/ (* maxy 50) 100))
                          (box-2-pos-y (/ (* maxy 50) 100))
                          (c-pos-x init-c-pos-x)
                          (c-pos-y init-c-pos-y))
                 ;Draw neutral canvas
                 (draw:fill-color! (make-color/rgba 0 0 0 1))
                 (draw:rectangle/corner-corner 0 0 maxx maxy)
                 
                 
                 ;Draw players
                 (draw:fill-color! (make-color/rgba 1 1 1 1))
                 (draw:rectangle/center-sides  box-1-pos-x box-1-pos-y box-size-x box-size-y)
                 (draw:rectangle/center-sides  box-2-pos-x box-2-pos-y box-size-x box-size-y) 
                 

                 



                 ;Draw ball
                 (draw:circle/center c-pos-x c-pos-y c-size)
                 (draw:on surface)

                 ;EXIT
                 (if (input:key-pressed? 27)
                      (exit 0))
                 
                 ;Main loop
                 (loop  
                  
                  ;Player One box movement
                  (cond 
                   ((input:key-pressed? 119) (if (< (- box-1-pos-y 10) min-pos-y) min-pos-y
                                                 (- box-1-pos-y 0.5)))
                   
                   ((input:key-pressed? 115) (if (> (+ box-1-pos-y 10) max-pos-y) max-pos-y
                                                 (+ box-1-pos-y 0.5)))
                   (else
                    box-1-pos-y))

                  ;Player Two box movement 
                  (cond 
                   ((input:key-pressed? 273) (if (< (- box-2-pos-y 10) min-pos-y) min-pos-y
                                                 (- box-2-pos-y 0.5)))
                   
                   ((input:key-pressed? 274) (if (> (+ box-2-pos-y 10) max-pos-y) max-pos-y
                                                 (+ box-2-pos-y 0.5)))
                   (else
                    box-2-pos-y))


                  ;Ball, circle, movement -X
                  ;(cond)
                  (+ c-pos-x 0.05)
                  ;Ball, circle, movement -Y
                  (+ c-pos-y 0.05)
                  

                  )))))
