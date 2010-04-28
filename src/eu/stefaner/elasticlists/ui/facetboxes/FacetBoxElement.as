package eu.stefaner.elasticlists.ui.facetboxes {	import eu.stefaner.elasticlists.data.DataItem;	import eu.stefaner.elasticlists.data.FacetValue;	import eu.stefaner.elasticlists.ui.elements.InteractiveNodeSprite;	import flash.display.Sprite;	import flash.events.Event;	import flash.events.MouseEvent;	public class FacetBoxElement extends InteractiveNodeSprite {		public var container : FacetBox;					public var facetValue : FacetValue;		private var _highlighted : Boolean;		public var highlightMarker : Sprite;		public function FacetBoxElement() {			super();		}		// REVISIT: move params to constructor, move rest with onStageInit?		public function init(c : FacetBox, d : FacetValue) : void {			container = c;			facetValue = d;						facetValue.addEventListener(DataItem.SELECTION_STATUS_CHANGE, onSelectionStatusChange, false, 0, true);			facetValue.addEventListener(DataItem.HIGHLIGHT_STATUS_CHANGE, onHighlightStatusChange, false, 0, true);						onHighlightStatusChange();			onSelectionStatusChange();								selectionMarker.cacheAsBitmap = true;						label = facetValue.label;			selected = facetValue.selected;			updateStats();		}		public function updateStats() : void {		};		//---------------------------------------		// EVENT HANDLERS		//---------------------------------------		override protected function onClick(e : MouseEvent) : void {			container.onFacetBoxElementClick(this);		};		override public function onSelectionStatusChange(e : Event = null) : void {			//trace("onSelectionStatusChange " + this);			selected = facetValue.selected;			// bring to front			if(parent && selected) {				parent.setChildIndex(this, parent.numChildren - 1);			}		};		private function onHighlightStatusChange(event : Event = null) : void {			highlighted = facetValue.highlighted;		}		//---------------------------------------		// DISPLAY STATE		//---------------------------------------		public function collapse() : void {		};		public function expand() : void {		};		public function get highlighted() : Boolean {			return _highlighted;		}		public function set highlighted(arg : Boolean) : void {			_highlighted = arg;			if(highlightMarker != null) {				highlightMarker.visible = arg && !selected;			}		}	}}