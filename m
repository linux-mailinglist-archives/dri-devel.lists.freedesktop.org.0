Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F27A101AE1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDC56EBA7;
	Tue, 19 Nov 2019 08:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 30E316E0C4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 22:52:15 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id CF67D80BF;
 Mon, 18 Nov 2019 22:52:49 +0000 (UTC)
Date: Mon, 18 Nov 2019 14:52:09 -0800
From: Tony Lindgren <tony@atomide.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [RFCv1 11/42] ARM: dts: omap: add channel to DSI panels
Message-ID: <20191118225209.GF35479@atomide.com>
References: <20191117024028.2233-1-sebastian.reichel@collabora.com>
 <20191117024028.2233-12-sebastian.reichel@collabora.com>
 <2db2d505-2f92-621c-ba7c-552b89255594@ti.com>
 <20191118143332.nyyr6hb4b5c34xew@earth.universe>
 <7CBD93FA-60AB-4313-BF9C-230BDE2DAE7D@goldelico.com>
 <20191118150301.vvnsmztfxo76ghwe@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191118150301.vvnsmztfxo76ghwe@earth.universe>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
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
Cc: kernel@collabora.com, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Merlijn Wajer <merlijn@wizzup.org>, dri-devel@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4gWzE5
MTExOCAxNTowM106Cj4gT24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDM6Mzc6MTJQTSArMDEwMCwg
SC4gTmlrb2xhdXMgU2NoYWxsZXIgd3JvdGU6Cj4gPiA+IEFtIDE4LjExLjIwMTkgdW0gMTU6MzMg
c2NocmllYiBTZWJhc3RpYW4gUmVpY2hlbCA8c2ViYXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNv
bT46Cj4gPiA+IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDAzOjA1OjA3UE0gKzAyMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+ID4gPj4gT24gMTcvMTEvMjAxOSAwNDozOSwgU2ViYXN0aWFuIFJl
aWNoZWwgd3JvdGU6Cj4gPiA+Pj4gVGhlIHN0YW5kYXJkIGJpbmRpbmcgZm9yIERTSSByZXF1aXJl
cywgdGhhdCB0aGUgY2hhbm5lbCBudW1iZXIKPiA+ID4+PiBvZiB0aGUgcGFuZWwgaXMgZW5jb2Rl
ZCBpbiBEVC4gVGhpcyBhZGRzIHRoZSBjaGFubmVsIG51bWJlciBpbgo+ID4gPj4+IGFsbCBPTUFQ
My01IGJvYXJkcywgaW4gcHJlcGFyYXRpb24gZm9yIHVzaW5nIGNvbW1vbiBpbmZyYXN0cnVjdHVy
ZS4KPiA+ID4+PiAKPiA+ID4+PiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gUmVpY2hlbCA8c2Vi
YXN0aWFuLnJlaWNoZWxAY29sbGFib3JhLmNvbT4KPiA+ID4+PiAtLS0KPiA+ID4+PiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9wYW5lbC1kc2ktY20udHh0ICAgICAgfCA0
ICsrKy0KPiA+ID4+PiAgYXJjaC9hcm0vYm9vdC9kdHMvb21hcDMtbjk1MC5kdHMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAzICsrLQo+ID4gPj4+ICBhcmNoL2FybS9ib290L2R0cy9vbWFw
My5kdHNpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDMgKysrCj4gPiA+Pj4gIGFy
Y2gvYXJtL2Jvb3QvZHRzL29tYXA0LWRyb2lkNC14dDg5NC5kdHMgICAgICAgICAgICAgICAgICAg
IHwgMyArKy0KPiA+ID4+PiAgYXJjaC9hcm0vYm9vdC9kdHMvb21hcDQtc2RwLmR0cyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCA2ICsrKystLQo+ID4gPj4+ICBhcmNoL2FybS9ib290L2R0
cy9vbWFwNC5kdHNpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgKysrKysrCj4g
PiA+Pj4gIGFyY2gvYXJtL2Jvb3QvZHRzL29tYXA1LmR0c2kgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNiArKysrKysKPiA+ID4+PiAgNyBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRp
b25zKCspLCA1IGRlbGV0aW9ucygtKQo+ID4gPj4gCj4gPiA+PiBJcyB0aGlzIHJlcXVpcmVkIG9u
bHkgaW4gdGhlIC50eHQsIG9yIGFsc28gYnkgdGhlIGRyaXZlcj8gVGhpcyBkb2VzIGJyZWFrCj4g
PiA+PiBiYWNrd2FyZCBjb21wYXRpYmlsaXR5IHdpdGggdGhlIGR0YnMsIGFuZCB0aGVyZSdzIGFs
d2F5cyBzb21lb25lIHdobyB3b24ndAo+ID4gPj4gbGlrZSBpdC4KPiA+ID4gCj4gPiA+IEkgYWRk
IGEgY29tcGF0aWJsZSBzdHJpbmcgZm9yIHRoZSBEcm9pZCA0IHBhbmVsIGluIGFkZGl0aW9uIHRv
IHRoZQo+ID4gPiBnZW5lcmljIG9uZSwgd2hpY2ggaXMgbm90IHJlYWxseSByZXF1aXJlZCBhbmQg
anVzdCBhIHByZWNhdXRpb24gaW4KPiA+ID4gY2FzZSB3ZSBuZWVkIHNvbWUgcXVpcmtzIGluIHRo
ZSBmdXR1cmUuCj4gPiA+IAo+ID4gPiBCdXQgSSBoYWQgdG8gYWRkIHRoZSBEU0kgY2hhbm5lbCB0
byBEVCwgd2hpY2ggaXMgcmVxdWlyZWQgdG8gZm9sbG93Cj4gPiA+IHRoZSBzdGFuZGFyZCBEU0kg
YmluZGluZ3MuIFdlIGNhbm5vdCB1c2UgdGhlIGdlbmVyaWMgaW5mcmFzdHJ1Y3R1cmUKPiA+ID4g
d2l0aG91dCB0aGlzIGNoYW5nZS4gVGVjaG5pY2FsbHkgaXQgc2hvdWxkIGhhdmUgYmVlbiB0aGVy
ZSBhbGwgdGhlCj4gPiA+IHRpbWUsIGl0IGlzIG9ubHkgd29ya2luZyBiZWNhdXNlIGl0IGlzIGN1
cnJlbnRseSBoYXJkY29kZWQgdG8gMCBpbgo+ID4gPiB0aGUgcGFuZWwgZHJpdmVyLgo+ID4gCj4g
PiBJcyBpdCBwb3NzaWJsZSB0byBjaGFuZ2UgaXQgdG8gZGVmYXVsdCB0byBjaGFubmVsIDwwPiBp
ZiByZWcgaXMgbm90Cj4gPiBzcGVjaWZpZWQ/Cj4gCj4gQ3VycmVudGx5IG5vZGVzIHdpdGhvdXQg
cmVnIHByb3BlcnR5IGFyZSBza2lwcGVkIGJ5IG9mX21pcGlfZHNpX2RldmljZV9hZGQoKQo+IGFu
ZCBvZl9taXBpX2RzaV9kZXZpY2VfYWRkKCkgZmFpbHMgaWYgcmVnIG5vZGUgaXMgbWlzc2luZy4g
VGVjaG5pY2FsbHkKPiBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gZGVmYXVsdCB0byBjaGFubmVs
IDAgdGhlcmUuIFRoYXQgYWZmZWN0cyBhbGwKPiBwbGF0Zm9ybXMsIHRob3VnaC4gQ29uc2lkZXJp
bmcgdGhlIHNtYWxsIGFtb3VudCBvZiBib2FyZHMgYWZmZWN0ZWQsIEkgdGhpbmsKPiBpdHMgYmV0
dGVyIHRvIGp1c3QgZml4IHRoZSBEVC4gQWxzbyB0aGUgZml4ZWQgRFQgZG9lcyBub3QgbWFrZSBw
cm9ibGVtcwo+IHdpdGggb2xkZXIga2VybmVscyBhbmQgY2FuIGJlIGJhY2twb3J0ZWQuCgpZb3Ug
bWlnaHQgYmUgYWJsZSB0byBkbyBhIGxvY2FsIGZpeHVwIGF0IGRyaXZlciBwcm9iZSB0aW1lIHVz
aW5nCm9mX2FkZF9wcm9wZXJ0eSgpLiBTZWUgZm9yIGV4YW1wbGUgcGNzX3F1aXJrX21pc3Npbmdf
cGluY3RybF9jZWxscygpCkkgYWRkZWQgZWFybGllciBiZWNhdXNlIG9mIHNpbWlsYXIgaXNzdWVz
LgoKUmVnYXJkcywKClRvbnkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
