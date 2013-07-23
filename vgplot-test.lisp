;;;; vgplot-test.lisp

#|
    This is the test environment for vgplot, an interface to the gnuplot utility.
    Copyright (C) 2013  Volker Sarodnick

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
|#

(in-package #:vgplot-test)

;; call these tests by running:
;; (lisp-unit:run-tests :all :vgplot-test)

(setq lisp-unit:*print-failures* t)

(define-test test-get-separator
    (assert-equal t (vgplot::get-separator "30	4	87"))
    (assert-equal t (vgplot::get-separator "1.9e3 4 87"))
    (assert-equal nil (vgplot::get-separator " # comment"))
    (assert-equal nil (vgplot::get-separator ""))
    (assert-equal #\, (vgplot::get-separator "30,4,87"))
    (assert-equal #\; (vgplot::get-separator "30.04567;4;87 # comment"))
    (assert-equal #\, (vgplot::get-separator " 30.0d19 ,4 , 87")))
