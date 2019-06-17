<?php
namespace content_a\quiz\edit;


class view
{
	public static function config()
	{
		\dash\data::page_title(T_("Edit audio"));
		\dash\data::page_desc(' ');
		\dash\data::page_pictogram('edit');

		\dash\data::badge_link(\dash\url::this());
		\dash\data::badge_text(T_('Back to list of audio'));

		$id     = \dash\request::get('id');
		$result = \lib\app\quiz::get($id);
		if(!$result)
		{
			\dash\header::status(403, T_("Invalid audio id"));
		}

		\dash\data::dataRow($result);

		$countryList = \dash\utility\location\countres::$data;
		\dash\data::countryList($countryList);
		\dash\data::qariList(\lib\app\quiz::qari_list());
		\dash\data::typeList(\lib\app\quiz::type_list());
		\dash\data::readtypeList(\lib\app\quiz::readtype_list());


	}
}
?>