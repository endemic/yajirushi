###
@description Shape for basic enemy object
###
define [
	'vectr'
], (Vectr) ->
	class Enemy extends Vectr.Shape
		constructor: (x, y) ->
			super(x, y)

			@shape = 'square';
			@size = 35;
			@speed = 125;
			@solid = true
			@lineWidth = 3;
			@rotation = 270 * 180 / Math.PI
			@color = 
				red: 255
				green: 0
				blue: 0
				alpha: 1

		update: (delta) ->
			super(delta)

			# Find angle to target and move towards it
			if @target?
				@rotation = Math.atan2(@target.position.y - @position.y, @target.position.x - @position.x)
				@velocity.x = Math.cos(@rotation)
				@velocity.y = Math.sin(@rotation)

			# Enforce position w/in screen bounds
			if @position.x + @size / 2 > Vectr.WIDTH then @position.x = Vectr.WIDTH - @size / 2
			if @position.x - @size / 2 < 0 then @position.x = @size / 2
			if @position.y + @size / 2 > Vectr.HEIGHT then @position.y = Vectr.HEIGHT - @size / 2
			if @position.y - @size / 2 < 0 then @position.y = @size / 2