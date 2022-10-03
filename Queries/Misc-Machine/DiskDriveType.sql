select
count (sys.netbios_name0) as [count], dsk.model0--, dsk.mediatype0, Name0, Size0, sys.user_name0, temp.model0
from v_r_system_valid sys
INNER JOIN v_GS_DISK dsk ON sys.resourceid = dsk.resourceid AND
dsk.MediaType0 LIKE '%Fixed hard disk%'
LEFT OUTER JOIN
(select GSC.Manufacturer0 as [Manufacturer], GSC.model0,GSC.Domainrole0 as [Machine Role], 
GSC.Domainrole0, GSC.resourceID, v_GS_System_Enclosure.chassistypes0
 from v_GS_COMPUTER_SYSTEM as GSC
 join v_GS_System_Enclosure on GSC.resourceID = v_GS_System_Enclosure.resourceID
) as temp on temp.resourceID = sys.resourceID
Group by dsk.model0
order by [count] desc


select
sys.netbios_name0, dsk.model0, dsk.mediatype0, Name0, Size0, sys.user_name0, temp.model0
from v_r_system_valid sys
INNER JOIN v_GS_DISK dsk ON sys.resourceid = dsk.resourceid AND
dsk.MediaType0 LIKE '%Fixed hard disk%'
LEFT OUTER JOIN
(select GSC.Manufacturer0 as [Manufacturer], GSC.model0,GSC.Domainrole0 as [Machine Role], 
GSC.Domainrole0, GSC.resourceID, v_GS_System_Enclosure.chassistypes0
 from v_GS_COMPUTER_SYSTEM as GSC
 join v_GS_System_Enclosure on GSC.resourceID = v_GS_System_Enclosure.resourceID
) as temp on temp.resourceID = sys.resourceID