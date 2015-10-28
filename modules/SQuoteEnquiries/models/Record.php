<?php
/* {[The file is published on the basis of YetiForce Public License that can be found in the following directory: licenses/License.html]} */

class SQuoteEnquiries_Record_Model extends Vtiger_Record_Model
{
	/**
	 * Function to get modal view url for the record
	 * @return <String> - Record Detail View Url
	 */
	public function getModalUrl()
	{
		return 'index.php?module='.$this->getModuleName().'&view=Modal&record=' . $this->getId();
	}
}
