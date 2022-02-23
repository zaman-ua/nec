<div class="container-fluid">
    <div class="row">
        <div class="col-xs-2 menu_tab">
            <!-- required for floating -->
            <!-- Nav tabs -->
            <ul class="nav nav-tabs tabs-left" role="tablist">
                <li {if $smarty.request.action=='manager'}class="active"{/if} role="presentation"><a href="/pages/manager"><i class="fa fa-table" aria-hidden="true"></i> <span class="hidden-xs">Заказы</span></a></li>
{*                <li {if $smarty.request.action=='manager_call_me_list'}class="active"{/if} role="presentation"><a href="/pages/manager_call_me_list"><i class="fa fa-phone" aria-hidden="true"></i> <span class="hidden-xs">Звонки</span></a></li>*}
                <li {if $smarty.request.action=='manager_contact_form'}class="active"{/if} role="presentation"><a href="/pages/manager_contact_form"><i class="fa fa-list" aria-hidden="true"></i> <span class="hidden-xs">Форма контактов</span></a></li>
                <li {if $smarty.request.action=='manager_add_product'}class="active"{/if} role="presentation"><a href="/pages/manager_add_product"><i class="fa fa-pencil" aria-hidden="true"></i> <span class="hidden-xs">Добавить продукт</span></a></li>
                <li {if $smarty.request.action=='manager_edit_product'}class="active"{/if} role="presentation"><a href="/pages/manager_edit_product"><i class="fa fa-exchange" aria-hidden="true"></i> <span class="hidden-xs">Редактировать продукт</span></a></li>
{*                <li {if $smarty.request.action=='manager_add_subscribe'}class="active"{/if} role="presentation"><a href="/pages/manager_add_subscribe"><i class="fa fa-envelope" aria-hidden="true"></i> <span class="hidden-xs">Создать рассылку</span></a></li>*}
                <li role="presentation"><a href="#modalExit"><i class="fa fa-sign-out" aria-hidden="true"></i> <span class="hidden-xs">Выйти из админ-панели</span></a></li>
            </ul>
        </div>

        <div class="col-xs-10 content_tab">
            <!-- Tab panes -->
            <div class="tab-content">
                <div class="tab-pane active" role="tabpanel">
                    {$sText}
                </div>
            </div>
        </div>
    </div>
</div>

<div class="remodal" data-remodal-id="modal">
<form action="/" onsubmit="return false;" id="form_delete">
    <button data-remodal-action="close" class="remodal-close"></button>
    <h1>Вы уверены, что хотите удалить продукт?</h1>
    <br>
    <button data-remodal-action="confirm" class="remodal-confirm yesDelete" onclick="xajax_process_browse_url('?action=manager_delete_product&id='+$('#id_delete_product').val()); return false;">Да</button>
    <button data-remodal-action="cancel" class="remodal-cancel">Нет</button>
</form>
</div>

<div class="remodal" data-remodal-id="modalExit">
    <button data-remodal-action="close" class="remodal-close"></button>
    <h1>Вы уверены, что хотите выйти из панели администратора?</h1>
    <br>
    <button data-remodal-action="confirm" class="remodal-confirm yesExit" onclick="document.location='/pages/user_logout'">Да</button>
    <button data-remodal-action="cancel" class="remodal-cancel">Нет</button>
</div>




<!--backend-->
<script src="/js/script.js" type="text/javascript"></script>
<script src="/js/upload_file.js" type="text/javascript"></script>
