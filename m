Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C80542BAA19
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 13:30:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15046E8B0;
	Fri, 20 Nov 2020 12:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 644706E8B0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 12:30:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BE86AABD6;
 Fri, 20 Nov 2020 12:30:03 +0000 (UTC)
To: David Laight <David.Laight@ACULAB.COM>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <2c474745ae884de3b4ecb8abe2152bfd@AcuMS.aculab.com>
 <fa5c887e-82d8-5347-ff18-85e3628dadbe@suse.de>
 <c01d2d95f1e64be984cff71e7bdf1c84@AcuMS.aculab.com>
 <c9bae016-413f-0db9-c9ee-d6f39d24a6ab@suse.de>
 <fa6346190d0b4936934d1f1359e5b71f@AcuMS.aculab.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Linux 5.10-rc4; graphics alignment
Message-ID: <fd66bfcc-072a-ddfb-0d12-af4a5207820d@suse.de>
Date: Fri, 20 Nov 2020 13:30:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <fa6346190d0b4936934d1f1359e5b71f@AcuMS.aculab.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Huang, Ray" <ray.huang@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1114191829=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1114191829==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vm9lB6519ChSapDPKnOmK2drTuLaZJtbv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vm9lB6519ChSapDPKnOmK2drTuLaZJtbv
Content-Type: multipart/mixed; boundary="c5GTOMQmsvhydaq0bmwK6mZeZtJrVuYT0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: David Laight <David.Laight@ACULAB.COM>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Huang, Ray"
 <ray.huang@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <fd66bfcc-072a-ddfb-0d12-af4a5207820d@suse.de>
Subject: Re: Linux 5.10-rc4; graphics alignment
References: <2c474745ae884de3b4ecb8abe2152bfd@AcuMS.aculab.com>
 <fa5c887e-82d8-5347-ff18-85e3628dadbe@suse.de>
 <c01d2d95f1e64be984cff71e7bdf1c84@AcuMS.aculab.com>
 <c9bae016-413f-0db9-c9ee-d6f39d24a6ab@suse.de>
 <fa6346190d0b4936934d1f1359e5b71f@AcuMS.aculab.com>
In-Reply-To: <fa6346190d0b4936934d1f1359e5b71f@AcuMS.aculab.com>

--c5GTOMQmsvhydaq0bmwK6mZeZtJrVuYT0
Content-Type: multipart/mixed;
 boundary="------------A0102EFC0C71BFBB0FDA3610"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A0102EFC0C71BFBB0FDA3610
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi

