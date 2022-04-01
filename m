Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A304EFBF4
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 23:00:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C23E10E11C;
	Fri,  1 Apr 2022 21:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78DA510E11C
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1648846833;
 bh=KxQVQRlES8bcskm+/UtXbePk3PpsbxaqgbcLCeXKq2c=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZqqCdvSX6L8ljZsrFMlFAL+N+BihGWF875QDQhN9es9x9fyiK/ojG5NK+9M50Xusi
 s65TlbMMl3OTPdGYFPbmR5xhFO8gIm0WZyTjHizYxkXxIcZKs5laVzCPZr7JTWTzEX
 mZANM1Jxa/wKF9eoyadmEhE4eN8p596/ofz0hHY0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.191.12]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mf0BM-1oFnfn38Is-00gW8L; Fri, 01
 Apr 2022 23:00:33 +0200
Message-ID: <d590df41-f508-94a3-77da-654bcb13f1c5@gmx.de>
Date: Fri, 1 Apr 2022 23:00:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] linux/fb.h: Spelling s/palette/palette/
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220216083922.2913515-1-geert@linux-m68k.org>
 <20220217121612.66011b8c@eldfell>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20220217121612.66011b8c@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XFiQDAkufSIyEv+HLNyk/7j1HhPOmGz0LPnrVijS5ORbjKwJ3hK
 WKxTXD3mwD5iiF4jNMsz8BoVtDEU+V2tLlb0f3DiH8TVibBiqFH99UXdhCMAuT686fILEdi
 TRRK6N3YsfnIH8SOYySzPo3JHRZp46i6HPTZFPzVrRwIrw0Q2aMSxMUc081UXAAYwRfJ59X
 /OpUGAERyVHlOu2NuyLZQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HXWYYamFfCc=:8WuzlFC7cW11ZIgGzNWSOL
 DxTFjRqSpbZRINRbHOH1X1XscZxD7XwPbwepttRKr9pqJhjOF/oCXZdSDOtbWNfLReotV2wuy
 wQt/GQIzLIFsF71uGbirD0H6DFZ+oSAEK0RVVbjBL+GKD4FArMaS9FTepwnlL0deliz0XJk/F
 O/W9QgeFUQuKMiv/31CnpytMvYe/3RuwdgojdFx95RRLsB/lLqHCa3MEksyaq7y9zk0oZcfOZ
 7X5PH/R+2mYdMp1vBVRd7L8KEhv89hxekFti160Ir4LmFmG1lRgwS3+On+0sUqUnJ1yN3uxrE
 1kZMb5+h8wOl6Hoy1DFI0Mob0l6hy8/5ooiBNh0kVZeOP+NOqIdeXomqPvqyAzaCLDNxFTEOS
 FpIFyBDFctUN4fAreg55+cKVjixXWRtHolQQ8ZTiQXyytJ7wTkJ9YItGSlcYJj25IpGHiNpaI
 aiSv89eNWiQ2QyQHtTOhkQt19f+kcIzc/95gt3al12DMKpYMS+mnaRLMgxafD6t9v8Tflgeyr
 hH4DTD9bZS3U3CW3sBZCdusLZrsIEnTxCRTRNjFDXbQPSHWtrMPWIf7eYGkfKDxavBT8hrRMc
 vGQ/OF8XMI9+mD9osLkghgt79dp2UMRUXAijpFtK5L/wUyqT7OdmEaQG++g+GiGqzRlrd6SPK
 Fkv1hXPVwR/bSsnbVTfvIWIswUaha1iDgWwrIDugB+hly68Vx2efgioVpq4UYdDyOFOwlajn7
 LEiwmbDR5Gdm7zXoB/MZRNjIZACBEqiMyeXBGXuf7PIfgfTMe8JNrJ2a6o0vsT4Y+x9u/9GGB
 yCS6EZ+pkZv/PUWi3cMpKeaOtODHTI1uVeKuVUABvuTtIHQ8sfnHgpoYRTL+KofRnovD+rm8O
 SO58j3ClwTJfKpvBtAQkNoBbfx1vdx8/kpKyN4mlOAvwsK+XqxPpao2teUlSMw3VugXj72lRC
 q9LSn93ouG+1rKJ06pVnu3Bak+HmrpBSL9O+H0ZjzMkDJBhZeEHFSQrGpPzU6rUvuMiL05SBR
 1mUQLOwIknhYdRgovecZoobzEwizlclPt4fwRCyCYZbo9MXA+YeL33coBEM3W9TPFlDBQNvRi
 myw1Tsew4waUIM=
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/17/22 11:16, Pekka Paalanen wrote:
> On Wed, 16 Feb 2022 09:39:22 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
>> Fix a misspelling of "palette" in a comment.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>>  include/uapi/linux/fb.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/linux/fb.h b/include/uapi/linux/fb.h
>> index 4c14e8be7267761b..3a49913d006c9bf6 100644
>> --- a/include/uapi/linux/fb.h
>> +++ b/include/uapi/linux/fb.h
>> @@ -182,7 +182,7 @@ struct fb_fix_screeninfo {
>>   *
>>   * For pseudocolor: offset and length should be the same for all color
>>   * components. Offset specifies the position of the least significant =
bit
>> - * of the pallette index in a pixel value. Length indicates the number
>> + * of the palette index in a pixel value. Length indicates the number
>>   * of available palette entries (i.e. # of entries =3D 1 << length).
>>   */
>>  struct fb_bitfield {
>
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>

applied.
Thanks!

Helge
