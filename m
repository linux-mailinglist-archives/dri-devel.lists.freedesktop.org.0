Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6170B214F6
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA00898EA;
	Fri, 17 May 2019 07:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A400189762
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:06:21 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id BC11268B02; Thu, 16 May 2019 17:48:20 +0200 (CEST)
Date: Thu, 16 May 2019 17:48:20 +0200
From: Torsten Duwe <duwe@lst.de>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Message-ID: <20190516154820.GA10431@lst.de>
References: <20190514155911.6C0AC68B05@newverein.lst.de>
 <20190514160241.9EAC768C7B@newverein.lst.de>
 <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
 <20190515093141.41016b11@blackhole.lan>
 <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Fri, 17 May 2019 07:54:52 +0000
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
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMDg6MDg6NTdBTSAtMDcwMCwgVmFzaWx5IEtob3J1emhp
Y2sgd3JvdGU6Cj4gT24gV2VkLCBNYXkgMTUsIDIwMTkgYXQgMTI6MzIgQU0gVG9yc3RlbiBEdXdl
IDxkdXdlQGxzdC5kZT4gd3JvdGU6Cj4gPgo+ID4gSXQgZG9lcyBjb21wbHkgd2l0aCB0aGUgYmlu
ZGluZ3MuIFRoZSBwb3J0cyBhcmUgYWxsIG9wdGlvbmFsLgo+ID4gQXMgZmFyIGFzIERUIGlzIGNv
bmNlcm5lZCwgdGhlIHNpZ25hbCBwYXRoIGVuZHMgaGVyZS4gVGhpcyBpcyBhbHNvIHRoZQo+ID4g
ZmluYWwgY29tcG9uZW50IF9yZXF1aXJlZF8gdG8gZ2V0IHRoZSBMaW51eCBrZXJuZWwgRFJJIHVw
IGFuZCBydW5uaW5nLgo+IAo+IFVnaCwgdGhlbiBiaW5kaW5ncyBzaG91bGQgYmUgZml4ZWQuIEl0
J3Mgbm90IG9wdGlvbmFsLiBJdCBtYXkgd29yayBpZgo+IGJvb3Rsb2FkZXIgZW5hYmxlcyBwb3dl
ciBmb3IgeW91LCBidXQgaXQgd29uJ3QgaWYgeW91IGRpc2FibGUgZGlzcGxheQo+IGRyaXZlciBp
biB1LWJvb3QuCgpJIGRvdWJsZS1jaGVja2VkLiBPbiB0aGUgVGVyZXMtSSwgbWVudGlvbmluZyB0
aGUgcGFuZWwgX2lzXyBvcHRpb25hbC4KUEQyMyBwb3dlcnMgZG93biBwYW5lbCBhbmQgYmFja2xp
Z2h0IGFzIG11Y2ggYXMgcG9zc2libGUsIHNlZQoyNGJkNWQyY2I5M2JjIGFybTY0OiBkdHM6IGFs
bHdpbm5lcjogYTY0OiB0ZXJlcy1pOiBlbmFibGUgYmFja2xpZ2h0CihjdXJyZW50bHkgb25seSBp
biBNYXhpbWUncyByZXBvKSBhbmQgdGhlIFRlcmVzLUkgc2NoZW1hdGljcy4uLgoKQW5kIHRoZSBk
cml2ZXIgaW4geW91ciByZXBvIG5lYXRseSBndWFyZHMgYWxsIGFjY2Vzc2VzIHdpdGgKImlmIChh
bng2MzQ1LT5wYW5lbCkiIC0tIGdvb2QhCkJ1dCBJIGZvdW5kIHRoZSBWZGRzIGFyZSByZXF1aXJl
ZCwgc28gSSBhZGRlZCB0aGVtIGFzIHN1Y2guCgo+IEkgZ3Vlc3MgeW91J3JlIHRlc3RpbmcgaXQg
d2l0aCBvbGRlciB2ZXJzaW9uIG9mIGFueDYzNDUuIE5ld2VyIHZlcnNpb24KPiB0aGF0IHN1cHBv
cnRzIHBvd2VyIG1hbmFnZW1lbnQgWzFdIG5lZWRzIHN0YXJ0dXAgZGVsYXkgZm9yIHBhbmVsLgo+
IEFub3RoZXIgaXNzdWUgdGhhdCB5b3UncmUgc2VlaW5nIGlzIHRoYXQgYmFja2xpZ2h0IGlzIG5v
dCBkaXNhYmxlZCBvbgo+IERQTVMgZXZlbnRzLiBBbGwgaW4gYWxsLCB5b3UgbmVlZCB0byBkZXNj
cmliZSBwYW5lbCBpbiBkdHMuCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9hbmFyc291bC9s
aW51eC0yLjYvY29tbWl0LzJmYmY5YzI0MjQxOWM4YmRhNjk4ZTgzMzFhMDJkNDMxMjE0M2FlMmMK
Cj4gPiBTaG91bGQgSSBhbHNvIGhhdmUgYWRkZWQgYSBUZXN0ZWQtYnk6ID8gOy0pCj4gCj4gSSBk
b24ndCBoYXZlIFRlcmVzLCBzbyBJIGhhdmVuJ3QgdGVzdGVkIHRoZXNlLgoKKkkqIGhhdmUgb25l
LCBhbmQgdGhpcyB3b3Jrcy4gSSdsbCByZXRlc3Qgd2l0aCB5b3VyIG5ld2VyIGRyaXZlciwKanVz
dCBpbiBjYXNlLiBOb25ldGhlbGVzcywgdGhlIGNoYW5nZXMgaW4gdGhpcyBzZXJpZXMgc2hvdWxk
IGJlIGZpbmUuClNlbmRpbmcgb3V0IHYyIGluIGEgbW9tZW50Li4uCgoJVG9yc3RlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
