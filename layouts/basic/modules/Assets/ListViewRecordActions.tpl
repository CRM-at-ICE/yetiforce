{*<!--
/* {[The file is published on the basis of YetiForce Public License that can be found in the following directory: licenses/License.html]} */
-->*}
{strip}
	<div class="actions pull-right">
		<span class="actionImages">
			<a href="{$LISTVIEW_ENTRY->getFullDetailViewUrl()}">
				<span title="{vtranslate('LBL_SHOW_COMPLETE_DETAILS', $MODULE)}" class="glyphicon glyphicon-th-list alignMiddle"></span>
			</a>&nbsp;
			{if $IS_MODULE_EDITABLE && $LISTVIEW_ENTRY->isEditable()}
				<a href='{$LISTVIEW_ENTRY->getEditViewUrl()}'>
					<span title="{vtranslate('LBL_EDIT', $MODULE)}" class="glyphicon glyphicon-pencil alignMiddle"></span>
				</a>&nbsp;
			{/if}
			{if ($IS_MODULE_EDITABLE && $LISTVIEW_ENTRY->isEditable() && $LISTVIEW_ENTRY->editFieldByModalPermission()) || $LISTVIEW_ENTRY->editFieldByModalPermission(true)}
				{assign var=FIELD_BY_EDIT_DATA value=$LISTVIEW_ENTRY->getFieldToEditByModal()}
				<a class="showModal {$FIELD_BY_EDIT_DATA['listViewClass']}" data-url="{$LISTVIEW_ENTRY->getEditFieldByModalUrl()}">
					<span title="{vtranslate({$FIELD_BY_EDIT_DATA['titleTag']}, $MODULE)}" class="glyphicon {$FIELD_BY_EDIT_DATA['iconClass']} alignMiddle"></span>
				</a>&nbsp;
			{/if}
			{if ($LISTVIEW_ENTRY->rawData['assetstatus'] eq 'PLL_ACCEPTED') && (($IS_MODULE_EDITABLE && $LISTVIEW_ENTRY->isEditable() && $LISTVIEW_ENTRY->editFieldByModalPermission()) || $LISTVIEW_ENTRY->editFieldByModalPermission(true))}
				<a class="showModal" data-url="{$LISTVIEW_ENTRY->getEditFieldByModalUrl()|cat:'&changeEditFieldByModal=assets_renew'}">
					<span title="{vtranslate('LBL_SET_RENEWAL', $MODULE)}" class="glyphicon glyphicon-repeat alignMiddle"></span>
				</a>&nbsp;
			{/if}
			{if $IS_MODULE_DELETABLE && $LISTVIEW_ENTRY->isDeletable()}
				<a class="deleteRecordButton">
					<span title="{vtranslate('LBL_DELETE', $MODULE)}" class="glyphicon glyphicon-trash alignMiddle"></span>
				</a>
			{/if}
		</span>
	</div>
{/strip}
