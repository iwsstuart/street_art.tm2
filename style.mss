Map {
  background-color: #dddd00;
  background-image: url(land_pattern.jpg);
  font-directory: url('');
}

@labels-1: 'Sprite Graffiti Shadow';
@labels-2: 'Sprite Graffiti Regular';
@labels-3: 'Shortcut Regular';

@name: [name_en];
@water: #3838FF;



#ne_10m_land {
  line-color: #222;
  line-width: 0;
  line-join: round;
  line-cap: round;
//  [zoom>4][zoom<=7] { line-width: 3; }  
//  [zoom>2][zoom<=9] { line-width: 2; }  
}

#landuse {
//  line-width: 1;
//  line-color: rgba(85,153,255,0.5);
}

#water {  
  ::line {
    line-color: @water;
    line-width: 2;
    line-join: round;
    [zoom>9] { line-width: 4; }
    [zoom>=12] { line-width: 6; }
    line-comp-op: multiply;
  }
  ::shadow { 
    polygon-fill: #07f; 
  }
  ::fill {
    polygon-pattern-file: url(water_pattern.jpg);
    comp-op: soft-light;
    image-filters: agg-stack-blur(2,2);
  }  
}

#waterway {  
  line-color: @water;
  line-width: 0;
  line-join: round;
  line-cap: round;
  [type='river'],
  [type='canal'] {
    line-width: 0.5;
    [zoom>=12] { line-width: 1; }
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
  }
  [type='stream'] {
    line-width: 0.5;
    [zoom>=14] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
}

#aeroway {
  line-width: 1;
  line-color: rgba(221,85,204,0.5);
}

#barrier_line {
  line-width: 1;
  line-color: rgba(119,170,238,0.5);
}

#building {
  line-width: 0;
  polygon-fill: #678971;
  polygon-opacity: 0.4;
//  comp-op: minus;
}

#landuse_overlay {
  line-width: 1;
  line-color: rgba(153,187,119,0.5);
}

#landuse [zoom>=6] { 
  [class='park'] { 
    polygon-pattern-file: url(landuse1_small.jpg); }
  [class='agriculture'] { 
    polygon-pattern-file: url(landuse2_adjust.jpg);     
    polygon-pattern-opacity: 0.5;
  }
  comp-op: minus;
} 

#landcover [zoom>=4] {   
  [class='wood'] { 
    polygon-pattern-file: url(landuse1_small.jpg);
  }
  comp-op: minus;
}

#road::case,
#bridge::case,
#tunnel::case {
  line-color: #fff;
  line-width:0;
  [class='motorway'] {
    line-width: 4;
    [zoom=11] { line-width: 7; }
    [zoom=12] { line-width: 9; }
    [zoom=13] { line-width: 10; }
    [zoom>13] { line-width: 12; }
  }
  [class='motorway_link'] { 
    line-width: 3;
    [zoom>10] { line-width: 5; }
    [zoom>12] { line-width: 8; }
  }
  [class='main'] { 
    line-width: 2;
    [zoom>10] { line-width: 5; }
    [zoom=13] { line-width: 7; }    
    [zoom>13] { line-width: 8; }
  }
  [zoom>13][class='street'] {
//    line-width: 4; 
  }
}

#road, #tunnel, #bridge {
  line-width: 0;
  line-color: #333;
  [class='motorway'] { 
    line-width: 2;
    [zoom=11] { line-width: 3; }
    [zoom=12] { line-width: 4; }
    [zoom=13] { line-width: 5; }
    [zoom>13] { line-width: 6; }
  }
  [class='motorway_link'] {
    line-width: 1;
    [zoom>10] { line-width: 2; }
    [zoom>12] { line-width: 3; }
  }
  [class='main'] { 
    line-width: 1;    
    [zoom>10] { line-width: 2; }
    [zoom=13] { line-width: 3; }    
    [zoom>13] { line-width: 4; }
  }
  [class='street'] { 
    line-width: 0;
    line-color: #fff;
    [zoom=12] { line-width: 0.5; }
    [zoom>=13] { line-width: 1; }
  }
}

