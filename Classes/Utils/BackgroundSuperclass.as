package {

	import flash.display.Sprite;
	import flash.display.Bitmap;

	public class BackgroundSuperclass extends Sprite {

		private var object: Bitmap;

		public function init(screenW: Number, screenH: Number, o: Sprite): void {

			object = new BitmapConvertion().convertBackground(screenW, screenH, o);
			addChild(object);
		}


	}
}