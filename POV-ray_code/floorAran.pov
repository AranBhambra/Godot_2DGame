#version 3.7;

global_settings {
    assumed_gamma 1.0
    max_trace_level 5
    ambient_light 1
}

camera {
    location <0, 34, 0> // Set camera to be above the floor
    look_at <0, 0, 0> // Look at the center of the scene
    angle 60 
} 

light_source {
    <10, 10, -10>
    color rgb <1, 1, 1>
}

plane {
    y, 0
    pigment {
        checker color rgb <0, 0, 0>, color rgb <1, 1, 1> // Black and white checker pattern
        scale 5
    }
    finish {
        ambient 0.2
        diffuse 0.8
    }
}