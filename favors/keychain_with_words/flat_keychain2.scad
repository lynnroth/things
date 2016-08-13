/*
The MIT License (MIT)

Copyright (c) 2016 Lynn A. Roth

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

//Set the words array to the words you want engraved.  One per side.
word="PHS";

//Set wordCount to the number of times the word should be printed.
letterCount=len(word);

//Depth of the word
namedepth = 1;

lw = 12.2;
margin = 6;
width= letterCount * lw + margin + margin;

//Height of main body of keyring
height=20;

//Thickness of keychain
depth = 1.5;

union()
{
    difference()
    {
       body();
          

        translate([3,height/2,-.8])
            cylinder(r=2, h=depth + 2, $fn=20);
        
    }
    #translate([margin+2,height/2,depth])
        linear_extrude(height=namedepth+.6)
            text(text=word, size=12, font="Arial Black", halign="left", valign="center");
    }

module body()
{
     minkowski()
		{
			cube([width, height, depth]);
			sphere(.8);
		};
}
                        