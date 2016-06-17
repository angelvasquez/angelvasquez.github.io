/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//<!-- PopAds.net Popunder Code for www.alt-torrent.com -->

  var _pop = _pop || [];
  _pop.push(['siteId', 1036475]);
  _pop.push(['minBid', 0]);
  _pop.push(['popundersPerIP', 00]);
  _pop.push(['delayBetween', 0]);
  _pop.push(['default', "http://adsrvmedia.adk2x.com/imp?p=70655975&ct=html&ap=1303&iss=0&f=0"]);
  _pop.push(['defaultPerDay', 0]);
  _pop.push(['topmostLayer', true]);
  (function() {
    var pa = document.createElement('script'); pa.type = 'text/javascript'; pa.async = true; pa.cfasync = false;
    var s = document.getElementsByTagName('script')[0]; 
    pa.src = '//c1.popads.net/pop.js';
    pa.onerror = function() {
      var sa = document.createElement('script'); sa.type = 'text/javascript'; sa.async = true; pa.cfasync = false;
      sa.src = '//c2.popads.net/pop.js';
      s.parentNode.insertBefore(sa, s);
    };
    s.parentNode.insertBefore(pa, s);
  })();

//<!-- PopAds.net Popunder Code End -->