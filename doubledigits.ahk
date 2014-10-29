pressedkey = a

$1::
	RegisterStroke(1,"!")
return
$2::
	RegisterStroke(2,"@")
return
$3::
	RegisterStroke(3,"#")
return
$4::
	RegisterStroke(4,"$")
return
$5::
	RegisterStroke(5,"%")
return
$6::
	RegisterStroke(6,"^")
return
$7::
	RegisterStroke(7,"&")
return
$8::
	RegisterStroke(8,"*")
return
$9::
	RegisterStroke(9,"(")
return
$0::
	RegisterStroke(0,")")
return
$-::
	RegisterStroke("-","_")
return
$=::
	RegisterStroke("=","+")
return


RegisterStroke(key,special)
{
	global
	
	if pressedkey = %key%
	{
		double_presses += 1
		return
	} else {
		pressedkey = %key%
		pressedspecial = %special%
		double_presses = 1
		SetTimer, KeyDouble, 200
	}
}

KeyDouble:
SetTimer, KeyDouble, off
if double_presses >= 2
{
    SendInput {Raw}%pressedspecial%
} else {
	SendInput %pressedkey%
}
pressedkey = a
double_presses = 0
return