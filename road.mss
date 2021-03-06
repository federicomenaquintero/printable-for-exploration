// Roads & Railways //

@railway: #000000;
@railway_line_width: 1;
@railway_hatch_width: 4;
@railway_hatch_pattern: 1,15;

@motorway_case: #000000;
@motorway: #ff0000;

/* Main roads */

@main_case: #000000;
@main_paved: #ffe51b;
@main_unpaved: #b7b7b7;

@main_case_width_z12: 3;
@main_case_width_z13: 3.5;
@main_case_width_z14: 4;
@main_case_width_z15: 5.5;
@main_case_width_z16: 9;
@main_case_width_z17: 13;
@main_case_width_z18: 15;

@main_line_width_z12: 1.5;
@main_line_width_z13: 2;
@main_line_width_z14: 2.5;
@main_line_width_z15: 3.5;
@main_line_width_z16: 6;
@main_line_width_z17: 10;
@main_line_width_z18: 12;

/* Streets */

@street_case: #000000;
@street_paved: #ffffff;
@street_unpaved: #b7b7b7;

@street_case_width_z12: 0.5;
@street_case_width_z13: 0.5;
@street_case_width_z14: 2.5;
@street_case_width_z15: 4;
@street_case_width_z16: 6;
@street_case_width_z17: 9;
@street_case_width_z18: 11;

// No line width for z12 as it is too small
@street_line_width_z13: 0;
@street_line_width_z14: 1.5;
@street_line_width_z15: 3;
@street_line_width_z16: 4;
@street_line_width_z17: 6;
@street_line_width_z18: 8;

/* Service roads */

@service_case: #000000;
@service: @street_paved;

/* Tracks and paths */

@track: #000000;
@track_width_z13: 1;
@track_width_z14: 0.75;
@track_width_z15: 1;
@track_width_z16: 2;
@track_width_z17: 3;
@track_width_z18: 4;

@path_case: #ffffff;
@path:  #000000;
@path_case_width_z14: 2;
@path_case_width_z15: 3;
@path_case_width_z16: 4;
@path_case_width_z17: 4;
@path_case_width_z18: 4;

@path_line_width_z14: 1;
@path_line_width_z15: 1;
@path_line_width_z16: 2;
@path_line_width_z17: 2;
@path_line_width_z18: 3;

@path_footway: #000000; // default was #bba;
@path_footway_dashes: 2,1;

@path_path: #000000; // default was #987;
@path_path_dashes: 6,2;

@path_hiking: #000000; // default was #c97;
@path_hiking_dashes: 2,1;

@path_trail: #000000; // default was #c97;
@path_trail_dashes: 6,2;

@path_cycleway: #000000; // default was #488;
@path_cycleway_dashes: 2,1;

@path_mtb: #000000; // default was #488;
@path_mtb_dashes: 6,2;

@path_piste: #000000; // default was #87b;
@path_piste_dashes: 4,2;

@path_other: #000000; // default was #bba;
@path_other_dashes: 2,3;

#road,
#tunnel,
#bridge {
  // This section just sets up the ordering of the attachments
  ::mask { opacity: 1; }
  ::case { opacity: 1; }
  ::fill { opacity: 1; }
  ::path { opacity: 1; }
}

