Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 776595B2D6
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 03:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC50B89AB5;
	Mon,  1 Jul 2019 01:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id CBA4989AA2;
 Mon,  1 Jul 2019 01:59:26 +0000 (UTC)
X-UUID: 32b51eec05e64d2289cc2cc4de833084-20190701
X-UUID: 32b51eec05e64d2289cc2cc4de833084-20190701
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1811838344; Mon, 01 Jul 2019 09:59:21 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 1 Jul 2019 09:59:20 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 1 Jul 2019 09:59:19 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 1 Jul 2019 09:59:19 +0800
Message-ID: <1561946359.23228.0.camel@mtksdaap41>
Subject: Re: [PATCH v4 4/4] drm/mtk: add panel orientation property
From: CK Hu <ck.hu@mediatek.com>
To: Derek Basehore <dbasehore@chromium.org>
Date: Mon, 1 Jul 2019 09:59:19 +0800
In-Reply-To: <20190622034105.188454-5-dbasehore@chromium.org>
References: <20190622034105.188454-1-dbasehore@chromium.org>
 <20190622034105.188454-5-dbasehore@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Thierry
 Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERlcmVrOgoKT24gRnJpLCAyMDE5LTA2LTIxIGF0IDIwOjQxIC0wNzAwLCBEZXJlayBCYXNl
aG9yZSB3cm90ZToKPiBUaGlzIGluaXRzIHRoZSBwYW5lbCBvcmllbnRhdGlvbiBwcm9wZXJ0eSBm
b3IgdGhlIG1lZGlhdGVrIGRzaSBkcml2ZXIKPiBpZiB0aGUgcGFuZWwgb3JpZW50YXRpb24gKGNv
bm5lY3Rvci5kaXNwbGF5X2luZm8ucGFuZWxfb3JpZW50YXRpb24pIGlzCj4gbm90IERSTV9NT0RF
X1BBTkVMX09SSUVOVEFUSU9OX1VOS05PV04uCj4gCgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1
QG1lZGlhdGVrLmNvbT4KCj4gU2lnbmVkLW9mZi1ieTogRGVyZWsgQmFzZWhvcmUgPGRiYXNlaG9y
ZUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCA0YTBiOTE1MGE3YmIuLjA4ZmZkYzc1
MjZkZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC03ODIsMTAgKzc4
MiwxOCBAQCBzdGF0aWMgaW50IG10a19kc2lfY3JlYXRlX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAJCQlEUk1fRVJST1IoIkZhaWxlZCB0
byBhdHRhY2ggcGFuZWwgdG8gZHJtXG4iKTsKPiAgCQkJZ290byBlcnJfY29ubmVjdG9yX2NsZWFu
dXA7Cj4gIAkJfQo+ICsKPiArCQlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXRfcGFuZWxfb3JpZW50
YXRpb25fcHJvcGVydHkoJmRzaS0+Y29ubik7Cj4gKwkJaWYgKHJldCkgewo+ICsJCQlEUk1fRVJS
T1IoIkZhaWxlZCB0byBpbml0IHBhbmVsIG9yaWVudGF0aW9uXG4iKTsKPiArCQkJZ290byBlcnJf
cGFuZWxfZGV0YWNoOwo+ICsJCX0KPiAgCX0KPiAgCj4gIAlyZXR1cm4gMDsKPiAgCj4gK2Vycl9w
YW5lbF9kZXRhY2g6Cj4gKwlkcm1fcGFuZWxfZGV0YWNoKGRzaS0+cGFuZWwpOwo+ICBlcnJfY29u
bmVjdG9yX2NsZWFudXA6Cj4gIAlkcm1fY29ubmVjdG9yX2NsZWFudXAoJmRzaS0+Y29ubik7Cj4g
IAlyZXR1cm4gcmV0OwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
