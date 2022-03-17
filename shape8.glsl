#ifdef GL_ES
precision mediump float;
#endif

#define PI 3.14159265359

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

float plot(vec2 st, float x) {
  x = (x*2.0 - 1.0);
  float pct = 1.0 - pow(max(0.0, abs(x) * 2.0 - 1.0), 0.5);
  return  smoothstep( pct-0.02, pct, st.y) -
          smoothstep( pct, pct+0.02, st.y);
}

void main() {
  vec2 st = gl_FragCoord.xy/u_resolution;
  
  float x = st.x;

  vec3 color = vec3(x);

  float pct = plot(st, x);
  color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);

  gl_FragColor = vec4(color,1.0);
}
