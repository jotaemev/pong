;; Copyright (c) 2012, Alvaro Castro-Castilla. All rights reserved.

(pg:app
 setup: (lambda (resources)
          (make-environment 300 500 resources #f))
 main-loop: (lambda (env)
              (let* ((graphics (environment-graphics env))
                     (surface (graphics-surface graphics))
                     (canvas (graphics-canvas graphics))
                     (maxx (environment-size-x env))
                     (maxy (environment-size-y env)))
                (let loop ()
                  ;; This sets the default style (color, thickness, pattern)
                  (draw:stroke! (make-color/rgba 0 0 0 1) 1.0 #f)
                  (draw:fill-color! (make-color/rgba 1 1 1 1))
                  
                  (draw:rectangle/corners 0 0 maxx maxy)
                  
                  (draw:stroke-thickness! 10.0)
                  (draw:segment (/ maxx 2) 0 (/ maxx 2) maxy)
                  
                  ;; This sets only the color
                  ;(draw:stroke-color! (make-color/rgba 0.5 0.5 0.5 1.0))

                  (draw:path closed?: #t
                             (make-vect2 50.0 50.0)
                             (make-vect2 300.0 100.0)
                             (make-vect2 30.0 200.0)
                             (make-vect2 250.0 400.0))

                  (draw:bezier (make-vect2 0.0 0)
                               (make-vect2 300.0 100.0)
                               (make-vect2 30.0 200.0)
                               (make-vect2 0 0))
                  
                  #;
                  (input:call-with-poll-events
                   (lambda (event)
                     (pp event)))
                  
                  ;; (input:call-with-wait-event
                  ;;  (lambda (ev)
                  ;;    (pp ev)))
                  
                  (if (input:key-pressed? 32)
                      (pp "space pressed"))

                  (if (input:key-pressed? 27)
                      (exit 0))

                  (if (input:mouse-button-pressed? 'left)
                      (pp "mouse 1 pressed"))
                                    
                  ;; (input:set-key-events-listener!
                  ;;  (lambda (event)
                  ;;    ()))
                  
                  (draw:on surface)
                  (loop)))))
