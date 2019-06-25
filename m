Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEAF56432
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4406E2F2;
	Wed, 26 Jun 2019 08:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFAE8982E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 10:14:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 5E67D266AD9
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH 0/2] Associate ddc adapters with connectors
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <cover.1561452052.git.andrzej.p@collabora.com>
 <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
Message-ID: <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
Date: Tue, 25 Jun 2019 12:14:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
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
Cc: linux-samsung-soc@vger.kernel.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, David Airlie <airlied@linux.ie>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 m.szyprowski@samsung.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUnVzc2VsbCwKClcgZG5pdSAyNS4wNi4yMDE5IG/CoDEyOjAzLCBSdXNzZWxsIEtpbmcgLSBB
Uk0gTGludXggYWRtaW4gcGlzemU6Cj4gT24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTE6NDY6MzRB
TSArMDIwMCwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+PiBJdCBpcyBkaWZmaWN1bHQg
Zm9yIGEgdXNlciB0byBrbm93IHdoaWNoIG9mIHRoZSBpMmMgYWRhcHRlcnMgaXMgZm9yIHdoaWNo
Cj4+IGRybSBjb25uZWN0b3IuIFRoaXMgc2VyaWVzIGFkZHJlc3NlcyB0aGlzIHByb2JsZW0uCj4+
Cj4+IFRoZSBpZGVhIGlzIHRvIGhhdmUgYSBzeW1ib2xpYyBsaW5rIGluIGNvbm5lY3RvcidzIHN5
c2ZzIGRpcmVjdG9yeSwgZS5nLjoKPj4KPj4gbHMgLWwgL3N5cy9jbGFzcy9kcm0vY2FyZDAtSERN
SS1BLTEvaTJjLTIKPj4gbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAxMDo0MiAvc3lz
L2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9pMmMtMiBcCj4+IAktPiAuLi8uLi8uLi8uLi9zb2Mv
MTM4ODAwMDAuaTJjL2kyYy0yCj4gCj4gRG9uJ3QgeW91IHdhbnQgdGhlIHN5bWxpbmsgbmFtZSB0
byBiZSAiaTJjIiBvciBzb21ldGhpbmcgZml4ZWQsIHJhdGhlcgo+IHRoYW4gdGhlIG5hbWUgb2Yg
dGhlIGkyYyBhZGFwdGVyPyAgT3RoZXJ3aXNlLCB5b3Ugc2VlbSB0byBiZSBlbmN1bWJlcmluZwo+
IHVzZXJzcGFjZSB3aXRoIHNlYXJjaGluZyB0aGUgZGlyZWN0b3J5IHRvIHRyeSBhbmQgZmluZCB0
aGUgc3ltbGluay4KPiAKClRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50LiBTbyB5b3UgaW1hZ2lu
ZSBzb21ldGhpbmcgb24gdGhlIGxpbmVzIG9mOgoKbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1
biAyNCAxMDo0MiAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9kZGMgXAogIAktPiAuLi8u
Li8uLi8uLi9zb2MvMTM4ODAwMDAuaTJjL2kyYy0yCgo/CgpUaGlzIG1ha2VzIHNlbnNlIHRvIG1l
LCBJIHdpbGwgc2VuZCBhIHYyLgoKQW5kcnplagpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
