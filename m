Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA8136CE3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21EBD895E7;
	Thu,  6 Jun 2019 07:04:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C98DC897F9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 10:13:44 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 5F8F468B05; Wed,  5 Jun 2019 12:13:17 +0200 (CEST)
Date: Wed, 5 Jun 2019 12:13:17 +0200
From: Torsten Duwe <duwe@lst.de>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: allwinner: a64: enable ANX6345
 bridge on Teres-I
Message-ID: <20190605101317.GA9345@lst.de>
References: <20190604122150.29D6468B05@newverein.lst.de>
 <20190604122308.98D4868B20@newverein.lst.de>
 <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+E=qVckHLqRngsfK=AcvstrD0ymEfRkYyhS_kBtZ3YWdE3L=g@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDg6MDg6NDBBTSAtMDcwMCwgVmFzaWx5IEtob3J1emhp
Y2sgd3JvdGU6Cj4gT24gVHVlLCBKdW4gNCwgMjAxOSBhdCA1OjIzIEFNIFRvcnN0ZW4gRHV3ZSA8
ZHV3ZUBsc3QuZGU+IHdyb3RlOgo+ID4KPiA+IFRlcmVzLUkgaGFzIGFuIGFueDYzNDUgYnJpZGdl
IGNvbm5lY3RlZCB0byB0aGUgUkdCNjY2IExDRCBvdXRwdXQsIGFuZAo+ID4gdGhlIEkyQyBjb250
cm9sbGluZyBzaWduYWxzIGFyZSBjb25uZWN0ZWQgdG8gSTJDMCBidXMuIGVEUCBvdXRwdXQgZ29l
cwo+ID4gdG8gYW4gSW5ub2x1eCBOMTE2QkdFIHBhbmVsLgo+ID4KPiA+IEVuYWJsZSBpdCBpbiB0
aGUgZGV2aWNlIHRyZWUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8aWNl
bm93eUBhb3NjLmlvPgo+ID4gU2lnbmVkLW9mZi1ieTogVG9yc3RlbiBEdXdlIDxkdXdlQHN1c2Uu
ZGU+Cj4gPiAtLS0KPiA+ICAuLi4vYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMt
aS5kdHMgICAgICB8IDY1ICsrKysrKysrKysrKysrKysrKysrLS0KPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNjEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
YXJjaC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10ZXJlcy1pLmR0cyBiL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjUwaS1hNjQtdGVyZXMtaS5kdHMKPiA+IGlu
ZGV4IDBlYzQ2Yjk2OWE3NS4uYTBhZDQzOGIwMzdmIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10ZXJlcy1pLmR0cwo+ID4gKysrIGIvYXJj
aC9hcm02NC9ib290L2R0cy9hbGx3aW5uZXIvc3VuNTBpLWE2NC10ZXJlcy1pLmR0cwo+ID4gQEAg
LTY1LDYgKzY1LDIxIEBACj4gPiAgICAgICAgICAgICAgICAgfTsKPiA+ICAgICAgICAgfTsKPiA+
Cj4gPiArICAgICAgIHBhbmVsOiBwYW5lbCB7Cj4gPiArICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9Imlubm9sdXgsbjExNmJnZSIsICJzaW1wbGUtcGFuZWwiOwo+IAo+IEl0J3Mgc3RpbGwgInNp
bXBsZS1wYW5lbCIuIEkgYmVsaWV2ZSBJIGFscmVhZHkgbWVudGlvbmVkIHRoYXQgUm9iCj4gYXNr
ZWQgaXQgdG8gYmUgZWRwLWNvbm5lY3Rvci4KPiAKRm9yIHdoaWNoIHRoZXJlIGFyZSBuZWl0aGVy
IGJpbmRpbmdzIG5vciBkcml2ZXJzLgoKSXMgYW55Ym9keSBzZXJpb3VzbHkgcHJvcG9zaW5nIHRv
IGhvbGQgYmFjayBzdXBwb3J0IGZvciBleGlzdGluZwoob3BlbiBzb3VyY2UhKSBoYXJkd2FyZSBp
biBmYXZvdXIgb2YgYW4gKmltYWdpbmFibGUqICpwb3NzaWJseSogYmV0dGVyCnNvbHV0aW9uPyBF
c3BlY2lhbGx5IHdoZW4gdGhpcyBleGFjdCBsaW5lIGlzIGFscmVhZHkgdXNlZCBpbiBzb21lIG90
aGVyIHBsYWNlcz8KKHRoZXJlJ3MgYSBzcGFjZSBtaXNzaW5nIGJ0dy4uLikKCkknbSBtb3JlIHRo
YW4gZ2xhZCB0byBmb2xsb3cgYW55IGNvbnN0cnVjdGl2ZSBpbXByb3ZlbWVudHMgdG93YXJkcyBi
ZXR0ZXIKbW9kdWxhcml0eS4gSG93ZXZlciB0aGVyZSB3ZXJlIG5vbmUgc28gZmFyLCBhbmQgb24g
dG9wIG9mIHRoYXQsIGl0J3MgYSBsYXB0b3AuCkkgc2VlIGxpdHRsZSBhZHZhbnRhZ2UgaW4gbWVu
dGlvbmluZyBhbiBpbnRlcm5hbCBjb25uZWN0b3Igd2hlbiB0aGUgcGFuZWwKY29ubmVjdGVkIGlz
IGFsd2F5cyB0aGUgc2FtZS4KCkZXSVcsIFJvYiBzaG91bGQgYWxzbyBoYXZlIHJlY2VpdmVkIHRo
ZXNlIHBhdGNoZXMuCgoJVG9yc3RlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
