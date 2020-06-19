<?php

/**

 */
get_header(); ?>

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
				global $wpdb;
				$characters = $wpdb->get_results("SELECT * FROM characters WHERE userid=$current_user_id");
			?>
				<?php
				if ($characters) {
					//персонаж есть
					//print_r($characters);
					foreach ($characters as $character) {
						//print_r($character);
						$charName = $character->characterName;
						$charLastname = $character->characterLastName;
						$charSex = $character->characterSex;
						$charEstate = $character->characterEstate;
						$charAvatar = $character->characterAvatar;
						$charAge = $character->characterAge;
						$charHealth = $character->characterHealth;
						$charMoney = $character->characterMoney;
						$charJob = $character->characterJob;
						$charBirthplace = $character->characterBirthPlace;
						//перевод названия сословия
						switch ($charEstate) {
							case 'clergy':
								$charclass_ru = "Духовенство";
								break;

							case 'peasantry':
								$charclass_ru = "Крестьянство";
								break;

							case 'nobility':
								$charclass_ru = "Дворянство";
								break;

							case 'merchantry':
								$charclass_ru = "Купечество";
								break;

							default:
								# code...
								break;
						}
						//перевод названия пола
						switch ($charSex) {
							case 'male':
								$charsex_ru = "Мужской";
								break;

							case 'female':
								$charsex_ru = "Женский";
								break;

							default:
								# code...
								break;
						}

				?>
						<div class="charbox">
							<div class="chardescrandlinks">
							</div>
							<div class="imageofhero">
							<img id = "avatar" src="<?php if($charAvatar){echo get_template_directory_uri().'/images/avatars/'.$charAvatar.'.png;';} ?>" alt="">
							</div>
								<p>
									Имя: <?php echo $charName, ' ' . $charLastname; ?>

								</p>
								<p>
									Прозвище(Род): <?php echo $charLastname; ?>

								</p>
								<p>
									Пол: <?php echo $charsex_ru; ?>

								</p>
								<p>
									Родина: <?php echo $charBirthplace; ?>

								</p>
								<p>
									Возраст: <?php echo $charAge; ?>

								</p>
								<p>
									Состояние здоровья: <?php echo $charHealth; ?>

								</p>
								<p>
									Сословие: <?php echo $charclass_ru; ?>

								</p>
								<p>
									Занятость: <?php echo $charJob; ?>

								</p>
								<p>
									Деньги: <?php echo $charMoney; ?> номизм

								</p>

								<div class="clr"></div>
								<div class="clr"></div>
								<div class="hidden">
									<?php get_template_part('formDeleteChar'); ?>
								</div>
								

						</div>
						<div class="clr"></div>
					<?php
					}
					
				} else {
					//персонажей нет DEL
					?>
					<a href="<?php echo home_url('/createcharacter'); ?>" class="createcharbtn"><span>+</span><br>Создать персонажа</a>
					<div class="clr"></div>
					<a href="<?php echo home_url('/createcharacter'); ?>" class="createcharbtn"><span>+</span><br>Создать персонажа</a>
					<div class="clr"></div>
				<?php
				}
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
