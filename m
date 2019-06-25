Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCBF56426
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361016E2EE;
	Wed, 26 Jun 2019 08:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22C26E0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 13:38:57 +0000 (UTC)
Received: from arch-x1c3 (unknown [IPv6:2a00:5f00:102:0:9665:9cff:feee:aa4d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: evelikov)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 706A9260D5B;
 Tue, 25 Jun 2019 14:38:56 +0100 (BST)
Date: Tue, 25 Jun 2019 14:36:39 +0100
From: Emil Velikov <emil.velikov@collabora.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH 0/2] Associate ddc adapters with connectors
Message-ID: <20190625133639.GA16031@arch-x1c3>
References: <cover.1561452052.git.andrzej.p@collabora.com>
 <20190625100351.52ddptvb2gizaepi@shell.armlinux.org.uk>
 <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <817ccfba-754c-6a28-8d75-63f70605fd43@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Kyungmin Park <kyungmin.park@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS8wNi8yNSwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+IEhpIFJ1c3NlbGws
Cj4gCj4gVyBkbml1IDI1LjA2LjIwMTkgb8KgMTI6MDMsIFJ1c3NlbGwgS2luZyAtIEFSTSBMaW51
eCBhZG1pbiBwaXN6ZToKPiA+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDExOjQ2OjM0QU0gKzAy
MDAsIEFuZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiA+ID4gSXQgaXMgZGlmZmljdWx0IGZv
ciBhIHVzZXIgdG8ga25vdyB3aGljaCBvZiB0aGUgaTJjIGFkYXB0ZXJzIGlzIGZvciB3aGljaAo+
ID4gPiBkcm0gY29ubmVjdG9yLiBUaGlzIHNlcmllcyBhZGRyZXNzZXMgdGhpcyBwcm9ibGVtLgo+
ID4gPiAKPiA+ID4gVGhlIGlkZWEgaXMgdG8gaGF2ZSBhIHN5bWJvbGljIGxpbmsgaW4gY29ubmVj
dG9yJ3Mgc3lzZnMgZGlyZWN0b3J5LCBlLmcuOgo+ID4gPiAKPiA+ID4gbHMgLWwgL3N5cy9jbGFz
cy9kcm0vY2FyZDAtSERNSS1BLTEvaTJjLTIKPiA+ID4gbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAw
IEp1biAyNCAxMDo0MiAvc3lzL2NsYXNzL2RybS9jYXJkMC1IRE1JLUEtMS9pMmMtMiBcCj4gPiA+
IAktPiAuLi8uLi8uLi8uLi9zb2MvMTM4ODAwMDAuaTJjL2kyYy0yCj4gPiAKPiA+IERvbid0IHlv
dSB3YW50IHRoZSBzeW1saW5rIG5hbWUgdG8gYmUgImkyYyIgb3Igc29tZXRoaW5nIGZpeGVkLCBy
YXRoZXIKPiA+IHRoYW4gdGhlIG5hbWUgb2YgdGhlIGkyYyBhZGFwdGVyPyAgT3RoZXJ3aXNlLCB5
b3Ugc2VlbSB0byBiZSBlbmN1bWJlcmluZwo+ID4gdXNlcnNwYWNlIHdpdGggc2VhcmNoaW5nIHRo
ZSBkaXJlY3RvcnkgdG8gdHJ5IGFuZCBmaW5kIHRoZSBzeW1saW5rLgo+ID4gCj4gCj4gVGhhbmsg
eW91IGZvciB5b3VyIGNvbW1lbnQuIFNvIHlvdSBpbWFnaW5lIHNvbWV0aGluZyBvbiB0aGUgbGlu
ZXMgb2Y6Cj4gCj4gbHJ3eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAxMDo0MiAvc3lzL2Ns
YXNzL2RybS9jYXJkMC1IRE1JLUEtMS9kZGMgXAo+ICAJLT4gLi4vLi4vLi4vLi4vc29jLzEzODgw
MDAwLmkyYy9pMmMtMgo+IAo+ID8KPiAKRndpdyBteSBJbnRlbCBtYWNoaW5lIGxpc3RzIGEgbnVt
YmVyIG9mIGkyYyBkZXZpY2VzOgovc3lzL2NsYXNzL2RybS9jYXJkMC1EUC0xL2kyYy02Ci9zeXMv
Y2xhc3MvZHJtL2NhcmQwLURQLTIvaTJjLTcKL3N5cy9jbGFzcy9kcm0vY2FyZDAtZURQLTEvaTJj
LTUKCk5vdGU6IEkgaGF2ZW4ndCBsb29rZWQgX2lmXyB0aGV5IHJlbGF0ZSB0byBvbmVzIHlvdSdy
ZSBwcm9wb3NpbmcgaGVyZS4KCk9uZSB0aGluZyB3b3J0aCBtZW50aW9uaW5nIGlzLCB0aGUgb25l
cyBJJ3ZlIHNlZW4gYXJlIG5vdCBzeW1saW5rcyB0bwphbm90aGVyIHN5c2ZzIGVudHJpZXMuIEFu
ZCB0aGVyZSBhcmVuJ3QgYW55IGkyYyBub2RlcyBpbiAvZGV2IC4uLgoKSnVzdCBhIHJhbmRvbSBm
b29kIGZvciB0aG91Z2h0IDotKQoKSFRICkVtaWwKCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
