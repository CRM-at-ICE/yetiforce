<?php
/* {[The file is published on the basis of YetiForce Public License that can be found in the following directory: licenses/License.html]} */

class SQuoteEnquiries_DetailView_Model extends Vtiger_DetailView_Model
{

	public function getDetailViewLinks($linkParams)
	{
		$linkModelList = parent::getDetailViewLinks($linkParams);
		$currentUserModel = Users_Privileges_Model::getCurrentUserPrivilegesModel();
		$recordModel = $this->getRecord();
		$moduleName = $recordModel->getModuleName();
		$targetModuleModel = Vtiger_Module_Model::getInstance('RequirementCards');
		if ($currentUserModel->hasModuleActionPermission($targetModuleModel->getId(), 'EditView')) {
			$basicActionLink = array(
				'linktype' => 'DETAILVIEWBASIC',
				'linklabel' => '',
				'linkurl' => "index.php?module=" . $targetModuleModel->getName() . "&view=" . $targetModuleModel->getEditViewName() . "&reference_id=" . $recordModel->getId(),
				'linkicon' => 'glyphicon glyphicon-level-up',
				'linkclass' => 'btn-success',
				'linkhint' => vtranslate('LBL_GENERATE_REQUIREMENTSCARD', $moduleName)
			);
			$linkModelList['DETAILVIEWBASIC'][] = Vtiger_Link_Model::getInstanceFromValues($basicActionLink);
		}
		if (Users_Privileges_Model::isPermitted($moduleName, 'EditView', $recordId) && $currentUserModel->hasModuleActionPermission($this->getModule()->getId(), 'DetailView')) {
			$basicActionLink = [
				'linktype' => 'DETAILVIEW',
				'linklabel' => 'LBL_SET_RECORD_STATUS',
				'linkurl' => '#',
				'linkdata' => ['url' => $recordModel->getModalUrl()],
				'linkicon' => 'glyphicon glyphicon-ok',
				'linkclass' => 'showModal closeQERekord'
			];
			$linkModelList['DETAILVIEW'][] = Vtiger_Link_Model::getInstanceFromValues($basicActionLink);
		}
		return $linkModelList;
	}
}
