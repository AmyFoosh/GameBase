package {

	import flash.events.Event;

	public class PlayScreen extends ScreenSuperclass {

		// ---------------------------------------

		// Items that will be displayed on stage.

		private var joystick: Joystick;
		private var player: AssetSuperclass;

		// ---------------------------------------

		public function PlayScreen(scaled: Number, scaled2: Number, screenW: int, screenH: int) {

			super(scaled, scaled2, screenW, screenH);
			init();
		}

		private function init(): void {

			trace("PlayScreen is working.");
		}

		override public function initializeVariables(): void {


		}

		override public function addContent(): void {

			joystick = new Joystick(new JoystickBGMovement, new JoystickAnalogMovement, new Area);
			addChild(joystick);

			joystick.setStartPos(0 + joystick.joystickBG.width / 2, screenH - joystick.joystickBG.height / 2);

			player = new AssetSuperclass();
			player.init(scaled, new Player);
			addChild(player);
		}

		override public function adjustContent(): void {

			player.x = screenW / 2;
			player.y = screenH / 2;
		}

		override public function addListeners(): void {

			addEventListener(Event.ENTER_FRAME, gameLoop, false, 0, true);
		}

		override public function removeListeners(): void {


		}

		private function gameLoop(event: Event): void {

			joystick.tick();

			if (joystick.getJoystickIsClicked) {

				player.x -= 4 * joystick.getDirX;
				player.y -= 4 * joystick.getDirY;
			}
		}



	}
}