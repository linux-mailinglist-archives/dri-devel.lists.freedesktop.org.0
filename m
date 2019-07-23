Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA8771618
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 12:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCEAE89D77;
	Tue, 23 Jul 2019 10:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F9589D77
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 10:29:40 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hps37-0005i0-8w; Tue, 23 Jul 2019 12:29:37 +0200
Message-ID: <1563877776.3731.3.camel@pengutronix.de>
Subject: Re: [EXT] Re: [v1] gpu: ipu-v3: allow to build with ARCH_LAYERSCAPE
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Wen He <wen.he_1@nxp.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Date: Tue, 23 Jul 2019 12:29:36 +0200
In-Reply-To: <DB7PR04MB5195F5731555285623955738E2F10@DB7PR04MB5195.eurprd04.prod.outlook.com>
References: <20190508105755.5881-1-wen.he_1@nxp.com>
 <1562322724.4291.5.camel@pengutronix.de>
 <DB7PR04MB5195F5731555285623955738E2F10@DB7PR04MB5195.eurprd04.prod.outlook.com>
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

T24gVHVlLCAyMDE5LTA3LTA5IGF0IDAzOjExICswMDAwLCBXZW4gSGUgd3JvdGU6ClsuLi5dCj4g
PiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCwgYnV0IHRoaXMgZG9lcyBub3Qgc2VlbSByaWdodC4K
PiA+IGlwdXYzLWNydGMuYyBpcyBwYXJ0IG9mIERSTV9JTVgsIHdoaWNoIGFscmVhZHkgZGVwZW5k
cyBvbiBJTVhfSVBVVjNfQ09SRS4KPiA+IEhvdyBkaWQgeW91IG1hbmFnZSB0byBtYWtlIGl0IHRy
eSB0byBjb21waWxlIGlteGRybT8KCkkgYXNzdW1lIHRoZSBhbnN3ZXIgdG8gbXkgcXVlc3Rpb24g
aXMgdGhhdCB5b3UgaGF2ZSByZW1vdmVkIHRoZQpJTVhfSVBVVjNfQ09SRSBkZXBlbmRlbmN5IGlu
IHRoZSBMUzEwMjhBIEJTUD8KCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LCBQaGlsaXBwLAo+IAo+
IE5YUCBMUzEwMjhBIHBsYXRmb3JtIHVzZSBzYW1lIERpc3BsYXkgSVAgd2l0aCBJTVg4LCBzbyB0
aGV5IGhhdmUgdXNlIHNhbWUgZGlzcGxheQo+IHRyYW5zbWl0IGNvbnRyb2xsZXIgZHJpdmVycywg
Y29uZmlnICdEUk1fSU1YJyBpcyB1c2VkIHRvIHN1cHBvcnQgZHJtIGNvbW1vbiBkcml2ZXJzCj4g
b24gdGhlIE5YUCBJLk1YIGFuZCBMUzEwMjhBLCBkaXNwbGF5IHRyYW5zbWl0IGNvbnRyb2xsZXIg
aXMgY29taW5nIHRvIHBsYW4gdXBzdHJlYW0uICAKCklzIGl0IHRoZSBpLk1YOE1RIERDU1Mgb3Ig
dGhlIGkuTVg4UU0gRFBVIHRoYXQgaXMgc2hhcmVkIHdpdGggTFMxMDI4QT8KCj4gQWN0dWFsbHks
IHdlIGhhdmUgZG9uZSBjb21waWxlIG9mIHRoZSBpbXhkcm0gb24gTFMxMDI4QSBCU1AgcmVsZWFz
ZS4KCkNhbiB5b3UgcG9pbnQgbWUgY2hhbmdlcyB0aGF0IGhhdmUgYmVlbiBhcHBsaWVkPyBJdCBp
cyBzdGlsbCB1bmNsZWFyIHRvCm1lIGhvdyB5b3UgbWFuYWdlZCB0byBidWlsZCBpbXgtZHJtLCB1
bmxlc3MgeW91IGhhdmUgcmVtb3ZlZCB0aGUKSU1YX0lQVVYzX0NPUkUgZGVwZW5kZW5jeSBmcm9t
IERSTV9JTVguCgo+ID4gU2luY2UgTFMxMDI4QSBkb2VzIG5vdCBoYXZlIHRoZSBJUFV2Mywga2Vl
cGluZyB0aGlzIHVuZGVyIENPTVBJTEVfVEVTVAo+ID4gc2hvdWxkIGJlIGNvcnJlY3QuCj4gCj4g
QWx0aG91Z2ggTFMxMDI4QSBkb2VzIG5vdCBoYXZlIHRoZSBJUFZ2MywgYnV0IERSTV9JTVggZGVw
ZW5kcyBvbiBpdCwgTFMxMDI4QSBkaXNwbGF5Cj4gVHJhbnNtaXQgY29udHJvbGxlciBkcml2ZXJz
IGFsc28gZGVwZW5kcyBvbiBEUk1fSU1YLCBzbyB3ZSBuZWVkIGFkZCB0aGlzIGRlcGVuZGVuY3kg
dG8KPiBzb2x2ZSB0aGUgY29tcGlsZSBpc3N1ZS4KClRoZSBpbXgtZHJtIGRyaXZlciBpcyBub3Qg
c3VpdGVkIHRvIGRyaXZlIHRoZSBpLk1YOCBkaXNwbGF5IGNvbnRyb2xsZXJzLgpUaGV5IHNob3Vs
ZCBnZXQgdGhlaXIgb3duIGRybSBkcml2ZXJzLCBhcyB0aGV5IGhhdmUgbm90aGluZyBpbiBjb21t
b24Kd2l0aCB0aGUgaS5NWDUvNiBJUFUuIFRoZXJlIGFyZSBubyB2aWRlbyBjYXB0dXJlIGNhcGFi
aWxpdGllcywgc28gdGhleQpkb24ndCBuZWVkIHRoZSBzdWJzeXN0ZW0gc3Bhbm5pbmcgZHJpdmVy
IGxheW91dCwgYW5kIHdpdGhvdXQgbXV4YWJsZQpzaGFyZWQgZW5jb2RlcnMgdGhlcmUgaXMgbm8g
bmVlZCBmb3IgdGhlIGNvbXBvbmVudCBkZXNpZ24gZWl0aGVyLgoKcmVnYXJkcwpQaGlsaXBwCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
