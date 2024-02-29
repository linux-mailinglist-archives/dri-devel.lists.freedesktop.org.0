Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E877086BEC6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 03:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EE710E2BB;
	Thu, 29 Feb 2024 02:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559FA10E2BB
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 02:12:11 +0000 (UTC)
X-UUID: 1088b403429245dea01e142a7af1805d-20240229
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:c1d02493-96cb-4546-8959-9ffc07f8aca9, IP:20,
 URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-INFO: VERSION:1.1.37, REQID:c1d02493-96cb-4546-8959-9ffc07f8aca9, IP:20,
 UR
 L:0,TC:0,Content:-25,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-20
X-CID-META: VersionHash:6f543d0, CLOUDID:e889ed80-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:2402281848067S6I44W8,BulkQuantity:6,Recheck:0,SF:66|24|17|19|44|64|1
 02,TC:0,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:40,QS:nil,BEC:ni
 l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 1088b403429245dea01e142a7af1805d-20240229
Received: from node2.com.cn [(39.156.73.10)] by mailgw
 (envelope-from <yaolu@kylinos.cn>) (Generic MTA)
 with ESMTP id 1491862376; Thu, 29 Feb 2024 10:12:04 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
 by node2.com.cn (NSMail) with SMTP id BB77BB807587;
 Thu, 29 Feb 2024 10:12:03 +0800 (CST)
X-ns-mid: postfix-65DFE7F3-653458262
Received: from [172.20.20.53] (unknown [172.20.20.53])
 by node2.com.cn (NSMail) with ESMTPA id CB0F7B80758A;
 Thu, 29 Feb 2024 02:12:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------0o9oKadFOgs7KUWAmvqT0Cqr"
Message-ID: <d455681a-da88-2e83-ae23-85ca731eed0d@kylinos.cn>
Date: Thu, 29 Feb 2024 10:12:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/imagination: Kconfig: add 'PAGE_SIZE=4K' dependency
Content-Language: en-US
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240228012313.5934-1-yaolu@kylinos.cn>
 <676ec638-9ed0-4f7a-8845-1cd1804a15b2@imgtec.com>
From: yaolu <yaolu@kylinos.cn>
In-Reply-To: <676ec638-9ed0-4f7a-8845-1cd1804a15b2@imgtec.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------0o9oKadFOgs7KUWAmvqT0Cqr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable


=E5=9C=A8 2024/2/28 18:47, Matt Coster =E5=86=99=E9=81=93:
> Hi, thanks for the patch!
>
> On 28/02/2024 01:23, Lu Yao wrote:
>> When 'PAGE_SIZE=3D64K',the following compilation error occurs:
>> "
>>    ../drivers/gpu/drm/imagination/pvr_fw_mips.c: In function
>> =E2=80=98pvr_mips_fw_process=E2=80=99:
>>    ../drivers/gpu/drm/imagination/pvr_fw_mips.c:140:60: error: array
>> subscript 0 is outside the bounds of an interior zero-length array
>> =E2=80=98dma_addr_t[0]=E2=80=99 {aka =E2=80=98long long unsigned int[]=
=E2=80=99}
>> [-Werror=3Dzero-length-bounds]
>>    140 |   boot_data->pt_phys_addr[page_nr] =3D
>> mips_data->pt_dma_addr[src_page_nr] +
>> ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
>>    In file included from ../drivers/gpu/drm/imagination/pvr_fw_mips.c:=
6:
>>    ../drivers/gpu/drm/imagination/pvr_fw_mips.h:30:13: note: while
>> referencing =E2=80=98pt_dma_addr=E2=80=99
>>     30 |  dma_addr_t pt_dma_addr[PVR_MIPS_PT_PAGE_COUNT];
>> "
>>
>> This is because 'PVR_MIPS_PT_PAGE_COUNT' is defined as
>> '(ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * ROGUE_MIPSFW_PAGE_SIZE_4K) \
>>>> PAGE_SHIFT', and under the above conditions, 'PAGE_SHIFT' is '16',
>> 'ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES' is '4','ROGUE_MIPSFW_PAGE_SIZE_=
4K'
>> is '4096',so 'PVR_MIPS_PT_PAGE_COUNT' is '0' causing the member
>> 'pt_dma_addr' to be incorrectly defined.
> The whole MIPS page table system is supposed to be host page-size
> agnostic. In practice, we don=E2=80=99t regularly test on non-4K platfo=
rms so
> this may well be broken in subtle or not-so-subtle (as in this instance=
)
> ways. There has been at least some testing with 64K host pages =E2=80=93=
 the
> configs from TI for the AM62-SK dev boards have that as the default (or
> at least they did when we started working with them).
>
> I=E2=80=99m loathed to accept this patch without at least investigating=
 how deep
> the problems go; the true fix here should be to fix the problems causin=
g
> this build error rather than just gating off non-4K hosts.
>
> I=E2=80=99ll have a dig this afternoon to see what I can find. Did you =
try
> anything to fix this yourself? It would be nice to not duplicate effort
> on this if you have.

No, I haven't tried, and I'm currently disabling the DRM_POWERVR driver. =
Actually,
I don't have any IMG graphics cards. This error was found when  compiling=
 the kernel
