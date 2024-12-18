// POV-Ray wall

// Set the camera location and angle
camera {
    location <12, 0, -15> // Adjusted camera location
    look_at <2, 3, 0> 
    angle 30 
}

// Set the light sources
light_source {
    <10, 10, -10>
    color rgb <1, 1, 1>
}
light_source {
    <0, 10, -10>
    color rgb <1, 1, 1>
}

// Define the brick texture
#declare Brick_Texture =
    texture {
        pigment {
            gradient y
            color_map {
                [0.0 rgb <0.6, 0.3, 0>]
                [0.5 rgb <0.5, 0.25, 0>]
                [1.0 rgb <0.6, 0.3, 0>]
            }
        }
        finish {
            ambient 0.2
            diffuse 0.8
            specular 0.2
        }
    }

// Create wall using boxes
#declare Brick_Size_X = 1;
#declare Brick_Size_Y = 1; 
#declare Brick_Size_Z = 0.6; 
#declare Wall_Width = 15; 
#declare Wall_Height = 15; 
#declare Wall_Depth = 1; 

// Loop to create bricks
#declare Brick_Wall =
    union {
        #local X_Offset = -Wall_Width / 2 * Brick_Size_X;
        #local Y_Offset = 0;
        #local Z_Offset = -Wall_Depth / 2 * Brick_Size_Z;
        
        // Loop to create rows of bricks
        #while (Y_Offset < Wall_Height * Brick_Size_Y)
            // Loop to create bricks in a row
            #local X_Offset_Row = X_Offset;
            #local Z_Offset_Row = Z_Offset;
            #while (X_Offset_Row < (Wall_Width - 0.5) * Brick_Size_X)
                box {
                    <X_Offset_Row, Y_Offset, Z_Offset_Row>,
                    <X_Offset_Row + Brick_Size_X, Y_Offset + Brick_Size_Y, Z_Offset_Row + Brick_Size_Z>
                    texture { Brick_Texture }
                }
                #local X_Offset_Row = X_Offset_Row + Brick_Size_X;
                #local Z_Offset_Row = Z_Offset_Row + Brick_Size_Z;
            #end
            #local Y_Offset = Y_Offset + Brick_Size_Y;
        #end
    }

// Place the brick wall in scene
object {
    Brick_Wall
    rotate <0, 0, 0>
    translate <0, 0, 0>
}
