<style type="text/css">
	.hooray-errors {
	background: #FFE4E4;
		border: 1px solid #ffb1b1;
		margin: 10px 0;
		padding: 10px;
		-webkit-border-radius: 3px;
		-moz-border-radius: 3px;
		border-radius: 3px;
		font-size: 13px;
	}
</style>

<?php if ($error): ?>
<div class="hooray-errors"><?php echo esc_attr($error); ?></div>
<?php endif ?>
<form novalidate="novalidate" method="post" id="registerform" name="registerform">
	<input type="hidden" name="redirect_to">
	<p>
		<label for="user_login"><?php _e('Username', 'hooray') ?>
		<span class="required">*</span><br>
		<input type="text" size="30" class="input" id="user_login" name="user_login" value="<?php echo esc_attr(wp_unslash($user_login)); ?>"></label>
	</p>
	<p>
		<label for="user_email"><?php _e('Email', 'hooray') ?>
		<span class="required">*</span><br>
		<input type="email" size="45" class="input" id="user_email" name="user_email" value="<?php echo esc_attr(wp_unslash($user_email)); ?>"></label>
	</p>
	<p>
		<label for="user_nickname"><?php _e('Nickname', 'hooray') ?><br>
		<input type="text" size="30" class="input" id="user_nickname" name="user_nickname" vale="<?php echo esc_attr(wp_unslash($user_nickname)); ?>"></label>
	</p>
	<p>
		<label for="user_age"><?php _e('Age', 'hooray') ?><br>
			<input type="text" size="15" id="user_age" name="user_age" value="<?php echo esc_attr(wp_unslash($user_age)); ?>">
		</label>
	</p>
	<p>
		<label><?php _e('Sex', 'hooray') ?><br>
			<input type="radio" value="male" id="user_gender_male" name="user_sex" <?php if ($user_sex == 'male') echo 'checked="checked"'; ?>>
			<label for="user_gender_male"><?php _e('Male', 'hooray') ?></label>
			<input type="radio" value="female" id="user_gender_female" name="user_sex" <?php if ($user_sex == 'female') echo 'checked="checked"'; ?>>
			<label for="user_gender_female"><?php _e('Female', 'hooray') ?></label>
		</label>
	</p>
	<p id="reg_passmail"><?php _e('Registration confirmation will be emailed to you.', 'hooray'); ?></p>
	<p class="submit">
		<input type="submit" value="<?php esc_attr_e('Register', 'hooray'); ?>" class="button button-primary button-large" id="wp-submit" name="wp-submit">
	</p>
</form>