Am 20.11.20 um 12:45 schrieb David Laight:
> From: Thomas Zimmermann
>> Sent: 20 November 2020 11:27
> ...
>>>> You can use drm-tip for testing, where many of the DRM patches go th=
rough.
>>>>
>>>>      https://cgit.freedesktop.org/drm/drm-tip/
>>>>
>>>> It's fairly up-to-date.
>>>
>>> Any idea of tags either side of the 5.10 merge?
>>
>> The final commit before v5.9 appears to be
>>
>>     Fixes: 33c8256b3bcc ("drm/amd/display: Change ABM config init inte=
rface")
>>
>> I'd try this as a good commit. For the bad commit, just try HEAD.
>=20
> HEAD off that tree works.
> Colours ok and no stack backtrace.
>=20
> Ideas??

The good news is that it's been fixed. All you have to do is wait for=20
the fix to hit upstream.

Did you try the patch that Dave linked? If not, go back to v5.10-rc4 and
do

   git am <path to attached file>

The patch is attached. Please report back if this fixes the issue.

Best regards
Thomas

>=20
> 	David
>=20
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, M=
K1 1PT, UK
> Registration No: 1397386 (Wales)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------A0102EFC0C71BFBB0FDA3610
Content-Type: message/rfc822;
 name="[PATCH] drm_vram: fix incorrect flag variable usage..eml"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="[PATCH] drm_vram: fix incorrect flag variable usage..eml"

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: tzimmermann
Received: from director2.suse.de ([192.168.254.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	by imap3-int with LMTPS
	id yAzVIwnHtV+HDwAALh3uQQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <tzimmermann>; Thu, 19 Nov 2020 01:14:49 +0000
Received: from relay2.suse.de ([149.44.160.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	by director2.suse.de with LMTPS
	id oE36IQnHtV97WwAA+2Lczg
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <tzimmermann@imap.suse.de>; Thu, 19 Nov 2020 01:14:49 +0000
Received: by relay2.suse.de (Postfix)
	id 850AC2C171; Thu, 19 Nov 2020 01:14:49 +0000 (UTC)
Received: from relay2.suse.de (localhost [127.0.0.1])
	by relay2.suse.de (Postfix) with ESMTP id 812EF2C166;
	Thu, 19 Nov 2020 01:14:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at relay2.suse.de
X-Spam-Flag: NO
X-Spam-Score: -1.997
X-Spam-Level: 
X-Spam-Status: No, score=-1.997 tagged_above=-9999 required=5
	tests=[BAYES_50=0.8, DKIM_ADSP_CUSTOM_MED=0.001, FORGED_GMAIL_RCVD=1,
	FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
	HEADER_FROM_DIFFERENT_DOMAINS=0.25, IS_MAILMAN_LIST=-1,
	MAILING_LIST_MULTI=-1, RCVD_IN_DNSWL_MED=-2.3,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=no autolearn_force=no
Received: from relay2.suse.de ([127.0.0.1])
	by relay2.suse.de (relay2.suse.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id apiMXxzp3maN; Thu, 19 Nov 2020 01:14:43 +0000 (UTC)
Received: from mx2.suse.de (unknown [149.44.161.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id D4E0D2C143;
	Thu, 19 Nov 2020 01:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTPS id 6BA2AAC22;
	Thu, 19 Nov 2020 01:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED4E899F3;
	Thu, 19 Nov 2020 01:14:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [207.211.30.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AAC899F3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 01:14:36 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-mJW9FnQ6Nna1L09DhX5oQQ-1; Wed, 18 Nov 2020 20:14:30 -0500
X-MC-Unique: mJW9FnQ6Nna1L09DhX5oQQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3464518B62B4;
 Thu, 19 Nov 2020 01:14:28 +0000 (UTC)
Received: from dreadlord-bne-redhat-com.bne.redhat.com (unknown [10.64.32.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 871155C1D7;
 Thu, 19 Nov 2020 01:14:25 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vram: fix incorrect flag variable usage.
Date: Thu, 19 Nov 2020 11:14:23 +1000
Message-Id: <20201119011423.14224-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=airlied@gmail.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: Dave Airlie <airlied@redhat.com>, David Laight <David.Laight@aculab.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Wen Pu <puwen@hygon.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KCkluIDcwNTNlMGVhYjQ3MzEx
OTUwM2Y2NTY1YjRlMzk4ZjlhNzMxMjI0ODEKZHJtL3ZyYW0taGVscGVyOiBzdG9wIHVzaW5nIFRU
TSBwbGFjZW1lbnQgZmxhZ3MKCml0IGFwcGVhcnMgdGhlIGZsYWdzIGdvdCBtaXhlZCB1cC4KClRo
aXMgc2hvdWxkIGZpeCBhIHJlZ3Jlc3Npb24gb24gYXN0ClsgICA2NC43ODIzNDBdIFdBUk5JTkc6
IENQVTogNTEgUElEOiAxOTY0IGF0IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVy
LmM6Mjg0IGRybV9nZW1fdnJhbV9vZmZzZXQrMHgzNS8weDQwIFtkcm1fdnJhbV9oZWxwZXJdClsg
ICA2NC43ODI0MTFdIENQVTogNTEgUElEOiAxOTY0IENvbW06IFhvcmcgTm90IHRhaW50ZWQgNS4x
MC4wLXJjMyAjMTIKWyAgIDY0Ljc4MjQxM10gSGFyZHdhcmUgbmFtZTogVG8gYmUgZmlsbGVkLgpb
ICAgNjQuNzgyNDE5XSBSSVA6IDAwMTA6ZHJtX2dlbV92cmFtX29mZnNldCsweDM1LzB4NDAgW2Ry
bV92cmFtX2hlbHBlcl0KWyAgIDY0Ljc4MjQyNF0gQ29kZTogMDAgNDggODkgZTUgODUgYzAgNzQg
MTcgNDggODMgYmYgNzggMDEgMDAgMDAgMDAgNzQgMTggNDggOGIgODcgODAgMDEgMDAgMDAgNWQg
NDggYzEgZTAgMGMgYzMgMGYgMGIgNDggYzcgYzAgZWQgZmYgZmYgZmYgNWQgYzMgPDBmPiAwYiAz
MSBjMCA1ZCBjMyAwZiAxZiA0NCAwMCAwMCAwZiAxZiA0NCAwMCAwMCA1NSA0OCA4YiA4NyAxOCAw
NgpbICAgNjQuNzgyNDI3XSBSU1A6IDAwMTg6ZmZmZmE5MTI4OTA5ZmE2OCBFRkxBR1M6IDAwMDEw
MjQ2ClsgICA2NC43ODI0MzFdIFJBWDogMDAwMDAwMDAwMDAwMDAwMiBSQlg6IGZmZmY5NWE1YzI1
ZTFlYzAgUkNYOiBmZmZmZmZmZmMwMmI2NjAwClsgICA2NC43ODI0MzNdIFJEWDogZmZmZjk1OWU0
OTgyNDAwMCBSU0k6IGZmZmY5NWE1YzI1ZTBiNDAgUkRJOiBmZmZmOTU5ZTRiMWMyYzAwClsgICA2
NC43ODI0MzRdIFJCUDogZmZmZmE5MTI4OTA5ZmE2OCBSMDg6IDAwMDAwMDAwMDAwMDAwNDAgUjA5
OiBmZmZmOTVhOWM1ZGNiNjg4ClsgICA2NC43ODI0MzZdIFIxMDogMDAwMDAwMDAwMDAwMDAwMCBS
MTE6IDAwMDAwMDAwMDAwMDAwMDEgUjEyOiBmZmZmOTU5ZTQ5ODI0MDAwClsgICA2NC43ODI0Mzdd
IFIxMzogMDAwMDAwMDAwMDAwMDAwMCBSMTQ6IDAwMDAwMDAwMDAwMDAwMDAgUjE1OiBmZmZmOTVh
NWM1YzU2ZjAwClsgICA2NC43ODI0NDBdIEZTOiAgMDAwMDdmNDg1ZDQ2NmE4MCgwMDAwKSBHUzpm
ZmZmOTVhOWFmY2MwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKWyAgIDY0Ljc4MjQ0
Ml0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwpbICAg
NjQuNzgyNDQ0XSBDUjI6IDAwMDA3ZjQ4NWUyMDIwMDAgQ1IzOiAwMDAwMDAwYzgyYTBlMDAwIENS
NDogMDAwMDAwMDAwMDM1MDZlMApbICAgNjQuNzgyNDQ2XSBDYWxsIFRyYWNlOgpbICAgNjQuNzgy
NDU1XSAgYXN0X2N1cnNvcl9wYWdlX2ZsaXArMHgyMi8weDEwMCBbYXN0XQpbICAgNjQuNzgyNDYw
XSAgYXN0X2N1cnNvcl9wbGFuZV9oZWxwZXJfYXRvbWljX3VwZGF0ZSsweDQ2LzB4NzAgW2FzdF0K
WyAgIDY0Ljc4MjQ3N10gIGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9wbGFuZXMrMHhiZC8weDIy
MCBbZHJtX2ttc19oZWxwZXJdClsgICA2NC43ODI0OTNdICBkcm1fYXRvbWljX2hlbHBlcl9jb21t
aXRfdGFpbF9ycG0rMHgzYS8weDcwIFtkcm1fa21zX2hlbHBlcl0KWyAgIDY0Ljc4MjUwN10gIGNv
bW1pdF90YWlsKzB4OTkvMHgxMzAgW2RybV9rbXNfaGVscGVyXQpbICAgNjQuNzgyNTIxXSAgZHJt
X2F0b21pY19oZWxwZXJfY29tbWl0KzB4MTIzLzB4MTUwIFtkcm1fa21zX2hlbHBlcl0KWyAgIDY0
Ljc4MjU1MV0gIGRybV9hdG9taWNfY29tbWl0KzB4NGEvMHg1MCBbZHJtXQpbICAgNjQuNzgyNTY1
XSAgZHJtX2F0b21pY19oZWxwZXJfdXBkYXRlX3BsYW5lKzB4ZTcvMHgxNDAgW2RybV9rbXNfaGVs
cGVyXQpbICAgNjQuNzgyNTkyXSAgX19zZXRwbGFuZV9hdG9taWMrMHhjYy8weDExMCBbZHJtXQpb
ICAgNjQuNzgyNjE5XSAgZHJtX21vZGVfY3Vyc29yX3VuaXZlcnNhbCsweDEzZS8weDI2MCBbZHJt
XQpbICAgNjQuNzgyNjQ3XSAgZHJtX21vZGVfY3Vyc29yX2NvbW1vbisweGVmLzB4MjIwIFtkcm1d
ClsgICA2NC43ODI2NTRdICA/IHRvbW95b19wYXRoX251bWJlcl9wZXJtKzB4NmYvMHgyMDAKWyAg
IDY0Ljc4MjY4MF0gID8gZHJtX21vZGVfY3Vyc29yX2lvY3RsKzB4NjAvMHg2MCBbZHJtXQpbICAg
NjQuNzgyNzA2XSAgZHJtX21vZGVfY3Vyc29yMl9pb2N0bCsweGUvMHgxMCBbZHJtXQpbICAgNjQu
NzgyNzI3XSAgZHJtX2lvY3RsX2tlcm5lbCsweGFlLzB4ZjAgW2RybV0KWyAgIDY0Ljc4Mjc0OV0g
IGRybV9pb2N0bCsweDI0MS8weDNmMCBbZHJtXQpbICAgNjQuNzgyNzc0XSAgPyBkcm1fbW9kZV9j
dXJzb3JfaW9jdGwrMHg2MC8weDYwIFtkcm1dClsgICA2NC43ODI3ODFdICA/IHRvbW95b19maWxl
X2lvY3RsKzB4MTkvMHgyMApbICAgNjQuNzgyNzg3XSAgX194NjRfc3lzX2lvY3RsKzB4OTEvMHhj
MApbICAgNjQuNzgyNzkyXSAgZG9fc3lzY2FsbF82NCsweDM4LzB4OTAKWyAgIDY0Ljc4Mjc5N10g
IGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKClNpZ25lZC1vZmYtYnk6
IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBXZW4gUHUgPHB1d2VuQGh5Z29u
LmNuPgpDYzogRGF2aWQgTGFpZ2h0IDxEYXZpZC5MYWlnaHRAYWN1bGFiLmNvbT4KQ2M6IENocmlz
dGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fdnJhbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMK
aW5kZXggNTBjYWQwZTRhOTJlLi4yODk2YTA1N2I3NzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
dnJhbV9oZWxwZXIuYwpAQCAtMTQwLDcgKzE0MCw3IEBAIHN0YXRpYyB2b2lkIGRybV9nZW1fdnJh
bV9wbGFjZW1lbnQoc3RydWN0IGRybV9nZW1fdnJhbV9vYmplY3QgKmdibywKIAl1bnNpZ25lZCBp
bnQgYyA9IDA7CiAKIAlpZiAocGxfZmxhZyAmIERSTV9HRU1fVlJBTV9QTF9GTEFHX1RPUERPV04p
Ci0JCXBsX2ZsYWcgPSBUVE1fUExfRkxBR19UT1BET1dOOworCQlpbnZhcmlhbnRfZmxhZyA9IFRU
TV9QTF9GTEFHX1RPUERPV047CiAKIAlnYm8tPnBsYWNlbWVudC5wbGFjZW1lbnQgPSBnYm8tPnBs
YWNlbWVudHM7CiAJZ2JvLT5wbGFjZW1lbnQuYnVzeV9wbGFjZW1lbnQgPSBnYm8tPnBsYWNlbWVu
dHM7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=

--------------A0102EFC0C71BFBB0FDA3610
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
cLA
jgQTAQgAOAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC=
3oj
BQJftODHAAoJEGgNwR1TC3ojZSIIAIV3makffp4P4leU8JSLt0aTNewsOhy7VQzKUtlCw3PKD=
3l/
SuymZhQKgH+n6sijzFauZnZ+x0T+Oy+dDVZb3sNJuuMUDIHw18EO9daZBMcueaS54FGe73lAp=
HUl
7nxyocCxoqIG8+fP+75itV/ls2TSh5rJvjLvHC8J3NqfGlJ/jlSKrQUnzFbXfE5KGWiKNAn+I=
1a2
EE0I7uLpYgkdb8hcjtV9Rxr2ja+GWOaSoqB29P5GUzipkWo4144Q16JBO6QP2R9y/1ZK9VqH2=
5T8
lTKocLAaHCEdpDqY5KI15as9tIxlI1Vh+eqhTh/gwEm1ykO1gmrQ1zvGLDMB1EE6El3NJ1Rob=
21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIbAwULCQgHAgYVC=
gkI
CwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJe/EheAAoJEGgNwR1TC3ojq=
RgI
AIoegtTp1prPzfHgTAuEPd8v58ssHubwi9tg69a8IJ+iMNozhs4iUou84WOLBJNjSieXHZRa8=
fJj
//2/sTuABn38AQ9FcKX9/B49hrdCo6c0WHHKqlPrSTzuXNKYyOdmSFd/pDhBb2Bn5DTxxH5RP=
m/N
U/C9nUlwi7Y+FgBlDNa5h592wmJfv0cJAfvF56C+QL65jHFOFIW9xSaTOAxxMXHGJHXki6Iwa=
aTg
s7QQlKQcd5XvvED1bwLyQ7rq+MEZo5N7IygpQMM3qqGMlCnDdyQ3W95rd0HCWpfa0oVRCOwdu=
SL3
5hG7ONqBpvBj8z5GjSbt4HLJGvpeT0k37qzRExrCXQQQEQIAHRYhBCfo46afO8//uS2Oai53o=
TAR
9dPCBQJbOh1XAAoJEC53oTAR9dPC05AAoIy0HQ2DBDYugQ42P4HfyxfZTIvKAJ0fqNBcBFW9S=
tbR
DEP9cfpNVOv8YMLAcwQQAQgAHRYhBB5dmCGZCKOVTtjMWKpQO8muD0enBQJbOfGzAAoJEKpQO=
8mu
D0enL0wIAM2NTeUDCofBAkbWHGTZopclefbh0xGPYQEfttNyalp0hn1CrVO7OsX5eTjRqgyOa=
1C5
OAsNghCM4PUmrfv5cZ9+sNn9bRM50uVW9IFRlq8wwBY4+7QejJ5gs7DW/0tZIMZ6iTGKK0WEO=
7gd
2K9hXadPBScTdIqXeWH82meiqElnEQL+K9UeGUBrku+1EQIOxwziKwTDlTvhyJ+xmEKj0uWRc=
Ocl
27xLS9XOWPGXcNQBtlZhF8e/E1kFRt5CPP5UBdUCN8qydUadseXivSNDiYob9dyJSFt7G0Bq4=
/ac
Ret5ANtGRWsp8xYJQRossRMWL0w9P8SiIc2IY/JrQrpz29nCwHMEEAEIAB0WIQS7I223sZ7vx=
shH
HWin83wZjDkxgQUCWzoywAAKCRCn83wZjDkxgQaDCACyFuBLQWNvLT8GTDqTf/gETzmtoEM6Y=
r8O
4jbYg05xiFzAqMZctQsm3zHakx2JrimxDvQJRQJQzp5ICJ7J/BOuSL4FE1SPeQIfjm4jyBZGH=
P/W
vgHsT5e3+ZCPePPZO+3irarTKVhaaP70Tpka6EsOCZzO6L8D6tUDkhxMX0ymy7p8w9Yt1eD0o=
Ume
mxrKdS1ulpNJUTBw7gJN8bMowVnycEm6wntxOjrCxuwbkKhFLdn0ejcXQ0UkfbUFKfU64gGBu=
S53
ZlM8XlOhQEIw/FrdXszhR+Tg3Ag130cmJhOrghgOBLzvJfUd6OvDT5VIz0QGbAm8SWlAIIms1=
9Z8
kBsLwsCOBBMBCAA4AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjla=
A3B
HVMLeiMFAl+04McACgkQaA3BHVMLeiPHXAf/SEoZa6CKoOAs1ctEP/hN8cEQqbEiuZ+71nm3u=
/BQ
p/CEUvqGq+iVc8kkpClDbPz5fa9mb+yWwufsnXKOs6ygmEoAEOL7dBZZIaRobBEkB09VXIkx8=
lE0
00grBVtToHUGRfZcMoMZ98XhPGU6lJDN200j/2CV46hQDz6PLySecNjOME05mosbYW5N2JwFd=
uXP
Qx++DjWB32QLBhcOcP3WslTy3PKVe/TcTvk0JpPFMz4UFc+awBVhDgZiGGAW3xLZRYyhpoAEs=
N7u
XkV2ct0MRxuZ3y4tTYJobhbZwutRojiPPZduRw9CSpNDcQHruFiSOIQTpnLeCA6K2JAZyqmP/=
87A
TQRbOdLgAQgAxiY/gz9X5PlFjlq3+DutR02wuFa/UA9iuH1FB584Nges1EdQT16ixhtPpcyvJ=
H2F
PxeUY5hHApbCJAGhZIOJMyj9eLb2NSefgFd8janHYNNfBzbYsq0sCBNGM/6ptTrdjTGdA3b1Q=
YNt
iDLIrnUNbcfQh/Zrck2yF4AAr5dz1tqPQsYhzxP26IRYcGcIf5F2GABOdZYYp0N6BRHkGQN8O=
Dk7
8UhLKYkEfHYPKiSW/mDgHOSCpOrCZpjOyXxTFkq9trGrTNt6EN1ryW+EVeh00UwCBMsmUu4Ng=
4Ys
rYDButLdKnQARuSl0kFvjipWUablsClmi4d4n/6f7uvXb6Wp2wARAQABwsB8BBgBCAAmFiEEc=
hf7
rIzpz2NEoWjlaA3BHVMLeiMFAls50uACGwwFCQPCZwAACgkQaA3BHVMLeiOl9wgAifA/k6VwQ=
qiR
OccKINPPg6fLgacdE/Z9cBNBkIrGa7gAljaH2J/D01/ZOMJnoAy8Le2EA3SsUOPnk32XizUKl=
oOj
gn7R+Sse7I1pydPbToJ4lXUTs1ie3FSf4tKJGs53LCfp6uPFGL0RhNUsIdwOEESMqYVl+DgAz=
gZk
xZfWWDT54dt3mgvVqzbxa+8j+4hozJXxFvJei3Wv/xAuVaV1Tc2tMXmntMxTbLdkfaZ/my5Io=
cAy
1sTiMonxkcU6jcaEuCNWsFYcT0lc7TzEqSAP7Dq/zf6eiawS5/oLotiupj+2xm/IRfrM3wK2K=
s90
9a79Vc1FgCX+Vq3uVIjcfbqqscLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojB=
QJf
tOH6AAoJEGgNwR1TC3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6=
Baa
6H7ufXNQtThRyIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3=
T0T
trijKP4ASAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446S=
h8W
n/2DYa8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRai=
tYJ
4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9fOwU0EX7ThE=
wEQ
ANJiTIb/nQ+MPgIBsSfBBhmXrVFUwFveO6DWPZ0M+Y5xBJhvDukosstSgcLCdld4SFF2JnnCo=
yh9
boM2j2Ksd5wNzTzXlo3lEzFRAipftboviUjap0qxoRwy1hBV3Ft1/VyNwwYY7qjGVATQU7cIT=
/zL
gb+Sd0NPQA8r2NvpJq1MnI8nFfA2ZH4diuRtavhEBUzp63SlCYxnyxqT5AQzSQGUpsjSyh1A5=
ezt
j1pwxgnkX7F9ZT0lUBo6zZM6ZBq8Nkyvox46l79QoWMBm9y+/nIXy/uXdT6RaumPjBzVttGmk=
Onm
TlGUJyQAndAE1boib9iWCJ4kIr2ezRKjXJXGuaM1m7hSfdQYWed0j52+nW9qGSNNk1GjYXM8Z=
SWT
agX6O5mfbpzRgBBK/XoE9NWRNAa4V+tUX4/vqqDl0m+O4F2GYs6Eu7WLredRgwjDuMF/VCKvQ=
fr3
yjIt90Zi10cHQw3khdJWmSDKYgenpvsffo4x56biifOh6IxS/whf5/BAx4nx8GyX7JO0DUnUu=
ieC
NfEGRu8QbYBSOkO/vdm4xy7RZwdzlqN8zjCLFOCG346Bnsx3ku2lNtX6qZoajmfD4oO6N0Xds=
2pE
wjufCfJW9sCLdBmqLD5OvsRljyv7vt5w28XSF1tyhQaxIs+8sFJtwfCliduffq56FcFrEXCxs=
LQr
ABEBAAHCwqwEGAEIACAWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCX7ThEwIbAgJACRBoDcEdU=
wt6
I8F0IAQZAQgAHRYhBMZ3Zv36bjFHcGBRaJYfxNxEKL/gBQJftOETAAoJEJYfxNxEKL/gkygQA=
LQH
pXm45ZfMCDx7u/d7rRH/R7EfEV5OAoS981IkzbTgrb9z6YYfhQqH+R2ImgoX/Lou7zSjyd22/=
IaZ
AnTKHKkXIFIM1uB144dqAi3tW/Bei/CSdiD7DY1q92Ebl6e+Gpf3TZdATSY00fVeLMNFnjbbz=
CVX
9+LEKYARNm7kYogVJMc5CuVmXBn9FFF3cioRvpuals8llsFc4WiUBJfDfOzjXExqv3OMtJj0s=
qlK
sXdnLkXbtAmEvFaxqUuO1ZwTCTGflrn/g4C8Cg0ifk0wZGgGYRindkJE1vOQZPaDI7GtNxJ+D=
sx4
fL/8tf7Wuk3TZ6t/ofKhjq8sUVCVhnlyd/3ujruDu/PhwwYBsHjNn+PmHeCCRJuOWwKapdfjH=
9nt
sHXTvyXBB2D3H7Oj7S/HOTXRNTUWhaxICKtq+XDSuJKOv7CNevkjMF4ybQDsrUxnaWd76YqNP=
vZv
PYoTqKzKukifjGXMsxC6HU4K2GscpvoaIk7glaD+NYi3fIGi/gR0UNc6cmXtOrYKSnCsNOwcO=
CJL
DjEr6YdbdAXO2wxCLqnupo8JRJgA8hjjHM5OoTGEyP/c+DKDqFO90YilX1XN8xchHrw+bDv0E=
Zm0
RZpVdL7WNr7qQE4UhDfuyo4Gis4Z+npzoOL4g3yaQQfK32zZD9iqk9152b7ny2Ke5oFIF5SSa=
EwH
/2tLNBevzgzWuEB6FtqoMT5RjDyx+xBeImRlhnP0EenRh+EP0nmLCAaFiP4tTp1bX54SyByp8=
wcN
7F2+v2Sgdd64w1pdrjT74Zf1xj0NTxEdt5jEaPfl5Vjv3cXiB8ACwPkMIXmkJx3uaGJynl4Os=
irb
nzzviEzvDVpLAxL7Qr6imlKUh92iAoz+XxEDqgMZnJJOTDFdDxEBhv911VzlRraDNdxw4MHMm=
5Nr
5pj4HGYh3PigzNo0KIreB50YqhGOesaC4Q75gv8mLc2Ec5dEq79BVMUOaCmYDShBN9j6JovNs=
WSR
5YP3tXi+jZ+VnyKLft9wo1fh1oYadFEVSHgGsEY=3D
=3DfoRs
-----END PGP PUBLIC KEY BLOCK-----

--------------A0102EFC0C71BFBB0FDA3610--

--c5GTOMQmsvhydaq0bmwK6mZeZtJrVuYT0--

--vm9lB6519ChSapDPKnOmK2drTuLaZJtbv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl+3tssFAwAAAAAACgkQlh/E3EQov+B/
PRAAuOT9ifTWcinj5k3GrF6p915rug6fEeOi30I7Gx7Erw8pg8BAB/Gzo9xrdNFHYg6k8NEfDFql
5vMawlm+IClZFOo0iS4Xlpy4XiExf+/89ND0joDJK1yRUVlkSCv+0u/QOC5SCN0g6HlMu/Mkp59m
tqfBRIyQN4/LbAU9zh3xwNA2AeqWI3zCVK2N3tkSs3b/idrFxdn33INXtw4ZCGVTwkbxXqtl51gh
farWis4EEn+KnJVurLK+qUetqnzFt8C8Y512/6MdSd4Knj/A95EHXdB63x7Fo8JVu8SUQkDX0Mjh
rE2t0xAXZz1l0pK2/w1N5/LO2l7jEgHaaSC1hgOV0VHub/DWlT4DuvXeXWr4jrZoEmLd5TCjOwN/
5cqU0b1eZ5qVWcBrgu7chJvLZXbc8H6f+Z86wC0qR+65QGEfj5LlIfRnZHtgSwPAI9eD0BSCIW/T
vSyyLep0c1Bgtph4p1UuxAaOoAI4uBqkDaJF1LodRVMkQf+C//fyKi1SmKRQTgXHp9kCUIwrI9kf
MWMcmgLsHWB3kyh62tae1yNWvC5sPTPicuShoCuKWA3F/fLw4vBz2cRKTWbTLGGYseIYxa1rqxJ1
fp9AJMPuFxxkQVNCiRLepUUXN7GpFwiLgNpfQ5yzWD0KsoLHJmT5ek2mJU7ToV2niZhiw2T2mHgy
XHE=
=4ngy
-----END PGP SIGNATURE-----

--vm9lB6519ChSapDPKnOmK2drTuLaZJtbv--

--===============1114191829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1114191829==--
