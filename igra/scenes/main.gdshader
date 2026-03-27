shader_type canvas_item;

uniform float radius : hint_range(0.0, 1.0) = 0.5;      // Circle size (0.5 = full circle)
//uniform float feather : hint_range(0.0, 0.2) = 0;   // Soft edge (0 = hard circle)
uniform vec2 center = vec2(0.5, 0.5);                   // Center of the circle (UV space)

void fragment() {
    vec2 uv = UV - center;
    float dist = length(uv);                            // Distance from center
    
    float alpha = 1.0 - smoothstep(radius, radius, dist);
    
    COLOR = texture(TEXTURE, UV);
    COLOR.a *= alpha;
}