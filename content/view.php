<?php
namespace content;

class view
{
	public static function config()
	{
		\dash\data::include_css(false);
		\dash\data::bodyclass(null);
	}
}
?>