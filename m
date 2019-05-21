Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED27265EC
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 018DD89AEB;
	Wed, 22 May 2019 14:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13608953E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 17:12:13 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id A62143A82DC
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 16:34:49 +0000 (UTC)
X-Originating-IP: 90.66.53.80
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 47052E000E;
 Tue, 21 May 2019 16:34:20 +0000 (UTC)
Date: Tue, 21 May 2019 18:34:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2] video: fbdev: atmel_lcdfb: add COMPILE_TEST support
Message-ID: <20190521163420.GI3274@piout.net>
References: <CGME20190521105217eucas1p19796d2969c1a568fecb0750818226241@eucas1p1.samsung.com>
 <f9d56fc1-3e02-9716-b764-82e9600e5919@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9d56fc1-3e02-9716-b764-82e9600e5919@samsung.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjEvMDUvMjAxOSAxMjo1MjoxNyswMjAwLCBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IHdy
b3RlOgo+IEFkZCBDT01QSUxFX1RFU1Qgc3VwcG9ydCB0byBhdG1lbF9sY2RmYiBkcml2ZXIgZm9y
IGJldHRlciBjb21waWxlCj4gdGVzdGluZyBjb3ZlcmFnZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBC
YXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+ClJldmll
d2VkLWJ5OiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+
Cgo+IC0tLQo+IHYyOiBhZGQgbWlzc2luZyBIQVZFX0NMSyAmJiBIQVMgSU9NRU0gZGVwZW5kZW5j
aWVzCj4gCj4gIGRyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZyB8ICAgIDMgKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBJbmRleDogYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcKPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gLS0tIGEvZHJpdmVycy92
aWRlby9mYmRldi9LY29uZmlnCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnCj4g
QEAgLTg1Niw3ICs4NTYsOCBAQCBjb25maWcgRkJfUzFEMTNYWFgKPiAgCj4gIGNvbmZpZyBGQl9B
VE1FTAo+ICAJdHJpc3RhdGUgIkFUOTEgTENEIENvbnRyb2xsZXIgc3VwcG9ydCIKPiAtCWRlcGVu
ZHMgb24gRkIgJiYgT0YgJiYgSEFWRV9GQl9BVE1FTAo+ICsJZGVwZW5kcyBvbiBGQiAmJiBPRiAm
JiBIQVZFX0NMSyAmJiBIQVNfSU9NRU0KPiArCWRlcGVuZHMgb24gSEFWRV9GQl9BVE1FTCB8fCBD
T01QSUxFX1RFU1QKPiAgCXNlbGVjdCBGQl9CQUNLTElHSFQKPiAgCXNlbGVjdCBGQl9DRkJfRklM
TFJFQ1QKPiAgCXNlbGVjdCBGQl9DRkJfQ09QWUFSRUEKCi0tIApBbGV4YW5kcmUgQmVsbG9uaSwg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
