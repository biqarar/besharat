<?php
/**
@ In the name Of Allah
* The base configurations of the besharat.
*/


/**
 * save logs in other database
 */
if(!defined('db_log_name'))
{
	define('db_log_name', 'besharat_log');
}


self::$url['protocol'] = 'https';
self::$url['root']     = 'besharat';
self::$url['tld']      = 'com';


// self::$config['visitor'] = true;


self::$language =
[
	'default' => 'fa',
	'list'    => ['fa','en',],
];


self::$config['enter']['force_verify']                = true;


/**
 * call kavenegar template
 */
self::$config['enter']['call']                = true;
self::$config['enter']['call_template_fa'] = 'ermile-fa';
self::$config['enter']['call_template_en'] = 'ermile-en';
/**
 * first signup url
 * main redirect url . signup redirect url
 * DON NOT USE / IN THE FIRST OF THIS PARAMETER!!!
 */
self::$config['enter']['singup_redirect']     = 'a';


/**
 * cronjob urls and status
 */
self::$config['cronjob']['status'] = true;



/**
 * list of units
 */
self::$config['units'] =
[
	1 =>
	[
		'title' => 'toman',
		'desc'  => "Toman",
	],

	2 =>
	[
		'title' => 'dollar',
		'desc'  => "$",
	],
];
// the unit id for default
self::$config['default_unit'] = 1;
// force change unit to this unit
self::$config['force_unit']   = 1;



self::$config['enter']['verify_telegram'] = true;
self::$config['enter']['verify_sms']      = true;
self::$config['enter']['verify_call']     = true;
self::$config['enter']['verify_sendsms']  = false;

self::$config['botscout']                 = 'hIenwLNiGpPOoSk';


// copied from azvir iran quran option detail

self::$social['google']['status']              = false;

self::$config['cloudflare']['status']          = false;

self::$sms['kavenegar']['footer']              = 'besharat.com';

// self::$config['site']['title']                 = "Comprehensive Quran Learning System";
// self::$config['site']['desc']                  = "Manage Quran Learning process in Iran under licence of IR Oghaf";
// self::$config['site']['slogan']                = "Quran for everybody";
// self::$config['site']['logo']                  = "/enterprise/oghaf/images/logo.png";
// self::$config['site']['googleAnalytics']       = "UA-130958695-4";

// self::$config['enterprise']                    = "oghaf";

// self::$config['iranquran']['master_subdomain'] = 'oghaf';

// self::$config['enter']['remember_me']          = false;

// self::$config['parsian']['status']             = false;
// self::$config['zarinpal']['status']            = false;
// self::$config['irkish']['status']              = false;
// self::$config['payir']['status']               = false;
// self::$config['asanpardakht']['status']        = false;

self::$sms['kavenegar']['apikey']             = '627753306D7A782F37527365417239774E536250613038745659706E494A714E';
self::$sms['kavenegar']['header']             = null;
self::$sms['kavenegar']['footer']             = 'IranQuran.ir';

self::$social['telegram']['status']     = true;
self::$social['telegram']['bot']        = 'IranQuranBot';
self::$social['telegram']['hookFolder'] = 'oghafBotTgQuran';
self::$social['telegram']['token']      = '685891989:AAGYwSeASPPnctzkjVzczt_LKINV688XS9U';
self::$social['telegram']['debug']      = false;
self::$social['telegram']['tunnel']     = true;
self::$social['telegram']['hidden']     = true;


self::$config['billing_page'] = false;



?>