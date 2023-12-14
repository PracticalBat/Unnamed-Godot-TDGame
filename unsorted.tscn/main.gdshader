shader_type canvas_item;

uniform sampler2D img_texture: filter_nearest, repeat_enable;
uniform vec4 img_color: source_color;


void fragment(){
	vec4 base_pixel = texture(TEXTURE, UV);
	vec4 texture_pixel = texture(img_texture, UV);
	
	texture_pixel.rgb = vec3(img_color.rgb);
	
	COLOR.rgb = mix(base_pixel.rgb, texture_pixel.rgb, texture_pixel.a * img_color.a);
}