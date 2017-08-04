package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Scaler;
import kha.Image;

import map.Level;
import utils.Controls;

class Project {
	
	static inline var BB_WIDTH:Int = 512;
	static inline var BB_HEIGHT:Int = 512;

	var level:Level;
	var backbuffer:Image;

	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
		backbuffer = Image.createRenderTarget(BB_WIDTH, BB_HEIGHT);
		level = new Level();
	}

	function update(): Void {
		level.update();
	}

	function render(framebuffer: Framebuffer): Void {	
		var g = backbuffer.g2;
		g.begin(true, 0xffcccccc);
		level.render(g);
		g.end();

		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, kha.ScreenRotation.RotationNone);
		framebuffer.g2.end();
	}
}
