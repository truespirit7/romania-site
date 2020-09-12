
<?php

include(get_template_directory() . "/hotelpro/database.php");
// get_template_part( 'hotelpro/database' );

?>

<?php get_header(); ?>

<div id="maintop"></div>

<div id="wrapper">

	<div id="content">

		<div id="main-blog">


		<?php if(is_user_logged_in())
				{?>
				<a href="<?php echo wp_logout_url()?>" class="helperlink"> Выйти </a> 
				<?php } else { ?>
				 <h3>Радуйся, посетивший библиотеку. Будь добр, <a href="/wp-login.php" title="Вход">представься (Войти)</a>, а если ты здесь впервые, то <a href="/wp-login.php?action=register" title="Регистрация">запишись в реестр (Регистрация)</a></h3><br>.
				<?php } ?>
			<?php if (have_posts()) {

				while (have_posts()) {
					the_post();
					get_template_part('desk-mess-mirrored', get_post_format());
				}

				get_template_part('dmm-navigation');
			} else {

				dmm_no_posts_found();
			} ?>
			<?php
			if (is_user_logged_in()) {
				//весь функционал страницы отображения персонажа здесь
				$current_user = wp_get_current_user();
				$current_user_id = $current_user->ID;
				function reserve()
				{
				?>
				 <h1> Бронирование </h1>
    <form class="reserve" action='<?php get_template_directory() ?>/hotelpro/reservation.php' method="POST">
	<h2>Клиент</h2>
        <p>Фамилия:<input type = "text" name = "lastName"></p>
        <p>Имя:<input type = "text" name = "firstName"></p>
		<p>Отчество:<input type = "text" name = "patronomyc"></p>
		<p>Адрес:<input type = "text" name = "address"></p>
		<h2>Забронировать номер</h2>
        <p>Тип номера:
	<select name="roomclass" size="1">
    <option value="Люкс">Люкс</option>
    <option value="Одноместный">Одноместный</option>
    <option value="Двухместный">Двухместный</option>
</select></p>
		<p>Дата поселения:<input type = "date" name = "startDate"></p>
		<p>Количество дней:<input type = "text" name = "countDays"></p>
		<p>Номер комнаты:<input type = "text" name = "roomID"></p>
		<p>Включить завтрак:<input type = "checkbox" name = "breakfast" value = "Да"></p>
		<p class="reservebtn"><input class="submitbtn" type = "submit" name = "reservebutton" value = "Забронировать"/> </p>
	</form>
	
				<?php
			}
			reserve();
			
			?>

			<?php } else { ?>
				<a href="/wp-login.php" title="Members Area Login" rel="home">Войти</a>
			<?php } ?>
		</div>
		<!--end main blog-->

		<?php get_sidebar(); ?>

		<div class="clear"></div>

	</div>
	<!--end content-->

</div>
<!--end wrapper-->

<?php get_footer();
