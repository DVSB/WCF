{include file='header' pageTitle='wcf.acp.box.'|concat:$action}

<header class="boxHeadline">
	<h1>{if $action == 'add'}{if $isMultilingual}{lang}wcf.acp.box.addMultilingual{/lang}{else}{lang}wcf.acp.box.add{/lang}{/if}{else}{lang}wcf.acp.box.edit{/lang}{/if}</h1>
</header>

{include file='formError'}

{if $success|isset}
	<p class="success">{lang}wcf.global.success.{$action}{/lang}</p>
{/if}

<div class="contentNavigation">
	<nav>
		<ul>
			<li><a href="{link controller='BoxList'}{/link}" class="button"><span class="icon icon16 fa-list"></span> <span>{lang}wcf.acp.menu.link.cms.box.list{/lang}</span></a></li>
				
			{event name='contentNavigationButtons'}
		</ul>
	</nav>
</div>

<form method="post" action="{if $action == 'add'}{link controller='BoxAdd'}{/link}{else}{link controller='BoxEdit' id=$boxID}{/link}{/if}">
	<section class="marginTop">
		<h1>{lang}wcf.global.form.data{/lang}</h1>
		
		<dl{if $errorField == 'name'} class="formError"{/if}>
			<dt><label for="name">{lang}wcf.global.name{/lang}</label></dt>
			<dd>
				<input type="text" id="name" name="name" value="{$name}" required="required" autofocus="autofocus" class="long" />
				{if $errorField == 'name'}
					<small class="innerError">
						{if $errorType == 'empty'}
							{lang}wcf.global.form.error.empty{/lang}
						{else}
							{lang}wcf.acp.box.name.error.{@$errorType}{/lang}
						{/if}
					</small>
				{/if}
			</dd>
		</dl>
		
		<dl{if $errorField == 'boxType'} class="formError"{/if}>
			<dt><label for="boxType">{lang}wcf.acp.box.boxType{/lang}</label></dt>
			<dd>
				<select name="boxType" id="boxType">
					{foreach from=$availableBoxTypes item=availableBoxType}
						<option value="{@$availableBoxType}"{if $availableBoxType == $boxType} selected="selected"{/if}>{lang}wcf.acp.box.boxType.{@$availableBoxType}{/lang}</option>
					{/foreach}
				</select>
				
				{if $errorField == 'boxType'}
					<small class="innerError">
						{if $errorType == 'empty'}
							{lang}wcf.global.form.error.empty{/lang}
						{else}
							{lang}wcf.acp.box.boxType.error.{@$errorType}{/lang}
						{/if}
					</small>
				{/if}
			</dd>
		</dl>
		
		<dl{if $errorField == 'position'} class="formError"{/if}>
			<dt><label for="position">{lang}wcf.acp.box.position{/lang}</label></dt>
			<dd>
				<select name="position" id="position">
					{foreach from=$availablePositions item=availablePosition}
						<option value="{@$availablePosition}"{if $availablePosition == $position} selected="selected"{/if}>{lang}wcf.acp.box.position.{@$availablePosition}{/lang}</option>
					{/foreach}
				</select>
				
				{if $errorField == 'position'}
					<small class="innerError">
						{if $errorType == 'empty'}
							{lang}wcf.global.form.error.empty{/lang}
						{else}
							{lang}wcf.acp.box.position.error.{@$errorType}{/lang}
						{/if}
					</small>
				{/if}
			</dd>
		</dl>
		
		<dl>
			<dt><label for="showOrder">{lang}wcf.acp.box.showOrder{/lang}</label></dt>
			<dd>
				<input type="number" id="showOrder" name="showOrder" value="{@$showOrder}" class="tiny" min="0" />
			</dd>
		</dl>
	
		<dl{if $errorField == 'cssClassName'} class="formError"{/if}>
			<dt><label for="cssClassName">{lang}wcf.acp.box.cssClassName{/lang}</label></dt>
			<dd>
				<input type="text" id="cssClassName" name="cssClassName" value="{$cssClassName}" class="long" />
				{if $errorField == 'cssClassName'}
					<small class="innerError">
						{if $errorType == 'empty'}
							{lang}wcf.global.form.error.empty{/lang}
						{else}
							{lang}wcf.acp.box.cssClassName.error.{@$errorType}{/lang}
						{/if}
					</small>
				{/if}
			</dd>
		</dl>
		
		<dl{if $errorField == 'className'} class="formError"{/if}>
			<dt><label for="className">{lang}wcf.acp.box.className{/lang}</label></dt>
			<dd>
				<input type="text" id="className" name="className" value="{$className}" class="long" />
				{if $errorField == 'className'}
					<small class="innerError">
						{if $errorType == 'empty'}
							{lang}wcf.global.form.error.empty{/lang}
						{else}
							{lang}wcf.acp.box.className.error.{@$errorType}{/lang}
						{/if}
					</small>
				{/if}
			</dd>
		</dl>
		
		<dl>
			<dt></dt>
			<dd>
				<label><input type="checkbox" id="showHeader" name="showHeader" value="1" {if $showHeader}checked="checked" {/if}/> {lang}wcf.acp.box.showHeader{/lang}</label>
			</dd>
		</dl>
			
		<dl>
			<dt></dt>
			<dd>
				<label><input type="checkbox" id="visibleEverywhere" name="visibleEverywhere" value="1" {if $visibleEverywhere}checked="checked" {/if}/> {lang}wcf.acp.box.visibleEverywhere{/lang}</label>
			</dd>
		</dl>
		
		{event name='dataFields'}
	</section>
		
	{if !$isMultilingual}
		<fieldset>
			<legend>content</legend>
		
			<dl{if $errorField == 'title'} class="formError"{/if}>
				<dt><label for="title">{lang}wcf.acp.box.title{/lang}</label></dt>
				<dd>
					<input type="text" id="title" name="title[0]" value="{if !$title[0]|empty}{$title[0]}{/if}" class="long" />
					{if $errorField == 'title'}
						<small class="innerError">
							{if $errorType == 'empty'}
								{lang}wcf.global.form.error.empty{/lang}
							{else}
								{lang}wcf.acp.box.title.error.{@$errorType}{/lang}
							{/if}
						</small>
					{/if}
				</dd>
			</dl>
			
			<dl{if $errorField == 'content'} class="formError"{/if}>
				<dt><label for="content0">{lang}wcf.acp.box.content{/lang}</label></dt>
				<dd>
					<textarea name="content[0]" id="content0" rows="10">{if !$content[0]|empty}{$content[0]}{/if}</textarea>
					{if $errorField == 'content'}
						<small class="innerError">
							{if $errorType == 'empty'}
								{lang}wcf.global.form.error.empty{/lang}
							{else}
								{lang}wcf.acp.box.content.error.{@$errorType}{/lang}
							{/if}
						</small>
					{/if}
				</dd>
			</dl>
		</fieldset>
	{else}
		<div class="tabMenuContainer">
			<nav class="tabMenu">
				<ul>
					{foreach from=$availableLanguages item=availableLanguage}
						{assign var='containerID' value='language'|concat:$availableLanguage->languageID}
						<li><a href="{@$__wcf->getAnchor($containerID)}">{$availableLanguage->languageName}</a></li>
					{/foreach}
				</ul>
			</nav>
			
			{foreach from=$availableLanguages item=availableLanguage}
				<div id="language{@$availableLanguage->languageID}" class="tabMenuContent">
					<div>
						<dl{if $errorField == 'title'} class="formError"{/if}>
							<dt><label for="title{@$availableLanguage->languageID}">{lang}wcf.acp.box.title{/lang}</label></dt>
							<dd>
								<input type="text" id="title{@$availableLanguage->languageID}" name="title[{@$availableLanguage->languageID}]" value="{if !$title[$availableLanguage->languageID]|empty}{$title[$availableLanguage->languageID]}{/if}" class="long" />
								{if $errorField == 'title'}
									<small class="innerError">
										{if $errorType == 'empty'}
											{lang}wcf.global.form.error.empty{/lang}
										{else}
											{lang}wcf.acp.box.title.error.{@$errorType}{/lang}
										{/if}
									</small>
								{/if}
							</dd>
						</dl>
						
						<dl{if $errorField == 'content'} class="formError"{/if}>
							<dt><label for="content{@$availableLanguage->languageID}">{lang}wcf.acp.box.content{/lang}</label></dt>
							<dd>
								<textarea name="content[{@$availableLanguage->languageID}]" id="content{@$availableLanguage->languageID}">{if !$content[$availableLanguage->languageID]|empty}{$content[$availableLanguage->languageID]}{/if}</textarea>
								{if $errorField == 'content'}
									<small class="innerError">
										{if $errorType == 'empty'}
											{lang}wcf.global.form.error.empty{/lang}
										{else}
											{lang}wcf.acp.box.content.error.{@$errorType}{/lang}
										{/if}
									</small>
								{/if}
							</dd>
						</dl>
					</div>
				</div>
			{/foreach}
		</div>
	{/if}
		
	{event name='sections'}
	
	<div class="formSubmit">
		<input type="submit" value="{lang}wcf.global.button.submit{/lang}" accesskey="s" />
		<input type="hidden" name="isMultilingual" value="{@$isMultilingual}" />
		{@SECURITY_TOKEN_INPUT_TAG}
	</div>
</form>

{include file='footer'}
