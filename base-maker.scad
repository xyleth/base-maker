// The core base maker SCAD file
include <Base-Maker-lib/base-maker-lib.scad>;
include <hex-grid/hex-grid.scad>;

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//Basic User Variables
//All measurement based variables are in mm
//Once you have modified the parameters as you desire, press F6 on your keyboard
//These are all defined as defaults in the library, but you can over-ride them here
//For additional variables see the library source code.  Add over-ride definitions here, not in the library

//Style of Base Edge: "Inverted","Traditional","Straight"
BaseStyle = "Inverted";
//Shape of Base: "Circle", "Square", or "Hex"
BaseShape = "Circle";
//Desired Length of Base. For ovals make this the largest number
BaseLength = 60;
//Desired Width of Base. For ovals make this the smallest number
BaseWidth = 60;

HexBase = "Yes";

// Derived variables
GridLength = BaseLength + 10;
GridWidth = BaseWidth + 10;
GridDepth = 0.5;

if (HexBase == "Yes" ) {
    difference() {
        create_base();
        if (BaseLength > 40) {
            render() {
                //Render this to a mesh to prevent normalisation tree errors on larger bases
                create_grid(size=[GridWidth,GridLength,GridDepth],SW=5.5,wall=0.5);
            }
        } else {
            create_grid(size=[GridWidth,GridLength,GridDepth],SW=5.5,wall=0.5);
        }
    }
} else {
    create_base();
}
