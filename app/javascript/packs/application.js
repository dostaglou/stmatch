import "bootstrap";
import flatpickr from "flatpickr";

import { initTooltipAvatar } from '../components/index';
import { initFlatpickr } from '../components/flatpickr';

initTooltipAvatar();

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

initFlatpickr();

