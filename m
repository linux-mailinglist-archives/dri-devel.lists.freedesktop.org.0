Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8177F662
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 14:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C507B6EDD9;
	Fri,  2 Aug 2019 12:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFD56EDD9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 12:03:53 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1htWHk-0006HX-Oz; Fri, 02 Aug 2019 14:03:48 +0200
Message-ID: <1564747425.3090.1.camel@pengutronix.de>
Subject: Re: [PATCH] drm/imx: Drop unused imx-ipuv3-crtc.o build
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>, Guido =?ISO-8859-1?Q?G=FCnther?=
 <agx@sigxcpu.org>
Date: Fri, 02 Aug 2019 14:03:45 +0200
In-Reply-To: <CAOMZO5BipmSPR1jz3ov8ESSJPsHMViMw42di-WKOdqhyONLK6Q@mail.gmail.com>
References: <e5484fa33bffec220fd0590b502a962da17c9c72.1564743270.git.agx@sigxcpu.org>
 <CAOMZO5BipmSPR1jz3ov8ESSJPsHMViMw42di-WKOdqhyONLK6Q@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR3VpZG8sIEZhYmlvLAoKT24gRnJpLCAyMDE5LTA4LTAyIGF0IDA4OjAzIC0wMzAwLCBGYWJp
byBFc3RldmFtIHdyb3RlOgo+IEhpIEd1aWRvLAo+IAo+IEdvb2QgY2F0Y2ghCj4gCj4gT24gRnJp
LCBBdWcgMiwgMjAxOSBhdCA3OjU1IEFNIEd1aWRvIEfDvG50aGVyIDxhZ3hAc2lneGNwdS5vcmc+
IHdyb3RlOgo+ID4gCj4gPiBTaW5jZQo+ID4gCj4gPiBjb21taXQgM2QxZGY5NmFkNDY4ICgiZHJt
L2lteDogbWVyZ2UgaW14LWRybS1jb3JlIGFuZCBpcHV2My1jcnRjIGluIG9uZSBtb2R1bGUiKQo+
ID4gCj4gPiBpbXgtaXB1djMtY3J0Yy5vIGlzIGJ1aWx0IHZpYSBpbXhkcm0tb2Jqcy4gU28gdGhl
cmUncyBubyBuZWVkIHRvIGtlZXAgYW4KPiAKPiBBY3R1YWxseSwgaXQgaXMgaXB1djMtY3J0Yy5v
IHRoYXQgaXMgYnVpbHQgdmlhIGlteGRybS1vYmpzLCBub3QKPiBpbXgtaXB1djMtY3J0Yy5vLgo+
IAo+IEFwYXJ0IGZyb20gdGhhdDoKPiAKPiBSZXZpZXdlZC1ieTogRmFiaW8gRXN0ZXZhbSA8ZmVz
dGV2YW1AZ21haWwuY29tPgoKVGhhbmsgeW91LCBhcHBsaWVkIHRvIGlteC1kcm0vbmV4dCB3aXRo
IEZhYmlvJ3MgUi1iLCBhbmQgYWRkZWQgRml4ZXM6CnRhZywgYW5kIHRoZSBjb21taXQgbWVzc2Fn
ZSBjaGFuZ2VkIGFzIGZvbGxvd3M6CgrCoMKgwqDCoGRybS9pbXg6IERyb3AgdW51c2VkIGlteC1p
cHV2My1jcnRjLm8gYnVpbGQKwqDCoMKgwqAKwqDCoMKgwqBTaW5jZQrCoMKgwqDCoArCoMKgwqDC
oGNvbW1pdCAzZDFkZjk2YWQ0NjggKCJkcm0vaW14OiBtZXJnZSBpbXgtZHJtLWNvcmUgYW5kIGlw
dXYzLWNydGMgaW4gb25lIG1vZHVsZSIpCsKgwqDCoMKgCsKgwqDCoMKgdGhlIGZvcm1lciBjb250
ZW50cyBvZiBpbXgtaXB1djMtY3J0Yy5vIGFyZSBidWlsdCB2aWEgaW14ZHJtLW9ianMuIFNvCsKg
wqDCoMKgdGhlcmUncyBubyBuZWVkIHRvIGtlZXAgYW4gZXh0cmEgZW50cnkgd2l0aCBhIG5vbiBl
eGlzdGluZyBjb25maWcgdmFsdWUKwqDCoMKgwqAoQ09ORklHX0RSTV9JTVhfSVBVVjMpLgrCoMKg
wqDCoArCoMKgwqDCoEZpeGVzOiAzZDFkZjk2YWQ0NjggKCJkcm0vaW14OiBtZXJnZSBpbXgtZHJt
LWNvcmUgYW5kIGlwdXYzLWNydGMgaW4gb25lIG1vZHVsZSIpCsKgwqDCoMKgU2lnbmVkLW9mZi1i
eTogR3VpZG8gR8O8bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KwqDCoMKgwqBSZXZpZXdlZC1ieTog
RmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgrCoMKgwqDCoFNpZ25lZC1vZmYtYnk6
IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+CgpubyBhY3Rpb24gbmVjZXNz
YXJ5IGlmIHlvdSBhZ3JlZSwgb3RoZXJ3aXNlIGp1c3Qgc2VuZCBhIHYyIGFuZCBJJ2xsCnJlcGxh
Y2UgaXQuCgpyZWdhcmRzClBoaWxpcHAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
