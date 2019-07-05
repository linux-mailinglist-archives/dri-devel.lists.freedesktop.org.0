Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37D960484
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 12:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4336E484;
	Fri,  5 Jul 2019 10:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54D6A6E484
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 10:32:07 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hjLVc-0008Jm-Pl; Fri, 05 Jul 2019 12:32:04 +0200
Message-ID: <1562322724.4291.5.camel@pengutronix.de>
Subject: Re: [v1] gpu: ipu-v3: allow to build with ARCH_LAYERSCAPE
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Wen He <wen.he_1@nxp.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Date: Fri, 05 Jul 2019 12:32:04 +0200
In-Reply-To: <20190508105755.5881-1-wen.he_1@nxp.com>
References: <20190508105755.5881-1-wen.he_1@nxp.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Leo Li <leoyang.li@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgV2VuLAoKT24gV2VkLCAyMDE5LTA1LTA4IGF0IDEwOjU2ICswMDAwLCBXZW4gSGUgd3JvdGU6
Cj4gVGhlIG5ldyBMUzEwMjhBIERQIGRyaXZlciBjb2RlIGNhdXNlcyBhIGxpbmsgZmFpbHVyZSB3
aGVuIERSTV9JTVggYnVpbHQtaW4sCj4gYnV0IHBsYXRmb3JtIGlzIEFSQ0hfTEFZRVJTQ0FQRToK
PiAKPiBkcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYzo1MTogdW5kZWZpbmVkIHJlZmVy
ZW5jZSB0byBgaXB1X3ByZ19lbmFibGUnCj4gZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRj
LmM6NTI6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGlwdV9kY19lbmFibGUnCj4gZHJpdmVycy9n
cHUvZHJtL2lteC9pcHV2My1jcnRjLmM6NTM6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGlwdV9k
Y19lbmFibGVfY2hhbm5lbCcKPiBkcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYzo1NDog
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgaXB1X2RpX2VuYWJsZScKPiBkcml2ZXJzL2dwdS9kcm0v
aW14L2lwdXYzLWNydGMubzogSW4gZnVuY3Rpb24gYGlwdV9jcnRjX21vZGVfc2V0X25vZmIKPiAK
PiBBZGRpbmcgYSBLY29uZmlnIGRlcGVuZGVuY3kgYWxsb3cgdG8gYnVpbGQgaWYgQVJDSF9MQVlF
UlNDQVBFIGlzIGVuYWJsZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZW4gSGUgPHdlbi5oZV8xQG54
cC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2lwdS12My9LY29uZmlnIHwgMiArLQo+ICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvaXB1LXYzL0tjb25maWcgYi9kcml2ZXJzL2dwdS9pcHUtdjMvS2NvbmZp
Zwo+IGluZGV4IGZlNmY4YzViNDQ0NS4uNTFlYTg4YzQ0MGRmIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2lwdS12My9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncHUvaXB1LXYzL0tjb25maWcK
PiBAQCAtMSw2ICsxLDYgQEAKPiAgY29uZmlnIElNWF9JUFVWM19DT1JFCj4gIAl0cmlzdGF0ZSAi
SVBVdjMgY29yZSBzdXBwb3J0Igo+IC0JZGVwZW5kcyBvbiBTT0NfSU1YNSB8fCBTT0NfSU1YNlEg
fHwgQVJDSF9NVUxUSVBMQVRGT1JNIHx8IENPTVBJTEVfVEVTVAo+ICsJZGVwZW5kcyBvbiBTT0Nf
SU1YNSB8fCBTT0NfSU1YNlEgfHwgQVJDSF9NVUxUSVBMQVRGT1JNIHx8IENPTVBJTEVfVEVTVCB8
fCBBUkNIX0xBWUVSU0NBUEUKPiAgCWRlcGVuZHMgb24gRFJNIHx8ICFEUk0gIyBpZiBEUk09bSwg
dGhpcyBjYW4ndCBiZSAneScKPiAgCXNlbGVjdCBCSVRSRVZFUlNFCj4gIAlzZWxlY3QgR0VORVJJ
Q19BTExPQ0FUT1IgaWYgRFJNCj4gLS0gCj4gMi4xNy4xCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRj
aCwgYnV0IHRoaXMgZG9lcyBub3Qgc2VlbSByaWdodC4KaXB1djMtY3J0Yy5jIGlzIHBhcnQgb2Yg
RFJNX0lNWCwgd2hpY2ggYWxyZWFkeSBkZXBlbmRzIG9uCklNWF9JUFVWM19DT1JFLsKgSG93IGRp
ZCB5b3UgbWFuYWdlIHRvIG1ha2UgaXQgdHJ5IHRvIGNvbXBpbGUgaW14ZHJtPwoKU2luY2UgTFMx
MDI4QSBkb2VzIG5vdCBoYXZlIHRoZSBJUFV2Mywga2VlcGluZyB0aGlzIHVuZGVyIENPTVBJTEVf
VEVTVApzaG91bGQgYmUgY29ycmVjdC4KCnJlZ2FyZHMKUGhpbGlwcApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
