Select
            vSMS_SUMDeploymentStatusPerAsset.AssignmentName,
			vSMS_SUMDeploymentStatusPerAsset.DeviceName,
            vSMS_SUMDeploymentStatusPerAsset.StatusDescription,
			vSMS_SUMDeploymentStatusPerAsset.LastComplianceMessageTime,
            vSMS_SUMDeploymentStatusPerAsset.LastEnforcementMessageDesc,
			vSMS_SUMDeploymentStatusPerAsset.LastEnforcementMessageTime,
            vSMS_SUMDeploymentStatusPerAsset.StatusInfo,
			vSMS_ClassicDeploymentAssetDetails.StatusDescription
        from
            vSMS_SUMDeploymentStatusPerAsset
			LEFT OUTER JOIN vSMS_ClassicDeploymentAssetDetails ON vSMS_SUMDeploymentStatusPerAsset.ResourceID = vSMS_ClassicDeploymentAssetDetails.DeviceID
        where
            vSMS_SUMDeploymentStatusPerAsset.AssignmentName like '%[DEPLOYMENT NAME]%' and vSMS_SUMDeploymentStatusPerAsset.AssignmentName not like '%server%'
        order by
            vSMS_SUMDeploymentStatusPerAsset.AssignmentName,
            vSMS_SUMDeploymentStatusPerAsset.StatusDescription,
			vSMS_SUMDeploymentStatusPerAsset.LastEnforcementMessageDesc