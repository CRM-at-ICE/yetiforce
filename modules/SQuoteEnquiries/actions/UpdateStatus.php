<?php
/* {[The file is published on the basis of YetiForce Public License that can be found in the following directory: licenses/License.html]} */

class SQuoteEnquiries_UpdateStatus_Action extends Vtiger_IndexAjax_View
{

	public function process(Vtiger_Request $request)
	{
		$moduleName = $request->getModule();
		$recordId = $request->get('id');
		$state = $request->get('state');

		$recordModel = Vtiger_Record_Model::getInstanceById($recordId);
		$recordModel->set('id', $recordId);
		$recordModel->set('squoteenquiries_status', $state);
		$recordModel->set('mode', 'edit');
		$recordModel->save();

		$response = new Vtiger_Response();
		$response->setResult(['success' => true]);
		$response->emit();
	}
}
