<?php
namespace content_a\quiz\add;

class view
{
	public static function config()
	{
		$countryList = \dash\utility\location\countres::$data;
		\dash\data::countryList($countryList);
		\dash\data::qariList(\lib\app\quiz::qari_list());
		\dash\data::typeList(\lib\app\quiz::type_list());
		\dash\data::readtypeList(\lib\app\quiz::readtype_list());


	}
}
?>