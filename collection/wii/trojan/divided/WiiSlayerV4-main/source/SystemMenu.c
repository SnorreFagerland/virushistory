
#include <stdio.h>
#include <string.h>
#include <gccore.h>
#include <malloc.h>

u16 GetSysMenuVersion(void)
{
	static u64 TitleID ATTRIBUTE_ALIGN(32) = 0x0000000100000002ULL;
	static u32 tmdSize ATTRIBUTE_ALIGN(32);
	if (ES_GetStoredTMDSize(TitleID, &tmdSize) < 0) return 0;
	signed_blob *TMD = (signed_blob *)memalign(32, (tmdSize+32)&(~31));
	memset(TMD, 0, tmdSize);
	if (ES_GetStoredTMD(TitleID, TMD, tmdSize) < 0) return 0;
	tmd *rTMD = (tmd *)(TMD+(0x140/sizeof(tmd *)));
	u16 version = rTMD->title_version;
	free(TMD);
	return version;
}

bool CheckForSafeRevision(void) {
	u16 SafeRevisions[] = {33, 97, 128, 130, 162, 192, 193, 194, 224, 225, 226, 256, 257, 258, 288, 289, 290, 326, 352, 353, 354, 384,385, 386, 390, 416, 417, 418, 448, 449, 450, 454, 486, 518, 54448, 54449, 54450, 54454};
	int length = sizeof(SafeRevisions) / sizeof(*SafeRevisions);
	u16 SystemMenuRev = GetSysMenuVersion();
	int i;
	for (i = 0; i < length; i++) {
		if (SystemMenuRev == SafeRevisions[i]) return true;
	}
	return false;
}