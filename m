Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 460D985BE9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2204A6E7C0;
	Thu,  8 Aug 2019 07:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id B2DB66E69C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 09:18:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 577EE28;
 Wed,  7 Aug 2019 02:18:09 -0700 (PDT)
Received: from [10.1.29.45] (unknown [10.1.29.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64C963F575;
 Wed,  7 Aug 2019 02:18:08 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost: Add errata descriptions from kbase
To: Rob Herring <robh@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <20190806202444.4827-1-alyssa.rosenzweig@collabora.com>
 <CAL_Jsq+H7P7oRhh=KYW9DnrAi3n5V1Bt_eVKVemoLCEZfoef4Q@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <a0a1321d-7cc5-5253-6a5f-5b5c6e12fe4d@arm.com>
Date: Wed, 7 Aug 2019 10:18:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+H7P7oRhh=KYW9DnrAi3n5V1Bt_eVKVemoLCEZfoef4Q@mail.gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYvMDgvMjAxOSAyMjowOCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVHVlLCBBdWcgNiwg
MjAxOSBhdCAyOjI1IFBNIEFseXNzYSBSb3Nlbnp3ZWlnCj4gPGFseXNzYS5yb3Nlbnp3ZWlnQGNv
bGxhYm9yYS5jb20+IHdyb3RlOgo+Pgo+PiBXaGlsZSBuZXdlciBrYmFzZSBpbmNsdWRlIG9ubHkg
dGhlIG51bWJlcnMgb2YgZXJyYXRhLCBvbGRlciBrYmFzZQo+PiByZWxlYXNlcyBpbmNsdWRlZCBv
bmUtbGluZSBkZXNjcmlwdGlvbnMgZm9yIGVhY2ggZXJyYXRhLCB3aGljaCBpcyB1c2VmdWwKPj4g
Zm9yIHRob3NlIHdvcmtpbmcgb24gdGhlIGRyaXZlci4gSW1wb3J0IHRoZXNlIGRlc2NyaXB0aW9u
cy4gTW9zdCBhcmUKPj4gZnJvbSBrYmFzZSB2ZXJiYXRpbTsgYSBmZXcgSSBlZGl0ZWQgZm9yIGNs
YXJpdHkuCj4+Cj4+IEEgZmV3IGlzc3VlcyBwZXJ0YWluaW5nIHRvIG5ld2VyIG1vZGVscyBhcmUg
dW5rbm93biBhcyB0aGV5IHdlcmUgbm90Cj4+IGFkZGVkIHRvIGtiYXNlIHVudGlsIGFmdGVyIGti
YXNlIGJlZ2FuIHN0cmlwcGluZyB0aGVzZSBjb21tZW50cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
QWx5c3NhIFJvc2VuendlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+Cj4+IC0t
LQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9pc3N1ZXMuaCB8IDgwICsr
KysrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygr
KQo+IAo+IEEgY291cGxlIG9mIG5pdHMgYmVsb3cuCj4gClsuLi5dCj4+ICsKPj4gKyAgICAgICAv
KiBUT0RPOiBVbmtub3duICovCj4gCj4gVGhpcyBpcyBCaWZyb3N0IGVycmF0YSB3aGljaCBpcyBu
ZXdlciBhbmQgSSdtIGFzc3VtaW5nIHdpbGwgbmV2ZXIgaGF2ZQo+IGEgZGVzY3JpcHRpb24uIElz
IHRoZXJlIG11Y2ggcG9pbnQgaW4gYW55IGNvbW1lbnQ/CgpXZSBjb3VsZCBlYXNpbHkgcHJvdmlk
ZSBiZXR0ZXIgY29tbWVudHMgZm9yIHNvbWUgb2YgdGhlc2UuIEZvciBleGFtcGxlIApUTUlYXzg0
NjMgb3BlcmF0ZXMgdGhpcyBjb2RlWzFdOgo+IAlpZiAoa2Jhc2VfaHdfaGFzX2lzc3VlKGtiZGV2
LCBCQVNFX0hXX0lTU1VFX1RNSVhfODQ2MykpIHsKPiAJCS8qIEVuc3VyZSB0aGF0IEwyIGlzIG5v
dCB0cmFuc2l0aW9uaW5nIHdoZW4gd2Ugc2VuZCB0aGUgcmVzZXQKPiAJCSAqIGNvbW1hbmQgKi8K
PiAJCXdoaWxlICgtLW1heF9sb29wcyAmJiBrYmFzZV9wbV9nZXRfdHJhbnNfY29yZXMoa2JkZXYs
Cj4gCQkJCUtCQVNFX1BNX0NPUkVfTDIpKQo+IAkJCTsKPiAKPiAJCVdBUk4oIW1heF9sb29wcywg
IkwyIHBvd2VyIHRyYW5zaXRpb24gdGltZWQgb3V0IHdoaWxlIHRyeWluZyB0byByZXNldFxuIik7
Cj4gCX0KPiAKClNvIHdlIGNhbiBhdCBsZWFzdCBjb21tZW50IHRoYXQgdGhlICJMMiBtdXN0IG5v
dCBiZSB0cmFuc2l0aW9uaW5nIHdoZW4gCmlzc3VpbmcgcmVzZXQgY29tbWFuZCIuCgpbMV0gCmh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9wYW5mcm9zdC9tYWxpX2tiYXNlL2Jsb2IvbWFz
dGVyL2RyaXZlci9wcm9kdWN0L2tlcm5lbC9kcml2ZXJzL2dwdS9hcm0vbWlkZ2FyZC9iYWNrZW5k
L2dwdS9tYWxpX2tiYXNlX2ptX2h3LmMjTDExOTcKCgpJIGFncmVlIHRob3VnaCB0aGF0IHRoZXJl
J3MgbGl0dGxlIHBvaW50IGluICJUT0RPOiBVbmtub3duIiBjb21tZW50cy4KClN0ZXZlCgo+PiAg
ICAgICAgICBIV19JU1NVRV9UTUlYXzg0NjMsCj4+ICsKPj4gKyAgICAgICAvKiBUT0RPOiBVbmtu
b3duICovCj4+ICAgICAgICAgIEdQVUNPUkVfMTYxOSwKPj4gKwo+PiArICAgICAgIC8qIFRPRE86
IFVua25vd24gKi8KPj4gICAgICAgICAgSFdfSVNTVUVfVE1JWF84NDM4LAo+PiArCj4+ICsgICAg
ICAgLyogVE9ETzogVW5rbm93biAqLwo+PiAgICAgICAgICBIV19JU1NVRV9UR09YX1IxXzEyMzQs
Cj4+ICsKPj4gICAgICAgICAgSFdfSVNTVUVfRU5ECj4+ICAgfTsKPj4KPj4gLS0KPj4gMi4yMC4x
Cj4+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