#admin::case [admin_level=2][maritime=0] {
  line-width: 3;
  line-color: white;
  [zoom>4] { line-width: 4; }
}

#admin [admin_level=2][maritime=0] {
  line-width: 1;
  line-color: #111;
  [zoom>4] { line-width: 2; }
}

#country_label_line {
  line-width: 1;
  line-color: rgba(85,136,204,0.5);
}

#country_label {
  text-name: @name;
  text-face-name: @labels-3;
  text-size: 16;
  text-halo-fill: white;
  text-halo-radius: 2;
  text-margin: 10;
  [scalerank=1] { text-size: 20; }
  [zoom>=4] { 
    text-size: 20;
    [scalerank=1] { text-size: 24; }
    [scalerank>3] { text-size: 16; }
  }
}

#marine_label {
  text-name: [name];
  text-face-name: @labels-3;
  text-size: 14;
  text-fill: white;
  text-halo-fill: black;
  text-halo-radius: 1;
  [labelrank=1] { text-size: 20; }
}

#state_label {
  line-width: 1;
  line-color: rgba(119,255,102,0.5);
}

#place_label[type='city'][localrank<=2] {
  text-name: @name;
  text-face-name: @labels-2;
  text-halo-fill: white;
  text-halo-radius: 2;
  text-halo-rasterizer: fast;
  text-size: 18;
  text-margin: 10;
  [zoom>=13] { text-halo-radius: 3; }
  [localrank=1] { text-face-name: @labels-3; }
  [localrank=2] { text-orientation: 6; }
  [scalerank<=1] {
    text-size: 18;
    [zoom>=8]  { text-size: 24; }
    [zoom>=10]  { text-size: 30; }
    [zoom>=14]  { text-size: 36; }
  }
  [scalerank=2] {
    text-size: 16;
    [zoom>=8]  { text-size: 24; }
    [zoom>=10]  { text-size: 30; }
    [zoom>=14]  { text-size: 36; }
  }
  [scalerank>=3] {
    text-size: 14;
    [zoom>=8]  { text-size: 18; }
    [zoom>=10]  { text-size: 24; }
    [zoom>=14]  { text-size: 28; }
  }
  [scalerank>=4] {
    text-size: 16;
    text-face-name: @labels-2;
    text-orientation: 6;
  }
}

#place_label[type='town'][localrank<=1][zoom>8],
#place_label[type='town'][localrank<=3][zoom>=11] {
  text-name: @name;
  text-face-name: @labels-2;
  text-orientation: -4;
  text-halo-fill: white;
  text-halo-radius: 2;
  text-halo-rasterizer: fast;
  text-size: 16;
  text-wrap-width: 80;
  text-margin: 20;
  [zoom>=12] { text-size: 20; }
  [zoom>=13] { text-halo-radius: 3; }
  [zoom>=14] { text-size: 24; }
}

#place_label[zoom>=11][type!='city'][type!='town'] {
  text-name: @name;
  text-face-name: @labels-2;
  text-halo-fill: white;
  text-halo-radius: 2;
  text-halo-rasterizer: fast;
  text-size: 16;
  text-line-spacing:-2;
  text-wrap-width: 50;
  text-margin: 10;
//  [zoom>=13] { text-halo-radius: 3; }
  [zoom>=14][type='neighbourhood'],
  [zoom>=14][type='village'] {
    text-size: 18;
    text-orientation: 5;
  }
}

#water_label {
  line-width: 1;
  line-color: rgba(136,68,170,0.5);
}

#poi_label {
  line-width: 1;
  line-color: rgba(85,255,221,0.5);
}

#road_label {
  line-width: 1;
  line-color: rgba(136,170,255,0.5);
}

#waterway_label {
  line-width: 1;
  line-color: rgba(68,204,170,0.5);
}

#housenum_label {
  line-width: 1;
  line-color: rgba(102,238,102,0.5);
}

