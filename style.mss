Map {
  background-color: #dddd00;
  background-image: url(land_pattern.jpg);
  font-directory: url('');
}

@labels-1: 'Sprite Graffiti Shadow';
@labels-2: 'Sprite Graffiti Regular';

#ne_110m_land {
  line-color: black;
  line-width: 0;
  line-join: round;
  line-cap: round;
  [zoom<=2] { line-width: 3; }  
}

#ne_10m_land {
  line-color: black;
  line-width: 0;
  line-join: round;
  line-cap: round;
  [zoom>4][zoom<=8] { line-width: 3; }  
  [zoom>2][zoom<=4] { line-width: 2; }  
}

#landuse {
  line-width: 1;
  line-color: rgba(85,153,255,0.5);
}

#water {  
  ::shadow { polygon-fill: #07f; }
  ::fill {
    // a white fill and overlay comp-op lighten the polygon-fill from ::shadow.
//    polygon-fill: #fff;
    polygon-pattern-file: url(water_pattern.jpg);
    comp-op: soft-light;
    // blurring reveals the polygon fill from ::shadow around the edges of the water
    image-filters: agg-stack-blur(2,2);
  }
  [zoom>8] {
    line-color: black;  
    line-width: 1;
  }
}

#waterway {  
  line-color: black;
  line-width: 0;
  line-join: round;
  line-cap: round;
  [type='river'],
  [type='canal'],
  [type='lake'] {
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
  line-width: 1;
  line-color: rgba(204,221,102,0.5);
}

#landuse_overlay {
  line-width: 1;
  line-color: rgba(153,187,119,0.5);
}

#tunnel {
  line-width: 1;
  line-color: rgba(102,68,238,0.5);
}

#road {
  line-width: 1;
  line-color: grey;
}

#bridge {
  line-width: 1;
  line-color: rgba(204,153,153,0.5);
}

#admin {
//  line-width: 1;
//  line-color: rgba(85,153,255,0.5);
}

#country_label_line {
  line-width: 1;
  line-color: rgba(85,136,204,0.5);
}

#country_label {
  text-name: [name];
  text-face-name: @labels-2;
  text-size: 20;
  text-halo-fill: white;
  text-halo-radius: 2;
}

#marine_label {
  text-name: [name];
  text-face-name: @labels-2;
  text-size: 20;
  text-fill: white;
  text-halo-fill: black;
  text-halo-radius: 2;
}

#state_label {
  line-width: 1;
  line-color: rgba(119,255,102,0.5);
}

#place_label[type='city'][localrank=1][zoom>=9],
#place_label[type='city'][zoom>=10] {
  text-name: [name];
  text-face-name: @labels-2;
  text-size: 20;
  text-halo-fill: white;
  text-halo-radius: 2;
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

