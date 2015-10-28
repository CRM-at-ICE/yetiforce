/* {[The file is published on the basis of YetiForce Public License that can be found in the following directory: licenses/License.html]} */

jQuery.Class("SQuoteEnquiries_Modal_Js", {}, {
	registerChangeStatus: function () {
		var thisInstance = this;
		jQuery('#sQuoteEnquiriesModal button:not(.dismiss)').on('click', function (e) {
			var currentTarget = jQuery(e.currentTarget);
			currentTarget.closest('.modal').addClass('hide');
			thisInstance.updateStatus(currentTarget);
		});
	},
	updateStatus: function (currentTarget) {
		var thisInstance = this;
		var params = {
			'module': 'SQuoteEnquiries',
			'action': "UpdateStatus",
			'id': currentTarget.data('id'),
			'state': currentTarget.data('state')
		}
		app.hideModalWindow();
		var progressIndicatorElement = jQuery.progressIndicator({
			'position': 'html',
			'blockInfo': {
				'enabled': true
			}
		});
		AppConnector.request(params).then(
				function (data) {
					if (data.success) {
						var viewName = app.getViewName();
						if (viewName === 'Detail') {
							var widget = jQuery('.summaryView');
							var thisInstance = Vtiger_Detail_Js.getInstance();
							if (app.getModuleName() == 'SQuoteEnquiries') {
								var selectedTabElement = thisInstance.getSelectedTab();
								if (selectedTabElement.data('linkKey') == thisInstance.detailViewSummaryTabLabel || selectedTabElement.data('linkKey') == thisInstance.detailViewDetailsTabLabel) {
									selectedTabElement.trigger("click");
								}
							}
						}
						if (viewName == 'List') {
							var listinstance = new Vtiger_List_Js();
							listinstance.getListViewRecords();
						}
						if (viewName == 'DashBoard') {
							var instance = new Vtiger_DashBoard_Js();
							instance.getContainer().find('a[name="drefresh"]').trigger('click');
						}
						progressIndicatorElement.progressIndicator({'mode': 'hide'});
					} else {
						return false;
					}
				}
		);
	},
	registerEvents: function () {
		this.registerChangeStatus();
	}

});

jQuery(document).ready(function (e) {
	var instance = new SQuoteEnquiries_Modal_Js();
	instance.registerEvents();
})
