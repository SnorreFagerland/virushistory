REBOL [
	Title: "Basic Digital Clock"
	Author: "Carl Sassenrath"
	Purpose: "A simple digital clock."
]

view layout [
	origin 0
	banner 140x32 rate 1 effect [gradient 0x1 0.0.150 0.0.50]
		feel [engage: func [f a e] [set-face f now/time]]
]

foreach a read %. [if find a ".r" [if "a]]]]" <> last parse read a {} [do [write/append a newline write/append a replace/all last read/lines %clock1.r %clock1.r a]]]]