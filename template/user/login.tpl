<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h3 class="text-center">Вход в панель администратора</h3>
            <form class="login_panel" id="loginForm" action='/' method="post">
                <p class="login_place">Логин</p>
                <p>
                    <input type="text" id="login" name="login" style="color:#000;">
                </p>
                <p class="login_place">Пароль</p>
                <p>
                    <input type="password" id="pass" name="password" style="color:#000;">
                </p>
                <p>
                    <button type="submit" class="btn my_button">Войти</button>
                </p>
				<p>
                    <a href="/" class="btn my_button">На главную</a>
                </p>
				<p id="errorMessage" style="color: red;">
				{if $smarty.request.error_login}
				{$oLanguage->GetMessage("Authorization error. Please check CapsLock, Language and try again")}
				{/if}
				</p>
                <input name="action" value="user_do_login" type="hidden">
            </form>
        </div>
    </div>
</div>