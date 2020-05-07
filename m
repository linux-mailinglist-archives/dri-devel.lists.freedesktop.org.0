Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 514301C960F
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 18:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0D489E15;
	Thu,  7 May 2020 16:11:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id C1A6289E15;
 Thu,  7 May 2020 16:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id B4E2B2A6176;
 Thu,  7 May 2020 18:11:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id ahgL4LOqw5AX; Thu,  7 May 2020 18:11:18 +0200 (CEST)
Received: from thor (252.80.76.83.dynamic.wline.res.cust.swisscom.ch
 [83.76.80.252])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 380502A60F7;
 Thu,  7 May 2020 18:11:18 +0200 (CEST)
Received: from localhost ([::1]) by thor with esmtp (Exim 4.93)
 (envelope-from <michel@daenzer.net>)
 id 1jWj7F-001f40-F2; Thu, 07 May 2020 18:11:17 +0200
Subject: Re: [PATCH AUTOSEL 5.6 33/50] drm/amdgpu: bump version for invalidate
 L2 before SDMA IBs
To: Sasha Levin <sashal@kernel.org>
References: <20200507142726.25751-1-sashal@kernel.org>
 <20200507142726.25751-33-sashal@kernel.org>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
Message-ID: <349b2cb9-71f9-a0cd-aceb-308512d7501a@daenzer.net>
Date: Thu, 7 May 2020 18:11:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507142726.25751-33-sashal@kernel.org>
Content-Language: en-CA
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 stable@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAyMC0wNS0wNyA0OjI3IHAubS4sIFNhc2hhIExldmluIHdyb3RlOgo+IEZyb206IE1hcmVr
IE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFtZC5jb20+Cj4gCj4gWyBVcHN0cmVhbSBjb21taXQgOTAx
N2E0ODk3YTIwNjU4ZjAxMGJlYmVhODI1MjYyOTYzYzEwYWZhNiBdCj4gCj4gVGhpcyBmaXhlcyBH
UFUgaGFuZ3MgZHVlIHRvIGNhY2hlIGNvaGVyZW5jeSBpc3N1ZXMuCj4gQnVtcCB0aGUgZHJpdmVy
IHZlcnNpb24uIFNwbGl0IG91dCBmcm9tIHRoZSBvcmlnaW5hbCBwYXRjaC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNYXJlayBPbMWhw6FrIDxtYXJlay5vbHNha0BhbWQuY29tPgo+IFJldmlld2VkLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gVGVzdGVkLWJ5
OiBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllciA8cGllcnJlLWVyaWMucGVsbG91eC1wcmF5ZXJA
YW1kLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgfCAzICsr
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYwo+IGluZGV4IDQyZjRmZWJlMjRj
NmQuLjhkNDVhMmI2NjJhZWIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Rydi5jCj4gQEAgLTg1LDkgKzg1LDEwIEBACj4gICAqIC0gMy4zNC4wIC0gTm9uLURDIGNhbiBm
bGlwIGNvcnJlY3RseSBiZXR3ZWVuIGJ1ZmZlcnMgd2l0aCBkaWZmZXJlbnQgcGl0Y2hlcwo+ICAg
KiAtIDMuMzUuMCAtIEFkZCBkcm1fYW1kZ3B1X2luZm9fZGV2aWNlOjp0Y2NfZGlzYWJsZWRfbWFz
awo+ICAgKiAtIDMuMzYuMCAtIEFsbG93IHJlYWRpbmcgbW9yZSBzdGF0dXMgcmVnaXN0ZXJzIG9u
IHNpL2Npawo+ICsgKiAtIDMuMzcuMCAtIEwyIGlzIGludmFsaWRhdGVkIGJlZm9yZSBTRE1BIElC
cywgbmVlZGVkIGZvciBjb3JyZWN0bmVzcwo+ICAgKi8KPiAgI2RlZmluZSBLTVNfRFJJVkVSX01B
Sk9SCTMKPiAtI2RlZmluZSBLTVNfRFJJVkVSX01JTk9SCTM2Cj4gKyNkZWZpbmUgS01TX0RSSVZF
Ul9NSU5PUgkzNwo+ICAjZGVmaW5lIEtNU19EUklWRVJfUEFUQ0hMRVZFTAkwCj4gIAo+ICBpbnQg
YW1kZ3B1X3ZyYW1fbGltaXQgPSAwOwo+IAoKVGhpcyByZXF1aXJlcyB0aGUgcGFyZW50IGNvbW1p
dCBmZGY4MzY0NmMwNTQyZWNmYjlhZGM0ZGI4Zjc0MWExZjQzZGNhMDU4CiJkcm0vYW1kZ3B1OiBp
bnZhbGlkYXRlIEwyIGJlZm9yZSBTRE1BIElCcyAodjIpIi4gS01TX0RSSVZFUl9NSU5PUiBpcwpi
dW1wZWQgdG8gc2lnbmFsIHRvIHVzZXJzcGFjZSB0aGUgZml4IGluIHRoYXQgY29tbWl0IGlzIHBy
ZXNlbnQuCgoKLS0gCkVhcnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAg
ICAgICAgICAgICBodHRwczovL3JlZGhhdC5jb20KTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAg
ICAgICAgICAgICB8ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
