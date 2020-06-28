Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A7920C6DB
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 09:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C55B6E081;
	Sun, 28 Jun 2020 07:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CB16E081
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 07:52:50 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 0AEF22002B;
 Sun, 28 Jun 2020 09:52:46 +0200 (CEST)
Date: Sun, 28 Jun 2020 09:52:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 2/2] drm/panel-simple: Add missing BUS descriptions
 for some panels
Message-ID: <20200628075245.GA128039@ravnborg.org>
References: <20200621222742.25695-1-digetx@gmail.com>
 <20200621222742.25695-3-digetx@gmail.com>
 <20200627204338.GL5966@pendragon.ideasonboard.com>
 <dd1c5972-bbac-c2d8-76e8-08997b951e52@gmail.com>
 <20200628070745.GC6954@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200628070745.GC6954@pendragon.ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=IkcTkHD0fZMA:10 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8
 a=gXmQgUmAU1xYsUhDFicA:9 a=QEXdDO2ut3YA:10 a=D0XLA9XvdZm18NrgonBM:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCk9uIFN1biwgSnVuIDI4LCAyMDIwIGF0IDEwOjA3OjQ1QU0gKzAzMDAsIExh
dXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gSGkgRG1pdHJ5LAo+IAo+IE9uIFN1biwgSnVuIDI4LCAy
MDIwIGF0IDAyOjQ0OjE1QU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiA+IDI3LjA2
LjIwMjAgMjM6NDMsIExhdXJlbnQgUGluY2hhcnQg0L/QuNGI0LXRgjoKPiA+ID4gT24gTW9uLCBK
dW4gMjIsIDIwMjAgYXQgMDE6Mjc6NDJBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+
ID4gPj4gVGhpcyBwYXRjaCBhZGRzIG1pc3NpbmcgQlVTIGZpZWxkcyB0byB0aGUgZGlzcGxheSBw
YW5lbCBkZXNjcmlwdGlvbnMgb2YKPiA+ID4+IHRoZSBwYW5lbHMgd2hpY2ggYXJlIGZvdW5kIG9u
IE5WSURJQSBUZWdyYSBkZXZpY2VzOgo+ID4gPj4KPiA+ID4+ICAgMS4gQVVPIEIxMDFBVzAzCj4g
PiA+PiAgIDIuIENodW5naHdhIENMQUEwNzBXUDAzWEcKPiA+ID4+ICAgMy4gQ2h1bmdod2EgQ0xB
QTEwMVdBMDFBCj4gPiA+PiAgIDQuIENodW5naHdhIENMQUExMDFXQjAxCj4gPiA+PiAgIDUuIElu
bm9sdXggTjE1NkJHRSBMMjEKPiA+ID4+ICAgNi4gU2Ftc3VuZyBMVE4xMDFOVDA1Cj4gPiA+Pgo+
ID4gPj4gU3VnZ2VzdGVkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+Cj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRp
Z2V0eEBnbWFpbC5jb20+Cj4gPiA+PiAtLS0KPiA+ID4+ICBkcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2ltcGxlLmMgfCAxMiArKysrKysrKysrKysKPiA+ID4+ICAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKQo+ID4gPj4KPiA+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2lt
cGxlLmMKPiA+ID4+IGluZGV4IDg3ZWRkMmJkZjA5YS4uOTg2ZGY5OTM3NjUwIDEwMDY0NAo+ID4g
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4gPiA+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+ID4+IEBAIC02OTgsNiAr
Njk4LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIGF1b19iMTAxYXcwMyA9IHsK
PiA+ID4+ICAJCS53aWR0aCA9IDIyMywKPiA+ID4+ICAJCS5oZWlnaHQgPSAxMjUsCj4gPiA+PiAg
CX0sCj4gPiA+PiArCS5idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I2NjZfMVg3WDNfU1BX
RywKPiA+ID4+ICsJLmJ1c19mbGFncyA9IERSTV9CVVNfRkxBR19ERV9ISUdIIHwgRFJNX0JVU19G
TEFHX1BJWERBVEFfRFJJVkVfUE9TRURHRSwKPiA+ID4gCj4gPiA+IERvZXMgRFJNX0JVU19GTEFH
X1BJWERBVEFfRFJJVkVfKiBtYWtlIHNlbnNlIGZvciBMVkRTID8KPiA+IAo+ID4gVG8gYmUgaG9u
ZXN0IEkgZG9uJ3Qga25vdyB3aGV0aGVyIGl0IG1ha2Ugc2Vuc2Ugb3Igbm90IGZvciBMVkRTLiBJ
IHNhdwo+ID4gdGhhdCBvdGhlciBMVkRTIHBhbmVscyBpbiBwYW5lbC1zaW1wbGUuYyB1c2UgdGhl
IFBJWERBVEEgZmxhZyBhbmQgdGhlbgo+ID4gbG9va2VkIGF0IHdoYXQgdGltaW5nIGRpYWdyYW1z
IGluIHRoZSBkYXRhc2hlZXRzIHNob3cuCj4gCj4gSSB0aGluayB3ZSBzaG91bGQgZHJvcCBEUk1f
QlVTX0ZMQUdfUElYREFUQV9EUklWRV8qIGZvciBMVkRTIHBhbmVscy4KPiBJJ2xsIHN1Ym1pdCBh
IHBhdGNoLgoKV2Ugc2hvdWxkIGFsc28gY2xlYW4gdXAgYWxsIHRoZSBEUk1fQlVTX0ZMQUdfKiBv
bmUgZGF5LgpObyBuZWVkIGZvciB0aGUgZGVwcmVjYXRlZCB2YWx1ZXMsIHNvIGEgZmV3IGZpbGVz
IG5lZWRzIGFuIHVwZGF0ZS4KQW5kIHdlIGNvdWxkIGRvY3VtZW50IHdoYXQgZmxhZ3MgbWFrZXMg
c2Vuc2UgZm9yIExWRFMgZXRjLgoKT24gdGhlIFRPRE8gbGlzdC4uLgoKCVNhbQo+IAo+ID4gPiBU
aGUgcmVzdCBsb29rcyBnb29kLCBleGNlcHQgdGhlIFNhbXN1bmcgcGFuZWwgZm9yIHdoaWNoIEkg
aGF2ZW4ndCBiZWVuCj4gPiA+IGFibGUgdG8gbG9jYXRlIGEgZGF0YXNoZWV0Lgo+ID4gPiAKPiA+
ID4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KPiA+IAo+ID4gVGhhbmtzIHRvIHlvdSBhbmQgU2FtIQo+IAo+IC0tIAo+IFJl
Z2FyZHMsCj4gCj4gTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
