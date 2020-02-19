import "bootstrap";

//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require turbolinks
//= require_tree .

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
