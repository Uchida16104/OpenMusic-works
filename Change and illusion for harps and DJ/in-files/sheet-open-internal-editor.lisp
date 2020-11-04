

(in-package :om)

;;;======================

(defmethod value-for-params ((self t)) (value self))

(defmethod get-edit-param ((self object-with-persistant-params) param) 
  (let ((par-pair (find param (edition-params self) :test 'eql :key 'car)))
    (if par-pair ;; ok
        (cdr par-pair)
      ;; not ok : add the defaut to the edition params
      (let ((def-pair (find param (default-edition-params (value-for-params self)) :test 'eql :key 'car)))
        (if def-pair 
            (progn (push (copy-list def-pair) (edition-params self))
              (cdr def-pair))
          ;(om-beep-msg (format nil "error: def param ~A not found for object ~A" param (value self)))
          nil
          ))
      )))

;;;======================

(defclass* sheet-track-obj (container object-with-persistant-params)
  ((obj :initform nil :accessor obj :initarg :obj :documentation "a musical object")
   (id :initform nil :accessor id :initarg :id :documentation "object ID (integer)")
   (start-t :initform 0 :accessor start-t :initarg :start-t :documentation "object onset (ms)")
   (end-t :initform 500 :accessor end-t)
   (obj-size :initform 20 :accessor obj-size)  
   (obj-margin :initform 1 :accessor obj-margin)
   (obj-staff :initform 'g :accessor obj-staff)
   (editorframe :accessor editorframe :initform nil)
   (frame :accessor frame :initform nil)
   )
  (:icon 460)
  (:documentation "The SHEET-TRACK-OBJ is an internal class used to store objects in the sheet tracks. It is usually generated automatically but can be created in OM visual program as well.

<obj> is the musical object object.
<id> is used to identify the object in the sheet (for algorithmic manipulations).
<start-t> is the absolute onset of the object in the sheet track."))

(defmethod obj ((self sheet-track-obj)) 
  (car (inside self)))

(defmethod value-for-params ((self sheet-track-obj)) (obj self))