#road,
#tunnel,
#bridge {
  [class='motorway']['mapnik::geometry_type'=2], {
    ::case[zoom>=6] {
      line-color: @motorway_case;
      [zoom<=9] { line-color: @motorway; }
      #road { line-cap: round; }
      #tunnel { line-dasharray: 3,3; }
      line-width: 0.6;
      [zoom>= 8] { line-width: 0.8; }
      [zoom>=10] { line-width: 2.8; }
      [zoom>=11] { line-width: 3; }
      [zoom>=12] { line-width: 4; }
      [zoom>=13] { line-width: 5; }
      [zoom>=14] { line-width: 6.5; }
      [zoom>=15] { line-width: 9; }
      [zoom>=16] { line-width: 12; }
      [zoom>=17] { line-width: 15; }
      [zoom>=18] { line-width: 17; }
    }
    ::fill[zoom>=10] {
      line-color: @motorway;
      line-cap: round;
      #tunnel { line-color: mix(@motorway,@land,50); }
      [zoom>=11] { line-width: 1.2; }
      [zoom>=12] { line-width: 2; }
      [zoom>=13] { line-width: 3; }
      [zoom>=14] { line-width: 4; }
      [zoom>=15] { line-width: 6; }
      [zoom>=16] { line-width: 9; }
      [zoom>=17] { line-width: 12; }
      [zoom>=18] { line-width: 14; }
    }
  }
  [class='motorway_link']['mapnik::geometry_type'=2], {
    ::case {
      line-color: @motorway_case;
      #road { line-cap: round; }
      #tunnel { line-dasharray: 3,3; }
      [zoom>=12] { line-width: 2.8; }
      [zoom>=14] { line-width: 3.5; }
      [zoom>=16] { line-width: 5; }
      [zoom>=18] { line-width: 6; }
    }
    ::fill[zoom>=10] {
      line-color: @motorway;
      line-cap: round;
      #tunnel { line-color: mix(@motorway,@land,50); }
      [zoom>=12] { line-width: 1.2; }
      [zoom>=14] { line-width: 2; }
      [zoom>=16] { line-width: 3; }
      [zoom>=18] { line-width: 4; }
    }
  }
  [class='main']['mapnik::geometry_type'=2] {
    ::case[zoom>=6] {
      line-color: @main_case;
      [zoom<=11] { line-color: @main_paved; }
      #road { line-cap: round; }
      #tunnel { line-dasharray: 3,3; }
      line-width: 0.4;
      [zoom>=12] { line-width: @main_case_width_z12; }
      [zoom>=13] { line-width: @main_case_width_z13; }
      [zoom>=14] { line-width: @main_case_width_z14; }
      [zoom>=15] { line-width: @main_case_width_z15; }
      [zoom>=16] { line-width: @main_case_width_z16; }
      [zoom>=17] { line-width: @main_case_width_z17; }
      [zoom>=18] { line-width: @main_case_width_z18; }
    }
    ::fill[zoom>=12] {
      line-color: @main_paved;
      [surface='unpaved'] { line-color: @main_unpaved; }
      line-cap: round;
      #tunnel { line-color: mix(@main_paved,@land,50); }
      [zoom>=12] { line-width: @main_line_width_z12; }
      [zoom>=13] { line-width: @main_line_width_z13; }
      [zoom>=14] { line-width: @main_line_width_z14; }
      [zoom>=15] { line-width: @main_line_width_z15; }
      [zoom>=16] { line-width: @main_line_width_z16; }
      [zoom>=17] { line-width: @main_line_width_z17; }
      [zoom>=18] { line-width: @main_line_width_z18; }
    }
  }
  [class='street']['mapnik::geometry_type'=2],
  [class='street_limited']['mapnik::geometry_type'=2] {
    ::case[zoom>=12] {
      line-color: @street_case;
      #road { line-cap: round; }
      #tunnel { line-dasharray: 3,3; }
      [zoom>=12] { line-width: @street_case_width_z12; }
      [zoom>=13] { line-width: @street_case_width_z13; }
      [zoom>=14] { line-width: @street_case_width_z14; }
      [zoom>=15] { line-width: @street_case_width_z15; }
      [zoom>=16] { line-width: @street_case_width_z16; }
      [zoom>=17] { line-width: @street_case_width_z17; }
      [zoom>=18] { line-width: @street_case_width_z18; }
    }
    ::fill[zoom>=13] {
      line-color: @street_paved;
      [surface='unpaved'] { line-color: @street_unpaved; }
      #road { line-cap: round; }
      #tunnel { line-color: mix(@street_paved,@land,50); }
      [class='street_limited'] { line-dasharray: 6,1; }
      [zoom>=13] { line-width: @street_line_width_z13; }
      [zoom>=14] { line-width: @street_line_width_z14; }
      [zoom>=15] { line-width: @street_line_width_z15; }
      [zoom>=16] { line-width: @street_line_width_z16; }
      [zoom>=17] { line-width: @street_line_width_z17; }
      [zoom>=18] { line-width: @street_line_width_z18; }
    }
  }
  [class='service']['mapnik::geometry_type'=2][type!='track'] {
    ::case[zoom>=13] {
      line-color: @service_case;
      #road { line-cap: round; }
      #tunnel { line-dasharray: 3,3; }
      [zoom>=13] { line-width: 2; }
      [zoom>=14] { line-width: 3; }
      [zoom>=15] { line-width: 3.5; }
      [zoom>=16] { line-width: 4; }
      [zoom>=17] { line-width: 5; }
      [zoom>=18] { line-width: 6; }
    }
    ::fill[zoom>=13] {
      line-color: @service;
      #road { line-cap: round; }
      #tunnel { line-color: mix(@service,@land,50); }
      [zoom>=13] { line-width: 1; }
      [zoom>=14] { line-width: 1; }
      [zoom>=15] { line-width: 1.5; }
      [zoom>=16] { line-width: 2; }
      [zoom>=17] { line-width: 3; }
      [zoom>=18] { line-width: 4; }
    }
  }
  [class='service'][type='track'] {
    line-color: @track;
    [zoom>=13] { line-width: @track_width_z13; }
    [zoom>=14] { line-width: @track_width_z14; }
    [zoom>=15] { line-width: @track_width_z15; }
    [zoom>=16] { line-width: @track_width_z16; }
    [zoom>=17] { line-width: @track_width_z17; }
    [zoom>=18] { line-width: @track_width_z18; }
  }
  [class='path'][type!='steps'] {
    #bridge::mask[zoom>=16] {
      line-color: #8f8880;
      line-width: 6;
    }
    ::case[zoom>=14]['mapnik::geometry_type'=2] {
      [class='path'] {
        line-color: @path_case;
      }
      #bridge { line-opacity: 1; }
      line-join: round;
      [type='cycleway'],
      [type='mtb'] {
        line-color: #ce9;
      }
      [type='piste'] { line-color: #cce; }
      [zoom>=14] { line-width: @path_case_width_z14; }
      [zoom>=15] { line-width: @path_case_width_z15; }
      [zoom>=16] { line-width: @path_case_width_z16; }
      [zoom>=17] { line-width: @path_case_width_z17; }
      [zoom>=18] { line-width: @path_case_width_z18; }
    }
    ::path[zoom>=14]['mapnik::geometry_type'=2] {
      line-join: round;
      [zoom>=14] { line-width: @path_line_width_z14; }
      [zoom>=15] { line-width: @path_line_width_z15; }
      [zoom>=16] { line-width: @path_line_width_z16; }
      [zoom>=17] { line-width: @path_line_width_z17; }
      [zoom>=18] { line-width: @path_line_width_z18; }
      [type='footway'] {
        line-color: @path_footway;
        line-dasharray: @path_footway_dashes;
      }
      [type='path'] {
        line-color: @path_path;
        line-dasharray: @path_path_dashes;
      }
      [type='hiking'] {
        line-color: @path_hiking;
        line-dasharray: @path_hiking_dashes;
      }
      [type='trail'] {
        line-color: @path_trail;
        line-dasharray: @path_trail_dashes;
      }
      [type='cycleway'] {
        line-color: @path_cycleway;
        line-dasharray: @path_cycleway_dashes;
      }
      [type='mtb'] {
        line-color: @path_mtb;
        line-dasharray: @path_mtb_dashes;
      }
      [type='piste'] {
        line-color: @path_piste;
        line-dasharray: @path_piste_dashes;
        line-width: 0.8;
      }
      [type='other'] {
        line-color: @path_other;
        line-dasharray: @path_other_dashes;
      }
      [type='piste'][zoom>=15] { line-width: 1; }
      [type='piste'][zoom>=16] { line-width: 1.2; }
    }
  }
  [class='path'][type='steps'][zoom>=16] {
    ::case {
      line-color: #ffd;
      line-opacity: 0.5;
      line-join: round;
      line-width: 6;
    }
    ::fill {
      line-color: #bba;
      line-width: 4;
      line-dasharray: 2,1;
    }
  }
  [class='major_rail'] {
    line-width: @railway_line_width;
    line-color: @railway;
    hatch/line-width: @railway_hatch_width;
    hatch/line-color: @railway;
    hatch/line-dasharray: @railway_hatch_pattern;
  }
}

