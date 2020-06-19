<?php
/**
 * Основные параметры WordPress.
 *
 * Скрипт для создания wp-config.php использует этот файл в процессе
 * установки. Необязательно использовать веб-интерфейс, можно
 * скопировать файл в "wp-config.php" и заполнить значения вручную.
 *
 * Этот файл содержит следующие параметры:
 *
 * * Настройки MySQL
 * * Секретные ключи
 * * Префикс таблиц базы данных
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Параметры MySQL: Эту информацию можно получить у вашего хостинг-провайдера ** //
/** Имя базы данных для WordPress */
define( 'DB_NAME', 'db' );

/** Имя пользователя MySQL */
define( 'DB_USER', 'root' );

/** Пароль к базе данных MySQL */
define( 'DB_PASSWORD', '' );

/** Имя сервера MySQL */
define( 'DB_HOST', 'localhost' );

/** Кодировка базы данных для создания таблиц. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Схема сопоставления. Не меняйте, если не уверены. */
define( 'DB_COLLATE', '' );

/**#@+
 * Уникальные ключи и соли для аутентификации.
 *
 * Смените значение каждой константы на уникальную фразу.
 * Можно сгенерировать их с помощью {@link https://api.wordpress.org/secret-key/1.1/salt/ сервиса ключей на WordPress.org}
 * Можно изменить их, чтобы сделать существующие файлы cookies недействительными. Пользователям потребуется авторизоваться снова.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '|@ARfO;~7bt ![gbdk]~-L<`lS!$-^plaCQYB^Vnc=-Y&_Hpi,Es%x{JnVWe$8CW' );
define( 'SECURE_AUTH_KEY',  '8I-qX1U!%&+t&<z4pI,A#pGpMW-3]3:R`urn/]s2C1q2Ed4P0w_^^-i){2?_/6/[' );
define( 'LOGGED_IN_KEY',    '#0fjS-(F9[pOS+6s!NuV]?/)Uz_v?TwFF)RVFzP,Z-$aYCG5jQ|pwYWL-:$CI!LS' );
define( 'NONCE_KEY',        'Di:Si{W;G**uw80:_.G>$<N`;B9C(?3J2|a%Gcp]*zz~]XbA04=23Li>BnLwkr1J' );
define( 'AUTH_SALT',        'c09Ofc,-8)n;s+0KJfQRo,O=/[A;:ZPOmL9iIb}Da$<Tu+.O^5%V;I4+iI;h=lWA' );
define( 'SECURE_AUTH_SALT', 'un8Cz32(rN0wpM=+{%3Wdu6Zoo~4ZWBXPX8#3VYf~^0n&drz^G15`tDvv-FnM.Q;' );
define( 'LOGGED_IN_SALT',   ';r!,WrG*2|QlRqq5#Nt#?*Wbw*SQHJDtIkT5#ufzGvC4a/1bq?6(3/pBz?)DCUS8' );
define( 'NONCE_SALT',       'nX|n(|Af6N[bn}6Y$|z1xh9qSZ/!bE,wU?4tE&u9|NC=&L.W6lU?QXqJXs/{K8lB' );

/**#@-*/

/**
 * Префикс таблиц в базе данных WordPress.
 *
 * Можно установить несколько сайтов в одну базу данных, если использовать
 * разные префиксы. Пожалуйста, указывайте только цифры, буквы и знак подчеркивания.
 */
$table_prefix = 'wp_';

/**
 * Для разработчиков: Режим отладки WordPress.
 *
 * Измените это значение на true, чтобы включить отображение уведомлений при разработке.
 * Разработчикам плагинов и тем настоятельно рекомендуется использовать WP_DEBUG
 * в своём рабочем окружении.
 *
 * Информацию о других отладочных константах можно найти в Кодексе.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
/*define( 'WP_DEBUG', true );

/* Это всё, дальше не редактируем. Успехов! */

/** Абсолютный путь к директории WordPress. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Инициализирует переменные WordPress и подключает файлы. */
require_once( ABSPATH . 'wp-settings.php' );
