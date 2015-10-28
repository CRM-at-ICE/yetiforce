{*<!--
/* {[The file is published on the basis of YetiForce Public License that can be found in the following directory: licenses/License.html]} */
-->*}
{strip}
	{assign var=ID value=$RECORD->get('id')}
	{assign var=EDITVIEW_PERMITTED value=isPermitted($MODULE_NAME, 'EditView', $ID)}
	{assign var=DETAILVIEW_PERMITTED value=isPermitted($MODULE_NAME, 'DetailView', $ID)}
	<div class="modal-header">
		<div class="pull-left">
			<h3 class="modal-title">{vtranslate('LBL_SET_RECORD_STATUS', $MODULE_NAME)}</h3>
		</div>
		<div class="pull-right btn-group">
			{if $EDITVIEW_PERMITTED == 'yes'}
				<a href="{$RECORD->getEditViewUrl()}" class="btn btn-default" title="{vtranslate('LBL_EDIT',$MODULE_NAME)}"><span class="glyphicon glyphicon-pencil summaryViewEdit"></span></a>
			{/if}
			{if $DETAILVIEW_PERMITTED == 'yes'}
				<a href="{$RECORD->getDetailViewUrl()}" class="btn btn-default" title="{vtranslate('LBL_SHOW_COMPLETE_DETAILS', $MODULE_NAME)}"><span  class="glyphicon glyphicon-th-list summaryViewEdit"></span></a>
			{/if}
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="modal-body">
		<div class="detailViewInfo">
			<table class="table table-bordered equalSplit detailview-table" style="table-layout:fixed">
				{foreach key=BLOCK_LABEL_KEY item=FIELD_MODEL_LIST from=$RECORD_STRUCTURE}
					{if $FIELD_MODEL_LIST|@count lte 0}{continue}{/if}
					{foreach item=FIELD_MODEL key=FIELD_NAME from=$FIELD_MODEL_LIST}
						{if !$FIELD_MODEL->isViewableInDetailView()}
							{continue}
						{/if}
						<tr>
							<td class="fieldLabel narrowWidthType" nowrap>
								<label class="muted">{vtranslate($FIELD_MODEL->get('label'),$MODULE_NAME)}</label>
							</td>
							<td class="fieldValue narrowWidthType">
								<span class="value">
									{include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getDetailViewTemplateName(),$MODULE_NAME) FIELD_MODEL=$FIELD_MODEL USER_MODEL=$USER_MODEL MODULE=$MODULE_NAME RECORD=$RECORD}
								</span>
							</td>
						</tr>
					{/foreach}
				{/foreach}
			</table>
		</div>
	</div>
	<div class="modal-footer">
		<div class="pull-left">
			{assign var=SQUOTEENQUIRIES value=Settings_SalesProcesses_Module_Model::getConfig('squoteenquiries')}
			{if $SQUOTEENQUIRIES.statuses_close|count eq 0}
				{assign var=STATUS_CLOSE value='LBL_ACCEPTED'}
			{else}
				{assign var=STATUS_CLOSE value=current($SQUOTEENQUIRIES.statuses_close)}
			{/if}
			{if in_array($RECORD->get('squoteenquiries_status'),$SQUOTEENQUIRIES.statuses_close) || $RECORD->get('squoteenquiries_status') eq 'LBL_DRAFT'}
				<button type="button" class="btn btn-danger" data-state='{$STATUS_CLOSE}' data-id='{$ID}'>{vtranslate('LBL_ACCEPTED', $MODULE_NAME)}</button>
			{elseif $RECORD->get('squoteenquiries_status') neq 'LBL_DRAFT'}
				<button type="button" class="btn btn-success" data-state='LBL_DRAFT' data-id='{$ID}'>{vtranslate('LBL_DRAFT', $MODULE_NAME)}</button>
			{/if}
		</div>
		<button type="button" class="btn btn-warning dismiss" data-dismiss="modal">{vtranslate('LBL_CLOSE', $MODULE_NAME)}</button>
	</div>
{/strip}