randomly.Looks like it's up to you to sort this out reasonably.;)

Regards,
Lu

> Cheers,
> Matt
>
>> Signed-off-by: Lu Yao<yaolu@kylinos.cn>
>> ---
>>   drivers/gpu/drm/imagination/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/ima=
gination/Kconfig
>> index 3bfa2ac212dc..e585922f634d 100644
>> --- a/drivers/gpu/drm/imagination/Kconfig
>> +++ b/drivers/gpu/drm/imagination/Kconfig
>> @@ -3,7 +3,7 @@
>>  =20
>>   config DRM_POWERVR
>>   	tristate "Imagination Technologies PowerVR (Series 6 and later) & I=
MG Graphics"
>> -	depends on ARM64
>> +	depends on (ARM64 && ARM64_PAGE_SHIFT=3D12)
>>   	depends on DRM
>>   	depends on PM
>>   	select DRM_EXEC
--------------0o9oKadFOgs7KUWAmvqT0Cqr
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">=E5=9C=A8 2024/2/28 18:47, Matt Coster=
 =E5=86=99=E9=81=93:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:676ec638-9ed0-4f7a-8845-1cd1804a15b2@imgtec.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Hi, thanks for the patch!

On 28/02/2024 01:23, Lu Yao wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">When 'PAGE_SIZE=3D64K',the=
 following compilation error occurs:
"
  ../drivers/gpu/drm/imagination/pvr_fw_mips.c: In function
=E2=80=98pvr_mips_fw_process=E2=80=99:
  ../drivers/gpu/drm/imagination/pvr_fw_mips.c:140:60: error: array
subscript 0 is outside the bounds of an interior zero-length array
=E2=80=98dma_addr_t[0]=E2=80=99 {aka =E2=80=98long long unsigned int[]=E2=
=80=99}
[-Werror=3Dzero-length-bounds]
  140 |   boot_data-&gt;pt_phys_addr[page_nr] =3D
mips_data-&gt;pt_dma_addr[src_page_nr] +
~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
  In file included from ../drivers/gpu/drm/imagination/pvr_fw_mips.c:6:
  ../drivers/gpu/drm/imagination/pvr_fw_mips.h:30:13: note: while
referencing =E2=80=98pt_dma_addr=E2=80=99
   30 |  dma_addr_t pt_dma_addr[PVR_MIPS_PT_PAGE_COUNT];
"

This is because 'PVR_MIPS_PT_PAGE_COUNT' is defined as
'(ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * ROGUE_MIPSFW_PAGE_SIZE_4K) \
</pre>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">PAGE_SHIFT', and under=
 the above conditions, 'PAGE_SHIFT' is '16',
</pre>
          </blockquote>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">'ROGUE_MIPSFW_MAX_NUM_PAGE=
TABLE_PAGES' is '4','ROGUE_MIPSFW_PAGE_SIZE_4K'
is '4096',so 'PVR_MIPS_PT_PAGE_COUNT' is '0' causing the member
'pt_dma_addr' to be incorrectly defined.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
The whole MIPS page table system is supposed to be host page-size
agnostic. In practice, we don=E2=80=99t regularly test on non-4K platform=
s so
this may well be broken in subtle or not-so-subtle (as in this instance)
ways. There has been at least some testing with 64K host pages =E2=80=93 =
the
configs from TI for the AM62-SK dev boards have that as the default (or
at least they did when we started working with them).

I=E2=80=99m loathed to accept this patch without at least investigating h=
ow deep
the problems go; the true fix here should be to fix the problems causing
this build error rather than just gating off non-4K hosts.

I=E2=80=99ll have a dig this afternoon to see what I can find. Did you tr=
y
anything to fix this yourself? It would be nice to not duplicate effort
on this if you have.
</pre>
    </blockquote>
    <pre>No, I haven't tried, and I'm currently disabling the DRM_POWERVR=
 driver. Actually,=20
I don't have any IMG graphics cards. This error was found when  compiling=
 the kernel=20
randomly.Looks like it's up to you to sort this out reasonably.;)

Regards,
Lu
</pre>
    <blockquote type=3D"cite"
      cite=3D"mid:676ec638-9ed0-4f7a-8845-1cd1804a15b2@imgtec.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
Cheers,
Matt

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Signed-off-by: Lu Yao <a c=
lass=3D"moz-txt-link-rfc2396E" href=3D"mailto:yaolu@kylinos.cn">&lt;yaolu=
@kylinos.cn&gt;</a>
---
 drivers/gpu/drm/imagination/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagin=
ation/Kconfig
index 3bfa2ac212dc..e585922f634d 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -3,7 +3,7 @@
=20
 config DRM_POWERVR
 	tristate "Imagination Technologies PowerVR (Series 6 and later) &amp; I=
MG Graphics"
-	depends on ARM64
+	depends on (ARM64 &amp;&amp; ARM64_PAGE_SHIFT=3D12)
 	depends on DRM
 	depends on PM
 	select DRM_EXEC
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0o9oKadFOgs7KUWAmvqT0Cqr--
