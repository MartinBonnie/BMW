var MAP_TOOLKIT = function() {
	var self = this;
	self.Map = null;
	self.MapProjection = null;
	self.DefaultCursor = null;
	self.VehicleMap = {};
	self.LineMap = {};
	self.LinePoints = new Array();
	self.AllPoints = new Array();
	self.ToDelOverlay = {};
	self.ExtraOverlay = {};
	self.ReferMap = {};
	self.DrivingRoute = null;
	self.FinishRouteHandler = null;
	self.PolicyMap = {};
	self.PlayMap = {};
	self.FactoryMap = {};

	self.StationImage = null;
	self.StationBeginImage = null;
	self.StationEndImage = null;
	self.VehicleImage = null;
	self.StartImage = null;
	self.EndImage = null;
	self.TranImage = null;
	self.StayImage0 = null;
	self.StayImage10 = null;
	self.StayImage20 = null;
	self.StayImage30 = null;
	self.StayImage40 = null;
	self.StayImage50 = null;
	self.StayImage60 = null;
	self.InfoDOM = null;
	self.InfoDemoDOM = null;
	self.InfoDOMA1 = null;
	self.InfoDOMDown = null;
	self.InfoDemoDOMA1 = null;
	self.InfoWindowLayer = null;

	self.initMap = function(instance, div, city) {
		self.Map = new BMap.Map(div, {
			enableHighResolution: true
		});
		self.Map.centerAndZoom(city);
		self.Map.enableScrollWheelZoom();
		self.Map.addEventListener("click", function(){
			if(self.VehicleMap.touchMarker!=null) {
				delete self.VehicleMap.touchMarker;
			} else {
				self.InfoDOM.hide();
			}
		});
		self.MapProjection = self.Map.getMapType().getProjection();
		self.DefaultCursor = self.Map.getDefaultCursor();
		self.DrivingRoute = new BMap.DrivingRoute(self.Map, {
			onSearchComplete : function(result) {
				if(self.DrivingRoute.getStatus() == BMAP_STATUS_SUCCESS) {
					self.formatReferResult(result);
				} else {
					$.showAlert("未找到推荐路线！", "确定");
				}
			}
		});
		self.initStationImage();
		self.initInfoWindowObj();
		self.PolicyMap[BMAP_DRIVING_POLICY_LEAST_TIME] = "最少时间：";
		self.PolicyMap[BMAP_DRIVING_POLICY_LEAST_DISTANCE] = "最短距离：";
		self.PolicyMap[BMAP_DRIVING_POLICY_AVOID_HIGHWAYS] = "避开高速：";
	};
	self.initStationImage = function() {
		self.StationImage = new BMap.Icon("../images/map/station36.png", new BMap.Size(36, 36), {
			anchor : new BMap.Size(14, 34)
		});
		self.StationBeginImage = new BMap.Icon("../images/map/begin36.png", new BMap.Size(36, 36), {
			anchor : new BMap.Size(18, 36)
		});
		self.StationEndImage = new BMap.Icon("../images/map/end36.png", new BMap.Size(36, 36), {
			anchor : new BMap.Size(18, 36)
		});
		self.VehicleImage = new BMap.Icon("../images/map/vehicle.png", new BMap.Size(34, 46), {
			anchor : new BMap.Size(17, 44)
		});
		self.StartImage = new BMap.Icon("../images/map/start.png", new BMap.Size(37, 46), {
			anchor : new BMap.Size(18, 44)
		});
		self.EndImage = new BMap.Icon("../images/map/end.png", new BMap.Size(37, 46), {
			anchor : new BMap.Size(18, 44)
		});
		self.TranImage = new BMap.Icon("../images/map/transit.png", new BMap.Size(37, 46), {
			anchor : new BMap.Size(18, 44)
		});
		self.StayImage0 = new BMap.Icon("../images/map/stay0.png", new BMap.Size(37, 46), {
			anchor : new BMap.Size(18, 44)
		});
		self.StayImage10 = new BMap.Icon("../images/map/stay10.png", new BMap.Size(37, 46), {
			anchor : new BMap.Size(18, 44)
		});
		self.StayImage20 = new BMap.Icon("../images/map/stay20.png", new BMap.Size(37, 46), {
			anchor : new BMap.Size(18, 44)
		});
		self.StayImage30 = new BMap.Icon("../images/map/stay30.png", new BMap.Size(37, 46), {
			anchor : new BMap.Size(18, 44)
		});
		self.StayImage40 = new BMap.Icon("../images/map/stay40.png", new BMap.Size(37, 46), {
			anchor : new BMap.Size(18, 44)
		});
		self.StayImage50 = new BMap.Icon("../images/map/stay50.png", new BMap.Size(37, 46), {
			anchor : new BMap.Size(18, 44)
		});
		self.StayImage60 = new BMap.Icon("../images/map/stay60.png", new BMap.Size(37, 46), {
			anchor : new BMap.Size(18, 44)
		});
	};
	self.initInfoWindowObj = function() {
		self.ClickWhere = "marker";
		var html = "<div id=\"infoWindow\" class=\"map_tab\"><span>";
		html += "<a id=\"info_a_1\" class=\"map_button\"></a>";
		html += "</span>";
		html += "<a id=\"info_down\" class=\"arrowDown\"></a>";
		html += "<a class=\"arrowUp\"></a>";
		html += "</div>";
		html += "<div id=\"infoWindowDemo\" class=\"map_tab demo\">";
		html += "<span>";
		html += "<a id=\"info_demo_a_1\" class=\"map_button\"></a>";
		html += "</span></div>";
		$("body").append(html);
		self.InfoDOM = $("#infoWindow");
		self.InfoDemoDOM = $("#infoWindowDemo");
		self.InfoDOMA1 = $("#info_a_1");
		self.InfoDOMDown = $("#info_down");
		self.InfoDemoDOMA1 = $("#info_demo_a_1");
		self.InfoWindowLayer = new InfoWindowObj(self.Map.getCenter(), 0);
		self.Map.addOverlay(self.InfoWindowLayer);
	};
	var InfoWindowObj = function(point, width) {
		this._point = point;
		this._width = width;
	};
	InfoWindowObj.prototype = new BMap.Overlay();
	InfoWindowObj.prototype.initialize = function(map) {
		this._map = map;
		map.getPanes().floatPane.appendChild(self.InfoDOM[0]);
		return self.InfoDOM[0];
	};
	InfoWindowObj.prototype.draw = function() {
		var offset = parseInt(this._width / 4, 10);
		var position = this._map.pointToOverlayPixel(this._point);
		self.InfoDOM.css({
			"left" : (position.x - offset) + "px",
			"top" : (position.y - 80) + "px"
		});
		self.InfoDOMDown.css("margin-left", (offset - 6) + "px");
	};
	InfoWindowObj.prototype.setPointAndWidth = function(point, width) {
		this._point = point;
		this._width = width;
		self.InfoDOM.width(this._width);
		this.draw();
		self.InfoDOM.show();
	};

	self.clearMap = function() {
		if(self.PlayMap.vehicle != null) {
			self.cancelPlayLine();
		}
		for(var key in self.ToDelOverlay) {
			self.Map.removeOverlay(self.ToDelOverlay[key]);
		}
		for(var key in self.ExtraOverlay) {
			self.Map.removeOverlay(self.ExtraOverlay[key]);
		}
		self.ToDelOverlay = {};
		self.ExtraOverlay = {};
		self.VehicleMap = {};
		self.ReferMap = {};
		self.LinePoints = new Array();
		self.AllPoints = new Array();
		self.InfoDOM.hide();
	};
	self.clearLine = function(){
		if(self.PlayMap.vehicle != null) {
			self.cancelPlayLine();
		}
		for(var key in self.ToDelOverlay) {
			self.Map.removeOverlay(self.ToDelOverlay[key]);
		}
		for(var key in self.ExtraOverlay) {
			self.Map.removeOverlay(self.ExtraOverlay[key]);
		}
		self.ToDelOverlay = {};
		self.ExtraOverlay = {};
		self.VehicleMap = {};
		self.LinePoints = new Array();
		self.InfoDOM.hide();
	};
	self.clearReferLine = function() {
		self.InfoDOM.hide();
		self.Map.setDefaultCursor(self.DefaultCursor);
		self.Map.removeEventListener("click", self.addStationMarker);
		if(self.ExtraOverlay["referMarker"] != null) {
			self.Map.removeOverlay(self.ExtraOverlay["referMarker"]);
			delete self.ExtraOverlay["referMarker"];
			delete self.VehicleMap["referMarker"];
		}
		if(self.ReferMap.showLine != null) {
			self.Map.removeOverlay(self.ExtraOverlay["line_refer_" + self.ReferMap.showLine]);
			delete self.ExtraOverlay["line_refer_" + self.ReferMap.showLine];
		}
		self.ReferMap = {};
	};
	self.clearFactoryScope = function(){
		self.InfoDOM.hide();
		self.Map.setDefaultCursor(self.DefaultCursor);
		self.Map.removeEventListener("click", self.addFactoryPoint);
		for(var key in self.ExtraOverlay) {
			self.Map.removeOverlay(self.ExtraOverlay[key]);
		}
		self.AllPoints = new Array();
		self.ExtraOverlay = {};
		self.VehicleMap = {};
		self.FactoryMap = {};
	};
	
	
	self.showVehiclePosition = function(vehicleList){
		var _item, _marker, _point;
		for(var i=0; i<vehicleList.length; i++) {
			_item = vehicleList[i];
			if(_item.stateVlng==0 || _item.stateVlat==0) {
				continue;
			}
			_point = new BMap.Point(_item.stateVlng, _item.stateVlat);
			self.AllPoints.push(_point);
			self.VehicleMap[_item.stateVid] = {};
			self.VehicleMap[_item.stateVid].title = _item.stateVno+(_item.stateDname==""?"(暂无)":"("+_item.stateDname+")");
			self.VehicleMap[_item.stateVid].point = _point;
			_marker = new BMap.Marker(_point);
			_marker.setIcon(self.VehicleImage); 
			(function() {
				var vehicleId = _item.stateVid;
				_marker.addEventListener("click", function() {
					self.markerClickStationHandler(vehicleId);
				});
				_marker.addEventListener("mouseover", function() {
					self.markerClickStationHandler(vehicleId);
				});
				_marker.addEventListener("mouseout", function() {
					self.InfoDOM.hide();
				});
			})();
			self.Map.addOverlay(_marker);
			self.ToDelOverlay[_item.stateVid] = _marker;
		}
		self.Map.setViewport(self.AllPoints, {zoomFactor:-1});
	};
	
	self.showVehicleLine = function(vehicleNo, linePoints) {
		var _item, _preType, _preLineId, _line, _isSetStart=false, _index=0;
		_item = linePoints[_index];
		self.AllPoints = linePoints;
		self.LineMap.vno = vehicleNo;
		self.LineMap.duration = 30000;
		self.LineMap.threshold = self.LineMap.threshold==null?1800000:self.LineMap.threshold;
		self.LineMap.totalDis = 0;
		self.LineMap.totalDur = _item.duration;
		self.LineMap.lines = new Array();
		_preType = _item.type;
		_preLineId = _item.id;
		_line = {};
		_line.lineId = _preLineId;
		_line.start = _index;
		_line.dis = 0;
		_line.dur = _item.duration;
		_isSetStart = true;
		for(var i = 1; i < self.AllPoints.length; i++) {
			_index = i;
			_item = self.AllPoints[_index];
			if(_item.type!=_preType) {
				if(_item.type=="01") {
					_line.end = _index;
					_line.dis = _line.dis.toFixed(2);
					self.LineMap.lines.push(_line);
					_isSetStart = false;
				} else if(_item.type=="00") {
					_preLineId = self.AllPoints[_index-1].id;
					_line = {};
					_line.lineId = _preLineId;
					_line.start = _index-1;
					_line.dis = self.AllPoints[_index-1].distance;
					_line.dur = self.AllPoints[_index-1].duration;
					_isSetStart = true;
				}
			}
			if(_item.type=="00") {
				_line.dis += _item.distance;
				_line.dur += _item.duration;
				(self.LineMap.duration>_item.duration)&&(self.LineMap.duration=_item.duration);
			}
			self.LineMap.totalDis += _item.distance;
			self.LineMap.totalDur += _item.duration;
			_preType = _item.type;
		}
		if(_isSetStart) {
			_line.end = _index;
			_line.dur -= _item.duration;
			_line.dis = _line.dis.toFixed(2);
			self.LineMap.lines.push(_line);
		}
		self.LineMap.totalDur -= _item.duration;
		self.LineMap.totalDis = self.LineMap.totalDis.toFixed(2);
		self.viewLine(self.LineMap.lines[0].lineId);
		(self.LineMap.duration<10000)&&(self.LineMap.duration=10000);
		return self.LineMap;
	};

	self.viewLine = function(lineId) {
		if(self.LineMap.nowLineId!=lineId) {
			var _item, _point;
			if(lineId==0) {
				self.LineMap.nowLineId = lineId;
				self.LineMap.nowLineStart = 0;
				self.LineMap.nowLineEnd = self.AllPoints.length-1;
			} else {
				var _line=null;
				for(var i=0; i<self.LineMap.lines.length; i++) {
					if(self.LineMap.lines[i].lineId==lineId) {
						_line = self.LineMap.lines[i];
						break;
					}
				}
				if(_line==null) {
					return;
				}
				self.LineMap.nowLineId = _line.lineId;
				self.LineMap.nowLineStart = _line.start;
				self.LineMap.nowLineEnd = _line.end;
			}
			self.clearLine();
			_item = self.AllPoints[self.LineMap.nowLineStart];
			_point = new BMap.Point(_item.lng, _item.lat);
			self.LinePoints.push(_point);
			self.VehicleMap[_item.id] = {};
			self.VehicleMap[_item.id].title = self.LineMap.vno+",停留"+_item.durationShow+","+_item.addTime;
			self.VehicleMap[_item.id].point = _point;
			self.VehicleMap[_item.id].duration = _item.duration;
			_marker = new BMap.Marker(_point);
			_marker.setIcon(self.StartImage); 
			(function() {
				var gpsId = _item.id;
				_marker.addEventListener("click", function() {
					self.markerClickStationHandler(gpsId);
				});
				_marker.addEventListener("mouseover", function() {
					self.markerClickStationHandler(gpsId);
				});
				_marker.addEventListener("mouseout", function() {
					self.InfoDOM.hide();
				});
			})();
			self.Map.addOverlay(_marker);
			self.ExtraOverlay[_item.id] = _marker;
			for(var i=self.LineMap.nowLineStart+1; i<self.LineMap.nowLineEnd; i++) {
				_item = self.AllPoints[i];
				_point = new BMap.Point(_item.lng, _item.lat);
				self.LinePoints.push(_point);
				if(_item.duration>self.LineMap.threshold) {
					self.VehicleMap[_item.id] = {};
					self.VehicleMap[_item.id].title = self.LineMap.vno+",停留"+_item.durationShow+","+_item.addTime;
					self.VehicleMap[_item.id].point = _point;
					self.VehicleMap[_item.id].duration = _item.duration;
					_marker = new BMap.Marker(_point);
					_marker.setIcon(self.getStayImage(_item.duration)); 
					(function() {
						var gpsId = _item.id;
						_marker.addEventListener("click", function() {
							self.markerClickStationHandler(gpsId);
						});
						_marker.addEventListener("mouseover", function() {
							self.markerClickStationHandler(gpsId);
						});
						_marker.addEventListener("mouseout", function() {
							self.InfoDOM.hide();
						});
					})();
					self.Map.addOverlay(_marker);
					self.ToDelOverlay[_item.id] = _marker;
				}
			}
			_item = self.AllPoints[self.LineMap.nowLineEnd];
			_point = new BMap.Point(_item.lng, _item.lat);
			self.LinePoints.push(_point);
			self.VehicleMap[_item.id] = {};
			self.VehicleMap[_item.id].title = self.LineMap.vno+",终点,"+_item.addTime;
			self.VehicleMap[_item.id].point = _point;
			self.VehicleMap[_item.id].duration = _item.duration;
			_marker = new BMap.Marker(_point);
			_marker.setIcon(self.EndImage); 
			(function() {
				var gpsId = _item.id;
				_marker.addEventListener("click", function() {
					self.markerClickStationHandler(gpsId);
				});
				_marker.addEventListener("mouseover", function() {
					self.markerClickStationHandler(gpsId);
				});
				_marker.addEventListener("mouseout", function() {
					self.InfoDOM.hide();
				});
			})();
			self.Map.addOverlay(_marker);
			self.ExtraOverlay[_item.id] = _marker;
			var line = new BMap.Polyline(self.LinePoints, {
				strokeColor : "#008EE8",
				strokeStyle : "solid",
				strokeWeight : 4,
				strokeOpacity : 0.8,
				enableClicking : false
			});
			self.Map.addOverlay(line);
			self.ExtraOverlay["line"] = line;
		}
		self.Map.setViewport(self.LinePoints);
	};
	
	self.setTimeThreshold = function(threshold){
		if(self.LineMap.threshold==threshold) {
			return;
		} else {
			if(self.LineMap.threshold<threshold) {
				for(var key in self.ToDelOverlay) {
					if(self.VehicleMap[key].duration<threshold) {
						self.Map.removeOverlay(self.ToDelOverlay[key]);
						delete self.ToDelOverlay[key];
						delete self.VehicleMap[key];
					}
				}
			} else {
				var _item, _point;
				for(var i=self.LineMap.nowLineStart+1; i<self.LineMap.nowLineEnd; i++) {
					_item = self.AllPoints[i];
					if(_item.duration<self.LineMap.threshold && _item.duration>threshold) {
						_point = new BMap.Point(_item.lng, _item.lat);
						self.VehicleMap[_item.id] = {};
						self.VehicleMap[_item.id].title = self.LineMap.vno+",停留"+_item.durationShow+","+_item.addTime;
						self.VehicleMap[_item.id].point = _point;
						self.VehicleMap[_item.id].duration = _item.duration;
						_marker = new BMap.Marker(_point);
						_marker.setIcon(self.getStayImage(_item.duration)); 
						(function() {
							var gpsId = _item.id;
							_marker.addEventListener("click", function() {
								self.markerClickStationHandler(gpsId);
							});
							_marker.addEventListener("mouseover", function() {
								self.markerClickStationHandler(gpsId);
							});
							_marker.addEventListener("mouseout", function() {
								self.InfoDOM.hide();
							});
						})();
						self.Map.addOverlay(_marker);
						self.ToDelOverlay[_item.id] = _marker;
					}
				}
			}
			self.LineMap.threshold = threshold;
			self.Map.setViewport(self.LinePoints);
		}
	};

	self.playLine = function(rate) {
		if(self.LineMap.nowLineId==null) {
			return;
		}
		self.PlayMap.rate = rate;
		if(self.PlayMap.vehicle == null) {
			self.PlayMap.index = self.LineMap.nowLineStart;
			var _item, _point, _marker;
			_item = self.AllPoints[self.PlayMap.index];
			_point = new BMap.Point(_item.lng, _item.lat);
			var content = "停留"+_item.durationShow+",速度"+_item.speed+"km/s,"+_item.addTime;
			_marker = self.getVehicleMarker(_point, "vehicle_label", content);
			self.Map.addOverlay(_marker);
			self.PlayMap.vehicle = _marker;
			self.ExtraOverlay["vehicle"] = _marker;
			self.Map.panTo(_point);
			self.moveNext();
		} else {
			self.pausePlayLine();
			self.continuePlayLine();
		}
	};

	self.cancelPlayLine = function() {
		window.clearInterval(self.PlayMap.moveTimer);
		window.clearTimeout(self.PlayMap.stayTimer);
		self.Map.removeOverlay(self.ExtraOverlay["vehicle"]);		
		delete self.ExtraOverlay["vehicle"];
		self.PlayMap = {};
	};

	self.pausePlayLine = function() {
		if(self.PlayMap.vehicle == null) {
			return;
		}
		window.clearInterval(self.PlayMap.moveTimer);
		window.clearTimeout(self.PlayMap.stayTimer);
	};

	self.continuePlayLine = function() {
		if(self.PlayMap.vehicle == null) {
			return;
		}
		var tarItem = self.AllPoints[self.PlayMap.index+1];
		self.PlayMap.vehicle.getLabel().hide();
		self.PlayMap.vehicle.setAnimation(null);
		self.PlayMap.stepTotal = Math.round(self.LineMap.duration*self.PlayMap.stepCurrent/self.PlayMap.stepTotal/self.PlayMap.rate/50);
		self.PlayMap.stepCurrent = 0;
		self.move(self.PlayMap.vehicle.getPosition(), new BMap.Point(tarItem.lng, tarItem.lat));
	};
	
	self.showCurVehicle = function(vehicleNo, linePoints, lineId){
		var _item, _point, _marker;
		_item = linePoints[0];
		self.LineMap.vno = vehicleNo;
		self.LineMap.threshold = 600000;
		_point = new BMap.Point(_item.lng, _item.lat);
		self.LinePoints.push(_point);
		self.VehicleMap[_item.id] = {};
		self.VehicleMap[_item.id].title = self.LineMap.vno+",停留"+_item.durationShow+","+_item.addTime;
		self.VehicleMap[_item.id].point = _point;
		self.VehicleMap[_item.id].duration = _item.duration;
		_marker = new BMap.Marker(_point);
		_marker.setIcon(self.StartImage); 
		(function() {
			var gpsId = _item.id;
			_marker.addEventListener("click", function() {
				self.markerClickStationHandler(gpsId);
			});
			_marker.addEventListener("mouseover", function() {
				self.markerClickStationHandler(gpsId);
			});
			_marker.addEventListener("mouseout", function() {
				self.InfoDOM.hide();
			});
		})();
		self.Map.addOverlay(_marker);
		self.ExtraOverlay[_item.id] = _marker;
		if(linePoints.length==1) {
			var content = self.LineMap.vno+",速度"+_item.speed+"km/h,"+_item.addTime;
			_marker = self.getVehicleMarker(_point, "vehicle_label", content);
			_marker.setAnimation(BMAP_ANIMATION_BOUNCE);
			self.Map.addOverlay(_marker);
			self.LineMap.vehicle = _marker;
			self.ExtraOverlay["vehicle"] = _marker;
			self.Map.centerAndZoom(_point, 18);
			// self.Map.addEventListener("tilesloaded", function(){
				// alert($("#vehicle_label").html());
				// self.Map.removeEventListener("tilesloaded", this);
			// });
		} else {
			for(var i=1; i<linePoints.length; i++) {
				_item = linePoints[i];
				_point = new BMap.Point(_item.lng, _item.lat);
				self.LinePoints.push(_point);
				if(_item.duration>self.LineMap.threshold) {
					self.VehicleMap[_item.id] = {};
					self.VehicleMap[_item.id].title = self.LineMap.vno+",停留"+_item.durationShow+","+_item.addTime;
					self.VehicleMap[_item.id].point = _point;
					self.VehicleMap[_item.id].duration = _item.duration;
					_marker = new BMap.Marker(_point);
					_marker.setIcon(self.getStayImage(_item.duration)); 
					(function() {
						var gpsId = _item.id;
						_marker.addEventListener("click", function() {
							self.markerClickStationHandler(gpsId);
						});
						_marker.addEventListener("mouseover", function() {
							self.markerClickStationHandler(gpsId);
						});
						_marker.addEventListener("mouseout", function() {
							self.InfoDOM.hide();
						});
					})();
					self.Map.addOverlay(_marker);
					self.ToDelOverlay[_item.id] = _marker;
				}
			}
			_item = linePoints[self.AllPoints.length-1];
			_point = new BMap.Point(_item.lng, _item.lat);
			var content = self.LineMap.vno+",速度"+_item.speed+"km/h,"+_item.addTime;
			_marker = self.getVehicleMarker(_point, "vehicle_label", content);
			_marker.setAnimation(BMAP_ANIMATION_BOUNCE);
			self.Map.addOverlay(_marker);
			self.LineMap.vehicle = _marker;
			self.ExtraOverlay["vehicle"] = _marker;
			var line = new BMap.Polyline(self.LinePoints, {
				strokeColor : "#008EE8",
				strokeStyle : "solid",
				strokeWeight : 4,
				strokeOpacity : 0.8,
				enableClicking : false
			});
			self.Map.addOverlay(line);
			self.ExtraOverlay["line"+lineId] = line;
			self.Map.setViewport(self.LinePoints);
			self.Map.panTo(_point);
		}
	};
	
	self.changeCurVehicle = function(linePoints, lineId){
		if(linePoints.length<1) {
			return;
		}
		var _item=null, _point, _marker;
		self.LinePoints = new Array();
		self.LinePoints.push(self.LineMap.vehicle.getPosition());
		for(var i=0; i<linePoints.length; i++) {
			_item = linePoints[i];
			_point = new BMap.Point(_item.lng, _item.lat);
			self.LinePoints.push(_point);
			if(_item.duration>self.LineMap.threshold) {
				self.VehicleMap[_item.id] = {};
				self.VehicleMap[_item.id].title = self.LineMap.vno+",停留"+_item.durationShow+","+_item.addTime;
				self.VehicleMap[_item.id].point = _point;
				self.VehicleMap[_item.id].duration = _item.duration;
				_marker = new BMap.Marker(_point);
				_marker.setIcon(self.getStayImage(_item.duration)); 
				(function() {
					var gpsId = _item.id;
					_marker.addEventListener("click", function() {
						self.markerClickStationHandler(gpsId);
					});
					_marker.addEventListener("mouseover", function() {
						self.markerClickStationHandler(gpsId);
					});
					_marker.addEventListener("mouseout", function() {
						self.InfoDOM.hide();
					});
				})();
				self.Map.addOverlay(_marker);
				self.ToDelOverlay[_item.id] = _marker;
			}
		}
		var line = new BMap.Polyline(self.LinePoints, {
			strokeColor : "#008EE8",
			strokeStyle : "solid",
			strokeWeight : 4,
			strokeOpacity : 0.8,
			enableClicking : false
		});
		self.Map.addOverlay(line);
		self.ExtraOverlay["line"+lineId] = line;
		self.LineMap.vehicle.setPosition(self.LinePoints[self.LinePoints.length-1]);
		var content = self.LineMap.vno+",速度"+_item.speed+"km/h,"+_item.addTime;
		$("#vehicle_label").html(content);
	};

	self.addStationMarker = function(e) {
		self.Map.setDefaultCursor(self.DefaultCursor);
		self.Map.removeEventListener("click", self.addStationMarker);
		self.VehicleMap["referMarker"] = {};
		self.VehicleMap["referMarker"].title = "参考目的地";
		self.VehicleMap["referMarker"].point = e.point;
		var _marker = new BMap.Marker(e.point);
		_marker.setIcon(self.EndImage);
		(function() {
			_marker.addEventListener("click", function() {
				self.markerClickStationHandler("referMarker");
			});
			_marker.addEventListener("mouseover", function() {
				self.markerClickStationHandler("referMarker");
			});
			_marker.addEventListener("mouseout", function() {
				self.InfoDOM.hide();
			});
		})();
		self.Map.addOverlay(_marker);
		self.ExtraOverlay["referMarker"] = _marker;
		self.DrivingRoute.setPolicy(BMAP_DRIVING_POLICY_LEAST_DISTANCE);
		self.DrivingRoute.search(self.LineMap.vehicle.getPosition(), e.point);
		$.hideAlert();
	};

	self.genReferLine = function() {
		self.Map.setDefaultCursor("default");
		self.Map.addEventListener("click", self.addStationMarker);
		self.ReferMap.planData = {};
	};

	self.formatReferResult = function(result) {
		var html = "";
		if(result.getNumPlans() == 0) {
			html = "<div><a class=\"url " + (result.policy == BMAP_DRIVING_POLICY_LEAST_DISTANCE ? "sel" : "") + "\">" + self.PolicyMap[result.policy] + "</a><font style=\"color:#ccc\">暂无推荐路线！</font></div>";
		} else {
			html = "<div><a class=\"url " + (result.policy == BMAP_DRIVING_POLICY_LEAST_DISTANCE ? "sel" : "") + "\" onclick=\"referLineSel('" + result.policy + "', $(this));\">" + self.PolicyMap[result.policy] + result.getPlan(0).getDistance() + ", " + result.getPlan(0).getDuration() + "</a></div>";
			self.ReferMap.planData[result.policy] = result.getPlan(0).getRoute(0).getPath();
		}
		self.FinishRouteHandler(html);
		if(result.policy == BMAP_DRIVING_POLICY_LEAST_DISTANCE) {
			self.showReferLine(result.policy);
			self.DrivingRoute.setPolicy(BMAP_DRIVING_POLICY_LEAST_TIME);
			self.DrivingRoute.search(result.getStart(), result.getEnd());
		} else if(result.policy == BMAP_DRIVING_POLICY_LEAST_TIME) {
			if(self.ReferMap.showLine==null) {
				self.showReferLine(result.policy);
			}
			self.DrivingRoute.setPolicy(BMAP_DRIVING_POLICY_AVOID_HIGHWAYS);
			self.DrivingRoute.search(result.getStart(), result.getEnd());
		} else {
			if(self.ReferMap.showLine==null) {
				self.showReferLine(result.policy);
			}
		}
	};

	self.showReferLine = function(policy) {
		if(self.ReferMap.showLine == policy || self.ReferMap.planData[policy]==null) {
			return;
		}
		if(self.ReferMap.showLine != null) {
			self.Map.removeOverlay(self.ExtraOverlay["line_refer_" + self.ReferMap.showLine]);
			delete self.ExtraOverlay["line_refer_" + self.ReferMap.showLine];
		}
		self.ReferMap.showLine = policy;
		var line = new BMap.Polyline(self.ReferMap.planData[policy], {
			strokeColor : "#008EE8",
			strokeStyle : "dashed",
			strokeWeight : 4,
			strokeOpacity : 0.8,
			enableClicking : false
		});
		self.Map.addOverlay(line);
		self.ExtraOverlay["line_refer_" + self.ReferMap.showLine] = line;
		self.Map.setViewport(self.ReferMap.planData[policy]);
	};
	
	self.getStayImage = function(duration){
		if(duration>3600000) {
			return self.StayImage60;
		} else if(duration>3000000) {
			return self.StayImage50;
		} else if(duration>2400000) {
			return self.StayImage40;
		} else if(duration>1800000) {
			return self.StayImage30;
		} else if(duration>1200000) {
			return self.StayImage20;
		} else if(duration>600000) {
			return self.StayImage10;
		} else {
			return self.StayImage0;
		}
	};

	self.markerClickStationHandler = function(id) {
		self.VehicleMap.touchMarker = true;
		self.InfoDOMA1.html(self.VehicleMap[id].title);
		self.InfoDemoDOMA1.html(self.VehicleMap[id].title);
		self.InfoWindowLayer.setPointAndWidth(self.VehicleMap[id].point, self.InfoDemoDOM.outerWidth());
	};
	
	self.move = function(staPoint,tarPoint){
		var initPos = self.MapProjection.lngLatToPoint(staPoint);
		var targetPos = self.MapProjection.lngLatToPoint(tarPoint);
		self.PlayMap.moveTimer = window.setInterval(function(){
			if(self.PlayMap.stepCurrent==self.PlayMap.stepTotal) {
				window.clearInterval(self.PlayMap.moveTimer);
				self.moveNext(++self.PlayMap.index);
			} else {
				self.PlayMap.stepCurrent++;
				var x = self.moveStyle(initPos.x, targetPos.x, self.PlayMap.stepCurrent, self.PlayMap.stepTotal);
				var y = self.moveStyle(initPos.y, targetPos.y, self.PlayMap.stepCurrent, self.PlayMap.stepTotal);
				var poi = self.MapProjection.pointToLngLat(new BMap.Pixel(x, y));
				self.PlayMap.vehicle.setPosition(poi);
			}
		}, 50);
	};
	
	self.moveNext = function(){
		if(self.PlayMap.index<self.LineMap.nowLineEnd) {
			var staItem = self.AllPoints[self.PlayMap.index];
			var tarItem = self.AllPoints[self.PlayMap.index+1];
			var stayShowTime = Math.round((staItem.duration-self.LineMap.duration)/self.PlayMap.rate);
			(stayShowTime<1000)&&(stayShowTime=1000);
			$("#vehicle_label").html("停留"+staItem.durationShow+",速度"+staItem.speed+"km/s,"+staItem.addTime);
			self.PlayMap.vehicle.getLabel().show();
			self.PlayMap.vehicle.setAnimation(BMAP_ANIMATION_BOUNCE);
			self.PlayMap.stayTimer = window.setTimeout(function(){
				self.PlayMap.vehicle.getLabel().hide();
				self.PlayMap.vehicle.setAnimation(null);
				self.PlayMap.stepTotal = Math.round(self.LineMap.duration/self.PlayMap.rate/50);
				self.PlayMap.stepCurrent = 0;
				self.move(new BMap.Point(staItem.lng, staItem.lat), new BMap.Point(tarItem.lng, tarItem.lat));
			}, stayShowTime);
		} else {
			cancelReplay();
		}
	};

	self.moveStyle = function(initPos, targetPos, stepCurrent, stepTotal) {
		var b = initPos, c = targetPos - initPos, t = stepCurrent, d = stepTotal;
		return c * t / d + b;
	};
	
	self.getVehicleMarker = function(point, contentId, content){
		var _marker = new BMap.Marker(point);
		_marker.setIcon(self.VehicleImage);
		var html = "<div class=\"map_tab\" style=\"display:block;\"><span>";
		html += "<a id=\""+contentId+"\" class=\"map_button\" style=\"border-color:#C30; color:#C30;\">";
		html += content+"</a></span><div style=\"clear:both;\"></div>";
		html += "<a class=\"arrowDown\" style=\"margin-left:20px; border-color: #C30 transparent transparent transparent;\"></a>";
		html += "<a class=\"arrowUp\"></a>";
		html += "</div>";
		var _label = new BMap.Label(html,{
			offset: new BMap.Size(-10, -55)
		});
		_label.setStyle({border:"none", width:"0px", height: "0px"});
		_marker.setLabel(_label);
		_marker.setTop(true);
		return _marker;
	};


	
	self.addFactoryPoint = function(e) {
		if(self.FactoryMap.poi1 == null) {
			self.FactoryMap.poi1 = e.point;
			$.changeAlert("请在地图上点选第二个坐标点！");
			var _marker = new BMap.Marker(e.point);
			_marker.setIcon(self.TranImage);
			self.Map.addOverlay(_marker);
			self.ExtraOverlay["poi1"] = _marker;
		} else if(self.FactoryMap.poi2 == null) {
			self.FactoryMap.poi2 = e.point;
			$.changeAlert("请在地图上点选第三个坐标点！");
			var _marker = new BMap.Marker(e.point);
			_marker.setIcon(self.TranImage);
			self.Map.addOverlay(_marker);
			self.ExtraOverlay["poi2"] = _marker;
		} else if(self.FactoryMap.poi3 == null) {
			self.FactoryMap.poi3 = e.point;
			$.changeAlert("请在地图上点选第四个坐标点！");
			var _marker = new BMap.Marker(e.point);
			_marker.setIcon(self.TranImage);
			self.Map.addOverlay(_marker);
			self.ExtraOverlay["poi3"] = _marker;
		} else {
			self.Map.setDefaultCursor(self.DefaultCursor);
			self.Map.removeEventListener("click", self.addFactoryPoint);
			self.FactoryMap.poi4 = e.point;
			var _marker = new BMap.Marker(e.point);
			_marker.setIcon(self.TranImage);
			self.Map.addOverlay(_marker);
			self.ExtraOverlay["poi4"] = _marker;
			var _polygon = new BMap.Polygon([
				self.FactoryMap.poi1, 
				self.FactoryMap.poi2, 
				self.FactoryMap.poi3, 
				self.FactoryMap.poi4]);
			var swPoint = _polygon.getBounds().getSouthWest();
			var nePoint = _polygon.getBounds().getNorthEast();
			self.Map.removeOverlay(_polygon);
			_polygon = new BMap.Polygon([
				swPoint, 
				new BMap.Point(nePoint.lng, swPoint.lat), 
				nePoint, 
				new BMap.Point(swPoint.lng, nePoint.lat)], {
				strokeColor : "#353C44",
				strokeStyle : "dashed",
				strokeWeight : 2,
				strokeOpacity : 0.8,
				fillColor : "#000",
				fillOpacity : 0.4,
				enableClicking : false
			});
			self.Map.addOverlay(_polygon);
			self.ExtraOverlay["scope"] = _polygon;
			$.hideAlert();
			addOrEditObjShow(swPoint, nePoint);
		}
	};
	self.genFactoryScope = function(obj) {
		self.Map.setDefaultCursor("default");
		self.Map.addEventListener("click", self.addFactoryPoint);
		if(obj!=null) {
			var firPoint = new BMap.Point(obj.factoryFLng, obj.factoryFLat);
			var secPoint = new BMap.Point(obj.factorySLng, obj.factorySLat);
			self.AllPoints.push(firPoint);
			self.AllPoints.push(secPoint);
			var _polygon = new BMap.Polygon([
				firPoint, 
				new BMap.Point(secPoint.lng, firPoint.lat), 
				secPoint, 
				new BMap.Point(firPoint.lng, secPoint.lat)], {
				strokeColor : "#353C44",
				strokeStyle : "dashed",
				strokeWeight : 2,
				strokeOpacity : 0.4,
				fillColor : "#A8C7CE",
				fillOpacity : 0.2,
				enableClicking : false
			});
			self.Map.addOverlay(_polygon);
			self.ExtraOverlay["scope_pre"] = _polygon;
			self.Map.setViewport(self.AllPoints);
		}
	};
	self.showFactoryScope	= function(factoryList){
		var _item, _polygon, _firPoint, _secPoint, _marker;
		for(var i=0; i<factoryList.length; i++) {
			_item = factoryList[i];
			_firPoint = new BMap.Point(_item.factoryFLng, _item.factoryFLat);
			_secPoint = new BMap.Point(_item.factorySLng, _item.factorySLat);
			self.AllPoints.push(_firPoint);
			self.AllPoints.push(_secPoint);
			_polygon = new BMap.Polygon([
				_firPoint, 
				new BMap.Point(_secPoint.lng, _firPoint.lat), 
				_secPoint, 
				new BMap.Point(_firPoint.lng, _secPoint.lat)], {
				strokeColor : "#353C44",
				strokeStyle : "dashed",
				strokeWeight : 2,
				strokeOpacity : 0.8,
				fillColor : "#A8C7CE",
				fillOpacity : 0.4,
				enableClicking : false
			});
			self.VehicleMap[_item.factoryId] = {};
			self.VehicleMap[_item.factoryId].title = _item.factoryName;
			self.VehicleMap[_item.factoryId].point = _polygon.getBounds().getCenter();
			_marker = new BMap.Marker(self.VehicleMap[_item.factoryId].point);
			_marker.setIcon(self.TranImage); 
			(function() {
				var facId = _item.factoryId;
				_marker.addEventListener("click", function() {
					self.markerClickStationHandler(facId);
				});
				_marker.addEventListener("mouseover", function() {
					self.markerClickStationHandler(facId);
				});
				_marker.addEventListener("mouseout", function() {
					self.InfoDOM.hide();
				});
			})();
			self.Map.addOverlay(_marker);
			self.ExtraOverlay[_item.factoryId+"_marker"] = _marker;
			self.Map.addOverlay(_polygon);
			self.ExtraOverlay[_item.factoryId] = _polygon;
		}
		self.Map.setViewport(self.AllPoints);
	};


	
	
	
	
	
	
	
	
	
	
	
	
};
