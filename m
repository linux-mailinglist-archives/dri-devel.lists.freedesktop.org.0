Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2FE10EA42
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 13:57:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929D889395;
	Mon,  2 Dec 2019 12:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA53889FED
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 12:57:27 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB2CvLl5114976;
 Mon, 2 Dec 2019 06:57:21 -0600
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB2CvLca096755
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Dec 2019 06:57:21 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Dec
 2019 06:57:21 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Dec 2019 06:57:21 -0600
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2CvIVd053610;
 Mon, 2 Dec 2019 06:57:19 -0600
Subject: Re: [PATCH v2 5/5] MAINTAINERS: add entry for tidss
To: Daniel Vetter <daniel@ffwll.ch>
References: <cover.1575203210.git.jsarha@ti.com>
 <43262a281a7461be3dd5859bacc8db9bca41e729.1575203210.git.jsarha@ti.com>
 <20191202085759.GZ624164@phenom.ffwll.local>
From: Jyri Sarha <jsarha@ti.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b688a562-74a4-f98d-059e-6bdf74f3c826@ti.com>
Date: Mon, 2 Dec 2019 14:57:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191202085759.GZ624164@phenom.ffwll.local>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575291441;
 bh=okX8PjW1bzT4ihvT4jl37k9wugk9vdrR6WljyU1+D94=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=IOvcm34580bvrNLTHwWqKnzV7b9r77DhB/iyj5eUhX7ppybilUOSI0vW4YN4Ekhri
 Odj5NhNzYvYFAJsZUbH0t6tV5H9Ltq6zr7FMajeAsJ2jFwWcppKbdgjK4nMibkcIy+
 qRZ1qw4Tv/8AQlJdlhRPNdrAa3hrtsQZ6mZPDI5w=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: yamonkar@cadence.com, praneeth@ti.com, subhajit_paul@ti.com,
 dri-devel@lists.freedesktop.org, peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, sjakhade@cadence.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDIvMTIvMjAxOSAxMDo1NywgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBTdW4sIERlYyAw
MSwgMjAxOSBhdCAwMzo1MDoyMVBNICswMjAwLCBKeXJpIFNhcmhhIHdyb3RlOgo+PiBBZGQgZW50
cnkgZm9yIHRpZHNzIERSTSBkcml2ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp5cmkgU2FyaGEg
PGpzYXJoYUB0aS5jb20+Cj4+IC0tLQo+PiAgTUFJTlRBSU5FUlMgfCAxMCArKysrKysrKysrCj4+
ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvTUFJ
TlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+PiBpbmRleCA3NDFlM2Y0MzNmNmUuLmRkNzg1NWU1OWJk
MSAxMDA2NDQKPj4gLS0tIGEvTUFJTlRBSU5FUlMKPj4gKysrIGIvTUFJTlRBSU5FUlMKPj4gQEAg
LTU1NjcsNiArNTU2NywxNiBAQCBGOglpbmNsdWRlL3VhcGkvZHJtL3YzZF9kcm0uaAo+PiAgRjoJ
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwdS9icmNtLGJjbS12M2QudHh0Cj4+
ICBUOglnaXQgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjCj4+ICAK
Pj4gK0RSTSBEUklWRVJTIEZPUiBUSSBLRVlTVE9ORQo+PiArTToJSnlyaSBTYXJoYSA8anNhcmhh
QHRpLmNvbT4KPj4gK006CVRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Cj4+
ICtMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+ICtTOglNYWludGFpbmVkCj4+
ICtGOglkcml2ZXJzL2dwdS9kcm0vdGlkc3MvCj4+ICtGOglEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS90aS90aSxrMmctZHNzLnR4dAo+PiArRjoJRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGkvdGksYW02NXgtZHNzLnR4dAo+PiArRjoJ
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGkvdGksajcyMWUtZHNz
LnR4dAo+IAo+IElzIHRoaXMgZ29pbmcgdG8gYmUgbWFpbnRhaW5lZCBpbiB0aGUgVEkgdHJlZSwg
b3IgaW4gZHJtLW1pc2MsIG9yCj4gc29tZXdoZXJlIGVsc2U/ICJTb21ld2hlcmUgZWxzZSIgZm9y
IHRpbnkgZHJpdmVycyBzZWVtcyB0byBub3Qgd29yaywgaWYKPiB0aGV5IGNhbid0IGJlIGFkZGVk
IHRvIHNvbWUgZXhpc3RpbmcgZ3JvdXAgbWFpbnRhaW5lZCB0aGluZyAuLi4KPiAtRGFuaWVsCj4g
CgpJIHRoaW5rIHRoZSBtYWludGVuYW5jZSB0cm91Z2ggZHJtLW1pc2Mgc2hvdWxkIGJlIGZpbmUu
IEkgZG8gbm90IHNlZSBhbnkKYmlnIGNoYW5nZXMgY29taW5nIGFmdGVyIHRoZSBpbml0aWFsIHZl
cnNpb24uCgpTbyBJIGd1ZXNzIEkgc2hvdWxkIGFkZDoKVDoJZ2l0IGdpdDovL2Fub25naXQuZnJl
ZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYwoKT2gsIGFuZCBJIHNob3VsZCB1cGRhdGUgdGhlIGJp
bmRpbmcgRjotZW50cmllcyB0byBwb2ludCB0byB0aGUKeWFtbC1maWxlcyBpbnN0ZWFkIG9mICou
dHh0IGZpbGVzLgoKQlIsCkp5cmkKCj4+ICsKPj4gIERSTSBEUklWRVJTIEZPUiBWQzQKPj4gIE06
CUVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cj4+ICBUOglnaXQgZ2l0Oi8vZ2l0aHViLmNv
bS9hbmhvbHQvbGludXgKPj4gLS0gCj4+IFRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBv
cmtrYWxhbmthdHUgMjIsIDAwMTgwIEhlbHNpbmtpLiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYx
NTUyMS00LiBLb3RpcGFpa2thL0RvbWljaWxlOiBIZWxzaW5raQo+Pgo+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGluZyBs
aXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPiAKCgotLSAKVGV4YXMg
SW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2ku
ClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhl
bHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
