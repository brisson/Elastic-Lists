﻿package eu.stefaner.elasticlists.data {	import br.com.stimuli.loading.BulkLoader;	import br.com.stimuli.loading.loadingtypes.LoadingItem;	import flash.events.EventDispatcher;	import flash.system.LoaderContext;	/**	 * 	AssetLoader 	 * 	 *	Can be used to load large amounts of assets sequentially, e.g. thumbnails	 *	load methods return br.com.stimuli.loading.loadingtypes.LoadingItem instances	 *	which can be attached individual listeners	 *	 *	@langversion ActionScript 3.0	 *	@playerversion Flash 10	 *	 *	@author moritz@stefaner.eu	 *	@since  10.05.2008	 */	public class AssetLoader extends EventDispatcher {		//--------------------------------------		// CONSTRUCTOR		//--------------------------------------		public static var loaderContext : LoaderContext = new LoaderContext(true);		public static var bulkLoader : BulkLoader = BulkLoader.createUniqueNamedLoader();		/**		 *	@Constructor		 */		public function AssetLoader() {			super();		}		public static function init() : void {			if(AssetLoader.bulkLoader != null) {				//clean up  - how?			}			AssetLoader.bulkLoader = BulkLoader.createUniqueNamedLoader();		}		public static function loadImage(imageURL : String, id : String = null, priority : int = 0) : LoadingItem {						var options : Object = {};			options.type = BulkLoader.TYPE_IMAGE;			options.context = AssetLoader.loaderContext;			options.priority = priority;						if(id != null) {				options.id = id;			} else {				options.id = imageURL;			}						var l : LoadingItem = AssetLoader.bulkLoader.add(imageURL, options);						if(!AssetLoader.bulkLoader.isRunning) {				AssetLoader.bulkLoader.start();			}						return l;		}		public static function loadImageNext(imageURL : String, id : String = null) : LoadingItem {			return AssetLoader.loadImage(imageURL, id, AssetLoader.bulkLoader.highestPriority + 1);		}		public static function loadText(URL : String, id : String = null, priority : int = 100) : LoadingItem {			var options : Object = {};			options.type = BulkLoader.TYPE_TEXT;			options.priority = priority;						if(id != null) {				options.id = id;			} else {				options.id = URL;			}						var l : LoadingItem = AssetLoader.bulkLoader.add(URL, options);						if(!AssetLoader.bulkLoader.isRunning) {				AssetLoader.bulkLoader.start();			}						return l;		}		public static function loadXML(URL : String, id : String = null, priority : int = 100) : LoadingItem {			var options : Object = {};			options.type = BulkLoader.TYPE_XML;			options.priority = priority;						if(id != null) {				options.id = id;			} else {				options.id = URL;			}						var l : LoadingItem = AssetLoader.bulkLoader.add(URL, options);						if(!AssetLoader.bulkLoader.isRunning) {				AssetLoader.bulkLoader.start();			}						return l;		}		public static function makeImportant(loadingItem : LoadingItem) : void {			// careful: very inefficient			AssetLoader.bulkLoader.changeItemPriority(loadingItem, 5);		}		public static function makeUnimportant(loadingItem : LoadingItem) : void {			// careful: very inefficient			AssetLoader.bulkLoader.changeItemPriority(loadingItem, -5);		}	}}