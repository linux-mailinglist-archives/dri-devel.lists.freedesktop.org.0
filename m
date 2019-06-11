Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5181D3C101
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 03:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D21C890F9;
	Tue, 11 Jun 2019 01:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6992E890F9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 01:42:23 +0000 (UTC)
X-UUID: f11cea20fbdb41f9bc95a277a5c6092c-20190611
X-UUID: f11cea20fbdb41f9bc95a277a5c6092c-20190611
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 939432139; Tue, 11 Jun 2019 09:42:18 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 11 Jun 2019 09:42:17 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 11 Jun 2019 09:42:17 +0800
Message-ID: <1560217337.15546.1.camel@mtksdaap41>
Subject: Re: [PATCH 5/5] drm/mtk: add panel orientation property
From: CK Hu <ck.hu@mediatek.com>
To: Derek Basehore <dbasehore@chromium.org>
Date: Tue, 11 Jun 2019 09:42:17 +0800
In-Reply-To: <20190611002256.186969-6-dbasehore@chromium.org>
References: <20190611002256.186969-1-dbasehore@chromium.org>
 <20190611002256.186969-6-dbasehore@chromium.org>
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
Cc: maxime.ripard@bootlin.com, sam@ravnborg.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 airlied@linux.ie, thierry.reding@gmail.com, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthias.bgg@gmail.com, sean@poorly.run, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIERlcmVrOgoKT24gTW9uLCAyMDE5LTA2LTEwIGF0IDE3OjIyIC0wNzAwLCBEZXJlayBCYXNl
aG9yZSB3cm90ZToKPiBUaGlzIGluaXRzIHRoZSBwYW5lbCBvcmllbnRhdGlvbiBwcm9wZXJ0eSBm
b3IgdGhlIG1lZGlhdGVrIGRzaSBkcml2ZXIKPiBpZiB0aGUgcGFuZWwgb3JpZW50YXRpb24gKGNv
bm5lY3Rvci5kaXNwbGF5X2luZm8ucGFuZWxfb3JpZW50YXRpb24pIGlzCj4gbm90IERSTV9NT0RF
X1BBTkVMX09SSUVOVEFUSU9OX1VOS05PV04uCj4gCgpMb29rcyBnb29kIHRvIG1lLAoKQWNrZWQt
Ynk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cgo+IFNpZ25lZC1vZmYtYnk6IERlcmVrIEJh
c2Vob3JlIDxkYmFzZWhvcmVAY2hyb21pdW0ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jIHwgOCArKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggNGEwYjkx
NTBhN2JiLi4wOGZmZGM3NTI2ZGQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMK
PiBAQCAtNzgyLDEwICs3ODIsMTggQEAgc3RhdGljIGludCBtdGtfZHNpX2NyZWF0ZV9jb25uZWN0
b3Ioc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3RydWN0IG10a19kc2kgKmRzaSkKPiAgCQkJRFJN
X0VSUk9SKCJGYWlsZWQgdG8gYXR0YWNoIHBhbmVsIHRvIGRybVxuIik7Cj4gIAkJCWdvdG8gZXJy
X2Nvbm5lY3Rvcl9jbGVhbnVwOwo+ICAJCX0KPiArCj4gKwkJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9p
bml0X3BhbmVsX29yaWVudGF0aW9uX3Byb3BlcnR5KCZkc2ktPmNvbm4pOwo+ICsJCWlmIChyZXQp
IHsKPiArCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gaW5pdCBwYW5lbCBvcmllbnRhdGlvblxuIik7
Cj4gKwkJCWdvdG8gZXJyX3BhbmVsX2RldGFjaDsKPiArCQl9Cj4gIAl9Cj4gIAo+ICAJcmV0dXJu
IDA7Cj4gIAo+ICtlcnJfcGFuZWxfZGV0YWNoOgo+ICsJZHJtX3BhbmVsX2RldGFjaChkc2ktPnBh
bmVsKTsKPiAgZXJyX2Nvbm5lY3Rvcl9jbGVhbnVwOgo+ICAJZHJtX2Nvbm5lY3Rvcl9jbGVhbnVw
KCZkc2ktPmNvbm4pOwo+ICAJcmV0dXJuIHJldDsKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
