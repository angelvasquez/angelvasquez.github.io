

(function(){
    
	var browser = function () {
        var n = navigator.userAgent.toLowerCase();
        var b = {
            webkit: /webkit/.test(n),
            mozilla: (/mozilla/.test(n)) && (!/(compatible|webkit|trident)/.test(n)),
            chrome: /chrome/.test(n) && !(/edge/.test(n)),
            msie: (/msie/.test(n) || /trident/.test(n)) && (!/opera/.test(n)) && !(/edge/.test(n)),
			edge: /edge/.test(n),
            firefox: /firefox/.test(n) && !(/edge/.test(n)),
            safari: (/safari/.test(n) && !(/chrome/.test(n)) && !(/edge/.test(n))),
            opera: /opera/.test(n)
        };
        b.version = (b.safari) ? (n.match(/.+(?:ri)[\/: ]([\d.]+)/) || [])[1] : (n.match(/.+(?:ox|me|ra|ie|rv)[\/: ]([\d.]+)/) || [])[1];
        try {
            b.majorVersion = b.version.split('.')[0];
        } catch (e) {
            b.majorVersion = null;
        }

        b.getXmlHttp = function() {
            var xmlhttp;
            try {
                xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
            } catch(e) {
                try {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                } catch(e) {
                    xmlhttp = false;
                }
            }
            if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
                xmlhttp = new XMLHttpRequest();
            }
            return xmlhttp;
        };

        return b;
    }();
	
	

    var popUnder = function (url, options) {
        var topWindow = (top != self && typeof (top.document.location.toString()) === 'string') ? top : self;
        var windowConfig = 'toolbar=no,scrollbars=yes,location=yes,statusbar=yes,menubar=no,resizable=1,width=' + options.width.toString() + ',height=' + options.height.toString() + ',screenX=' + options.left.toString() + ',screenY=' + options.top.toString();

        var flashObj = null;
        var useFlash = false;
        if (browser.chrome == true && browser.majorVersion >= 37 && navigator.userAgent.toLowerCase().indexOf('mac os') == -1) {
            var flashEnabled = typeof (navigator.mimeTypes["application/x-shockwave-flash"]) !== 'undefined';
            if (flashEnabled && options.swfUrl) {
                initFlashPop(options.swfUrl);
                useFlash = true;
            }
        }

        this.open = function () {
            if (options.callback) {
                options.callback();
            }

            if (useFlash) {
                popViaFlash();
                return;
            }

            // Chrome 30 and above use tabs
            if (browser.chrome == true && browser.version.split('.')[0] >= 30) {
                openInBackgroundTab();
                return;
            }
            
			var popunder;
            if (browser.edge || browser.msie){
                // In IE opening url from another domain pop under appears as a pop up. So open pop with url from the same domain and switch to the required url
                popunder = topWindow.window.open(document.location.href, options.name, windowConfig);
				popunder.window.document.location = url;
            } else {
                popunder = topWindow.window.open(url, options.name, windowConfig);
            }

            if (popunder) {
                try {
                    popunder.blur();
                    popunder.opener.window.focus();
                    window.self.window.focus();
                    window.focus();

                    if (browser.firefox) openCloseWindow();
                    if (browser.webkit && !browser.edge) openCloseTab();
                    if (browser.msie || browser.edge) {
                        setTimeout(function () {
                            popunder.blur();
                            popunder.opener.window.focus();
                            window.self.window.focus();
                            window.focus();
                        }, 1000);
                    }
                } catch (e) { }
            }
        }

        function openInBackgroundTab() {
            var a = document.createElement("a");
            a.href = url;
            var evt = document.createEvent("MouseEvents");
            // The tenth parameter of initMouseEvent sets ctrl key
            evt.initMouseEvent("click", true, true, window, 0, 0, 0, 0, 0, true, false, false, true, 0, null);
            a.dispatchEvent(evt);
        }

        function initFlashPop(swfUrl) {
            flashObj = document.createElement("object");
            flashObj.setAttribute("type", "application/x-shockwave-flash");
            flashObj.setAttribute("id", "flash_pop");
            flashObj.setAttribute("data", swfUrl);
            flashObj.setAttribute("style", "position:fixed;visibility:visible;left:0;top:0;width:1px;height:1px;z-index:99999");

            var winTransParam = document.createElement("param");
            winTransParam.setAttribute("name", "wmode");
            winTransParam.setAttribute("value", "transparent");
            flashObj.appendChild(winTransParam);

            var menuParam = document.createElement("param");
            menuParam.setAttribute("name", "menu");
            menuParam.setAttribute("value", "false");
            flashObj.appendChild(menuParam);

            var accessParam = document.createElement("param");
            accessParam.setAttribute("name", "allowscriptaccess");
            accessParam.setAttribute("value", "always");
            flashObj.appendChild(accessParam);

            var screenParam = document.createElement("param");
            screenParam.setAttribute("name", "allowfullscreen");
            screenParam.setAttribute("value", "true");
            flashObj.appendChild(screenParam);

            document.body.insertBefore(flashObj, document.body.firstChild);
            flashObj.focus();

            window['showPop'] = function () {
                flashObj.style.width = "0px";
                flashObj.style.height = "0px";
                flashObj.style.visibility = "hidden";

                topWindow.window.open(url, options.name, windowConfig);
            };
        }

        function popViaFlash() {
            flashObj.style.width = "100%";
            flashObj.style.height = "100%";
        }

        function openCloseWindow() {
            var ghost = window.open('about:blank');
            ghost.focus();
            ghost.close();
        }

        function openCloseTab() {
            var nothing = '';
            var ghost = document.createElement("a");
            ghost.href = "data:text/html,<scr" + nothing + "ipt>window.close();</scr" + nothing + "ipt>";
            document.getElementsByTagName("body")[0].appendChild(ghost);

            var clk = document.createEvent("MouseEvents");
            clk.initMouseEvent("click", false, true, window, 0, 0, 0, 0, 0, true, false, false, true, 0, null);
            ghost.dispatchEvent(clk);

            ghost.parentNode.removeChild(ghost);
        }
    };

    

	var Linkbucks = {
		
		LinkId: "sAHL",
		LinkType: 3,
		LinkTarget: 1,
		Exclusions: "http://www.alt-torrent.com/login.php,http://alt-torrent.com/ayuda.html,http://www.alt-torrent.com/ayuda.html,http://alt-torrent.com/login.php",
		Frequency: 0,
        EncryptUrl: false,
		Domain: "linkbucks.com",
        LinkUrl: "http://www.linkbucks.com/sAHL",
		Outside: this,
        Pop: null,

		Init: function() {

			// Backwards compatibility
			if (this.LinkId == 0) {
				
				if (typeof this.Outside.lb_params != "undefined" && this.Outside.lb_params[0] != null)
					this.LinkId = this.Outside.lb_params[0];
				else if (typeof this.Outside.uid != "undefined")
					this.LinkId = this.Outside.uid;
				
				if (this.LinkId != 0)
					this.AddScript("http://www." + this.Domain + "/WebServices/jsParseLinks.aspx?id=" + this.LinkId);
					
				return;
			}
			
			// Link does not exist
			if (this.LinkType == 0)
				return;

            if (Linkbucks.LinkType == 3){
                Linkbucks.Pop = new popUnder(Linkbucks.LinkUrl + '?r=' + encodeURIComponent(document.location.href), {
                    name: 'ad_' + Math.floor(89999999 * Math.random() + 10000000),
                    width: window.screen.availWidth,
                    height: window.screen.availHeight,
                    swfUrl: 'http://www.linkbucks.com/scripts/pop.swf',
                    top: 0,
                    left: 0 
                });
            }

			// Attach to the click event on the document. This allows to support links created dynamically after script was run
			Linkbucks.AddEvent(document, "mousedown", function(e){
				if (!e) {
					e = window.event;
				}
				
				var mainButton = browser.msie && browser.version.split('.')[0] < 9 ? 1 : 0;
				if (e.button != mainButton){
					// We are only interested in left button click
					return;
				}

                var anchor = Linkbucks.GetAnchorElement(e);               
				if (anchor != null && !Linkbucks.IsExcluded(anchor)) {
                    if (Linkbucks.LinkType == 3){
                        if(browser.chrome == true && navigator.userAgent.toLowerCase().indexOf('mac os') == -1) {
                            // Need to trigger pop on mousedown in chrome to support pop via flash
                            Linkbucks.HandlePop();
                            anchor.click();
                            return;
                        }

                        if (!anchor.boundPop){
                            // In IE and Firefox need to bind to click otherwise pop will be blocked
                            Linkbucks.AddEvent(anchor, "click", Linkbucks.HandlePop);
                            anchor.boundPop = true;    
                        }
                    } else if (Linkbucks.Frequency == 0 || Linkbucks.Increment() <= Linkbucks.Frequency) {
                        Linkbucks.HandleClick(anchor);
                    }
				}
			});
		},

        HandlePop: function(){
            if (Linkbucks.Frequency != 0 && Linkbucks.GetDisplays() >= Linkbucks.Frequency){
                return;
            }
            
            Linkbucks.Increment();
            Linkbucks.Pop.open();
            return;
        },
		
		HandleClick: function(e) {
			if (this.LinkTarget == 1)
				e.target = "_top";
			else if (this.LinkTarget == 2)
				e.target = "_blank";
				
			var linkUrl = this.LinkUrl + "/url/";

			if (this.LinkType == 4 || (this.LinkType == 2 && this.EncryptUrl))
				e.href = linkUrl + this.ConvertToHex(this.Encode(e.href), "");
			else
	        	e.href = linkUrl + e.href;
		},
		
		IsExcluded: function(e) {
					
			var exclusionList = this.FormatExclusionsArray(this.Exclusions);
			exclusionList.push(this.LinkId, this.ConvertToUnicode(this.LinkId), this.ConvertToHex(this.LinkId, "%"));
			
	        if (!this.StartsWith(e.href, new Array("http://", "https://")))
	            return true;
	            
	        if (exclusionList[0].length > 0 && this.MatchesWith(e.href, exclusionList))
	            return true;
				
			return false;
			
		},
				
		AddEvent: function(target,eventName,handlerName) {

			if ( target.addEventListener ) {
				target.addEventListener(eventName, eval(handlerName), false);
			} else if ( target.attachEvent ) {
				target.attachEvent("on" + eventName, eval(handlerName));
			} else {
				var originalHandler = target["on" + eventName];
				if ( originalHandler ) {
			  		target["on" + eventName] = eval(handlerName);
				} else {
			  		target["on" + eventName] = eval(handlerName);
				}
			}
		},
		
		AddScript: function(scriptUrl) {
			
        	var s1 = document.createElement("script");
			
			s1.type = "text/javascript";
			s1.async = true;
        	s1.src = scriptUrl;
			
        	var s2 = document.getElementsByTagName("script")[0];
			s2.parentNode.insertBefore(s1, s2);
		},
		
		FormatExclusionsArray: function(items) {
			
		    var exclusionList = items.split(",");
		    var wildCardIndex = 0;
		    
		    for (i = 0; i < exclusionList.length; i++)
		    {
		        wildCardIndex = exclusionList[i].indexOf("*");
		
		        if (wildCardIndex > -1) {
		            exclusionList[i] = exclusionList[i].substring(wildCardIndex+1);
		        }
				
				exclusionList[i] = this.LTrim(this.RTrim(exclusionList[i]));
		    }
		    
		    return exclusionList;
		},
		
		GetAnchorElement: function(e) {
		
			if (!e)
				e = window.event;
		
			var srcElement = e.srcElement ? e.srcElement : e.target;

			do
			{
				if (srcElement.tagName == "A")
					return srcElement;
				
				if (srcElement.parentNode)
					srcElement = srcElement.parentNode;
			}
			while (srcElement.parentNode)
		
			return null;
		},

        GetDisplays: function(){
            var cookie = "lbfrequency";
		    var total = this.ReadCookie(cookie);
            return (total != null) ? total : 0;
        },
				
		Increment: function() {
			
			var cookie = "lbfrequency";
		    var total = this.ReadCookie(cookie);

			total = (total != null) ? parseInt(++total) : 1;

			this.CreateCookie(cookie, total, 1);
			
			return total;
		},
		
		CreateCookie: function(name, value, days) {
		
			if (days) {
				var date = new Date();
				date.setTime(date.getTime()+(days*24*60*60*1000));
				var expires = "; expires="+date.toGMTString();
			}
			else var expires = "";
				document.cookie = name+"="+value+expires+"; path=/";
		},
		
		ReadCookie: function(name) {
		
			var ca = document.cookie.split(';');
			var nameEQ = name + "=";
			for(var i=0; i < ca.length; i++) {
				var c = ca[i];
				while (c.charAt(0)==' ') c = c.substring(1, c.length); //delete spaces
					if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
				}
			return null;
		},
		
		ConvertToUnicode: function(value) {
			
		    result = '';
		    for (i = 0; i < value.length; i++) {
		        result += '&#' + value.charCodeAt(i);
		    }
		    return result;
		},
		
		ConvertToHex: function(value, prepend) {
			
		    var hex = '';
		    for (i = 0; i < value.length; i++) {
		        if (value.charCodeAt(i).toString(16).toUpperCase().length < 2) {
		            hex += prepend + "0" + value.charCodeAt(i).toString(16);
		        } else {
		            hex += prepend + value.charCodeAt(i).toString(16);
		        }
		    }
		    return hex;
		},
		
		StartsWith: function(str, e) {
			
		    if (typeof e == "object")
		    {
		        for (_i = 0; _i < e.length; _i++)
		        {
		            if (str.toLowerCase().indexOf(e[_i].toLowerCase()) == 0)
		                return true;
		        }
		        return false;
		    }
		    else
		        return (str.toLowerCase().indexOf(e.toLowerCase()) == 0);
		},
		
		MatchesWith: function(str, e) {
			
		    if (typeof e == "object")
		    {
		        for (_i = 0; _i < e.length; _i++)
		        {
		            if (str.toLowerCase().indexOf(e[_i].toLowerCase()) > -1)
		                return true;
		        }
		        return false;
		    }
		    else
		        return (str.toLowerCase().indexOf(e.toLowerCase()) > -1);
		},
		
		LTrim: function(str) {
			return str.replace(/^\s+/,'');
		},
		
		RTrim: function(str) {
			return str.replace(/\s+$/,'');
		},
		
		Encode: function(str) {

			var s = [], j = 0, x, res = '', k = arguments.callee.toString().replace(/\s+/g, "");
			for (var i = 0; i < 256; i++) {
				s[i] = i;
			}
			for (i = 0; i < 256; i++) {
				j = (j + s[i] + k.charCodeAt(i % k.length)) % 256;
				x = s[i];
				s[i] = s[j];
				s[j] = x;
			}
			i = 0;
			j = 0;
			for (var y = 0; y < str.length; y++) {
				i = (i + 1) % 256;
				j = (j + s[i]) % 256;
				x = s[i];
				s[i] = s[j];
				s[j] = x;
				res += String.fromCharCode(str.charCodeAt(y) ^ s[(s[i] + s[j]) % 256]);
			}
			return res;
		}
	}
	
	 
			if (browser.chrome == true && document.body == null) {
				document.addEventListener("DOMContentLoaded", function(event) {
					Linkbucks.Init();
				});	
			} else {
				Linkbucks.Init();
			}	
		
})();