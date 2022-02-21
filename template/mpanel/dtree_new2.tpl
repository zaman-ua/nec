<ul class="nav">
<!-- dashboard -->
<li>
  <a href="#" onclick="xajax_process_browse_url('?action=splash_xajax&click_from_menu=1'); return false;">
    <i class="material-icons text-primary">home</i>
    <span>{$oLanguage->GetDMessage('Home')}</span>
  </a>
</li>
{if $aAdmin.login == $CheckLogin}
<li>
  <a href="#" onclick="xajax_process_browse_url('?action=admin_regulations&click_from_menu=1'); return false;">
    <i class="material-icons text-primary">line_weight</i>
    <span>{$oLanguage->GetDMessage('Admin regulations')}</span>
  </a>
</li>
{/if}
<!-- /dashboard -->
<!-- Configuration -->
<li>
  <a href="javascript:;">
    <span class="menu-caret">
      <i class="material-icons">arrow_drop_down</i>
    </span>
    <i class="material-icons text-primary">settings</i>
    <span>{$oLanguage->GetDMessage('Configuration')}</span>
  </a>
  <ul class="sub-menu">
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=general_constant&click_from_menu=1'); return false;">
        <span>{$oLanguage->GetDMessage('General constants')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=constant&click_from_menu=1'); return false;">
        <span>{$oLanguage->GetDMessage('Constants')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=currency&click_from_menu=1'); return false;">
        <span>{$oLanguage->GetDMessage('Currencies')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=admin&click_from_menu=1'); return false;">
        <span>{$oLanguage->GetDMessage('Administrators')}</span>
      </a>
    </li>
  </ul>
</li>
<!-- /Configuration -->
<!-- Content -->
<li>
  <a href="javascript:;">
    <span class="menu-caret">
      <i class="material-icons">arrow_drop_down</i>
    </span>
    <i class="material-icons text-primary">folder</i>
    <span>{$oLanguage->GetDMessage('Content')}</span>
  </a>
  <ul class="sub-menu">
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=drop_down&click_from_menu=1'); return false;">
        <span>{$oLanguage->GetDMessage('Dropdown Manager')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=content_editor&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Content Editor')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=banner&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Caorusel Editor')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=drop_down_additional&click_from_menu=1'); return false;">
        <span>{$oLanguage->getDMessage('Dropdown Additional')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=translate_message&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Message translate')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=translate_text&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Text translate')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=template&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Templates')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=news&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('News')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=delivery_type&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Delivery types')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=payment_type&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Payment types')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=rating&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Rating')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=popular_products&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('popular products')}</span>
      </a>
    </li>
  </ul>
</li>
<!-- /Content -->
<!-- Users -->
<li>
  <a href="javascript:;">
    <span class="menu-caret">
      <i class="material-icons">arrow_drop_down</i>
    </span>
    <i class="material-icons text-primary">people</i>
    <span>{$oLanguage->GetDMessage('Users')}</span>
  </a>
  <ul class="sub-menu">
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=customer_group&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Customer groups')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=customer&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Customers')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=manager&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Manager')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=provider_group&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Provider groups')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=provider_region&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Provider regions')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=provider&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Providers')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=complex_margin&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Complex Margin')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=discount&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Dynamic discounts')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=account&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Account')}</span>
      </a>
    </li>
  </ul>
</li>
<!-- /Users -->
<!-- Customer support -->
<li>
  <a href="javascript:;">
    <span class="menu-caret">
      <i class="material-icons">arrow_drop_down</i>
    </span>
    <i class="material-icons text-primary">help</i>
    <span>{$oLanguage->GetDMessage('Customer support')}</span>
  </a>
  <ul class="sub-menu">
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=context_hint&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Context hints')}</span>
      </a>
    </li>
  </ul>
</li>
<!-- /Customer support -->
<!-- Logs -->
<li>
  <a href="javascript:;">
    <span class="menu-caret">
      <i class="material-icons">arrow_drop_down</i>
    </span>
    <i class="material-icons text-primary">assessment</i>
    <span>{$oLanguage->GetDMessage('Logs')}</span>
  </a>
  <ul class="sub-menu">
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=log_finance&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Finance log')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=log_mail&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Mail Queue')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=log_visit&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Visit log')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=log_admin&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Log Admin')}</span>
      </a>
    </li>
  </ul>
</li>
<!-- /Logs -->
<!-- Auto catalog -->
<li>
  <a href="javascript:;">
    <span class="menu-caret">
      <i class="material-icons">arrow_drop_down</i>
    </span>
    <i class="material-icons text-primary">local_shipping</i>
    <span>{$oLanguage->GetDMessage('Auto catalog')}</span>
  </a>
  <ul class="sub-menu">
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=cat&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Catalog list')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=cat_pref&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Cat pref')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=cat_model&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Cat model')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=cat_model_group&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Cat model group')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=price&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Price')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=price_group&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Price group')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=handbook&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Handbook')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=hbparams_editor&click_from_menu=1');  return false;">
        <span>{$oLanguage->getDMessage('Handbook params editor')}</span>
      </a>
    </li>
    <li>
      <a href="#" onclick="xajax_process_browse_url('?action=rubricator&click_from_menu=1');  return false;">
        <span>{$oLanguage->GetDMessage('Rubricator')}</span>
      </a>
    </li>
  </ul>
</li>
<!-- /Auto catalog -->
<li>
  <a href="#" onclick="xajax_process_browse_url('?action=trash&click_from_menu=1'); return false;">
    <i class="material-icons text-primary">archive</i>
    <span>{$oLanguage->GetDMessage('Trash')}</span>
  </a>
</li>
<li>
  <a href="./?action=quit" onclick="document.write(d);">
    <i class="material-icons text-primary">cancel</i>
    <span>{$oLanguage->GetDMessage('Logout')}</span>
  </a>
</li>
</ul>