#bridge[class='aerialway'][zoom>=13] {
  ::case {
    line-color: white;
    line-opacity: 0.5;
    line-width: 2;
    [zoom=14] { line-width: 2.5; }
    [zoom=15] { line-width: 3; }
    [zoom=16] { line-width: 3.5; }
    [zoom=17] { line-width: 4; }
    [zoom>17] { line-width: 5; }
  }
  ::line {
    line-color: #876;
    line-width: 0.8;
    [zoom>=14] { line-width: 1.4; }
    [zoom>=15] { line-width: 1.6; }
    [zoom>=16] { line-width: 2; }
    [zoom>=17] { line-width: 2.4; }
    [zoom>=18] { line-width: 3; }
  }
  ::pattern {
    line-clip: false;
    line-color: #876;
    line-width: 4;
    line-dasharray: 0.8, 10;
    [zoom=14] { line-width: 6; }
    [zoom=15] { line-width: 8; }
    [zoom=16] { line-width: 10; }
    [zoom=17] { line-width: 12; }
    [zoom>17] { line-width: 14; }
    [zoom=14] { line-dasharray: 1.4, 22; }
    [zoom=15] { line-dasharray: 1.6, 35; }
    [zoom=16] { line-dasharray: 2, 50; }
    [zoom=17] { line-dasharray: 2.4, 65; }
    [zoom>17] { line-dasharray: 3, 80; }
  }
}

#bridge[class='golf'][zoom>=16] {
  // golf hole ways are only in the bridge layer 
  // to keep them above everything else
  ::case {
    line-color: green;
    line-opacity: 0.25;
    line-width: 1.6;
    [zoom>=17] { line-width: 2.2; }
    [zoom>=18] { line-width: 3; }
  }
  ::fill {
    line-color: #666;
    line-width: 0.6;
    [zoom>=17] { line-width: 1; }
    [zoom>=18] { line-width: 1.2; }
  }
}

/**/