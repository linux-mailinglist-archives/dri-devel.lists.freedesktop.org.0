Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5E4558B5
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBC26E216;
	Tue, 25 Jun 2019 20:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326CD6E02A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:26:16 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 1465780301;
 Tue, 25 Jun 2019 22:26:12 +0200 (CEST)
Date: Tue, 25 Jun 2019 22:26:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: drm/panel: simple: add ortustech,
 com37h3m05dtc panel
Message-ID: <20190625202611.GA18595@ravnborg.org>
References: <cover.1559905870.git.hns@goldelico.com>
 <a650cb8df1bdf58ec3c8a182532692db16b77f70.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a650cb8df1bdf58ec3c8a182532692db16b77f70.1559905870.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ztCEdXhiAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=TaQvIJAheEgyp50s76YA:9
 a=CjuIK1q_8ugA:10 a=nCm3ceeH17rKjHWsMeRo:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 letux-kernel@openphoenux.org, David Airlie <airlied@linux.ie>,
 marek.belisko@gmail.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, tomi.valkeinen@ti.com,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMDE6MTE6MDlQTSArMDIwMCwgSC4gTmlrb2xhdXMgU2No
YWxsZXIgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogSC4gTmlrb2xhdXMgU2NoYWxsZXIgPGhuc0Bn
b2xkZWxpY28uY29tPgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
PgoKV2UgbmVlZCBPSyBmcm9tIG9uZSBvZiB0aGUgRFQgcGVvcGxlIGJlZm9yZSB3ZSBjYW4gYXBw
bHkgdGhpcy4KCglTYW0KCj4gLS0tCj4gIC4uLi9kaXNwbGF5L3BhbmVsL29ydHVzdGVjaCxjb20z
N2gzbTA1ZHRjLnR4dCAgICAgICAgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDEyIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL29ydHVzdGVjaCxjb20zN2gzbTA1ZHRjLnR4
dAo+IAo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9vcnR1c3RlY2gsY29tMzdoM20wNWR0Yy50eHQgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9vcnR1c3RlY2gsY29tMzdoM20wNWR0Yy50
eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzE2OTA3YzAy
ZjgwCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL29ydHVzdGVjaCxjb20zN2gzbTA1ZHRjLnR4dAo+IEBAIC0wLDAg
KzEsMTIgQEAKPiArT3J0dXNUZWNoIENPTTM3SDNNMDVEVEMgQmxhbnZpZXcgMy43IiBWR0EgcG9y
dHJhaXQgVEZULUxDRCBwYW5lbAo+ICsKPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiArLSBjb21w
YXRpYmxlOiBzaG91bGQgYmUgIm9ydHVzdGVjaCxjb20zN2gzbTA1ZHRjIgo+ICsKPiArT3B0aW9u
YWwgcHJvcGVydGllczoKPiArLSBlbmFibGUtZ3Bpb3M6IEdQSU8gcGluIHRvIGVuYWJsZSBvciBk
aXNhYmxlIHRoZSBwYW5lbAo+ICstIGJhY2tsaWdodDogcGhhbmRsZSBvZiB0aGUgYmFja2xpZ2h0
IGRldmljZSBhdHRhY2hlZCB0byB0aGUgcGFuZWwKPiArLSBwb3dlci1zdXBwbHk6IHBoYW5kbGUg
b2YgdGhlIHJlZ3VsYXRvciB0aGF0IHByb3ZpZGVzIHRoZSBzdXBwbHkgdm9sdGFnZQo+ICsKPiAr
VGhpcyBiaW5kaW5nIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgc2ltcGxlLXBhbmVsIGJpbmRpbmcs
IHdoaWNoIGlzIHNwZWNpZmllZAo+ICtpbiBzaW1wbGUtcGFuZWwudHh0IGluIHRoaXMgZGlyZWN0
b3J5Lgo+IC0tIAo+IDIuMTkuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
