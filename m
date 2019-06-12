Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDF243362
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A061892DC;
	Thu, 13 Jun 2019 07:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5A48968D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 14:59:58 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 1205768B02; Wed, 12 Jun 2019 16:59:27 +0200 (CEST)
Date: Wed, 12 Jun 2019 16:59:26 +0200
From: Torsten Duwe <duwe@lst.de>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 6/7] dt-bindings: Add ANX6345 DP/eDP transmitter binding
Message-ID: <20190612145926.GA28426@lst.de>
References: <20190604122150.29D6468B05@newverein.lst.de>
 <CGME20190604122333epcas2p2f2c750e19a363901c83abb83354f55d4@epcas2p2.samsung.com>
 <20190604122305.07B9068B05@newverein.lst.de>
 <354de37d-57bb-6b06-c81a-a2081ea4f222@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <354de37d-57bb-6b06-c81a-a2081ea4f222@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
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
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTIsIDIwMTkgYXQgMTA6MTY6MzdBTSArMDIwMCwgQW5kcnplaiBIYWpkYSB3
cm90ZToKPiA+ICtUaGUgQU5YNjM0NSBpcyBhbiB1bHRyYS1sb3cgcG93ZXIgRnVsbC1IRCBlRFAg
dHJhbnNtaXR0ZXIgZGVzaWduZWQgZm9yCj4gPiArcG9ydGFibGUgZGV2aWNlcy4KPiA+ICsKPiA+
ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gKwo+ID4gKyAtIGNvbXBhdGlibGUJCTogImFuYWxv
Z2l4LGFueDYzNDUiCj4gPiArIC0gcmVnCQkJOiBJMkMgYWRkcmVzcyBvZiB0aGUgZGV2aWNlCj4g
PiArIC0gcmVzZXQtZ3Bpb3MJCTogV2hpY2ggR1BJTyB0byB1c2UgZm9yIHJlc2V0Cj4gCj4gCj4g
WW91IGhhdmUgbm90IHNwZWNpZmllZCBpdCdzIGFjdGl2ZSBzdGF0ZSwgc2luY2UgaW4gZHJpdmVy
J3MgY29kZSB5b3UKPiBuYW1lZCBpdCBSRVNFVE4gSSBndWVzcyBpdCBzaG91bGQgYmUgYWN0aXZl
IGxvdy4KClllcy4gVGhlIGNoaXAncyByZXNldCBpcyBhY3RpdmUgbG93Lgo+IAo+ID4gKyAtIGR2
ZGQxMi1zdXBwbHkJOiBSZWd1bGF0b3IgZm9yIDEuMlYgZGlnaXRhbCBjb3JlIHBvd2VyLgo+ID4g
KyAtIGR2ZGQyNS1zdXBwbHkJOiBSZWd1bGF0b3IgZm9yIDIuNVYgZGlnaXRhbCBjb3JlIHBvd2Vy
Lgo+ID4gKyAtIFZpZGVvIHBvcnQgZm9yIExWVFRMIGlucHV0LCB1c2luZyB0aGUgRFQgYmluZGlu
Z3MgZGVmaW5lZCBpbiBbMV0uCj4gCj4gCj4gUGxlYXNlIGFzc2lnbiBwb3J0IG51bWJlciBmb3Ig
aW5wdXQgKEkgZ3Vlc3MgMCkuCgpUcnVlLgoKPiAKPiA+ICsKPiA+ICtPcHRpb25hbCBwcm9wZXJ0
aWVzOgo+ID4gKwo+ID4gKyAtIFZpZGVvIHBvcnQgZm9yIGVEUCBvdXRwdXQgKHBhbmVsIG9yIGNv
bm5lY3RvcikgdXNpbmcgdGhlIERUIGJpbmRpbmdzCj4gPiArICAgZGVmaW5lZCBpbiBbMV0uCj4g
Cj4gCj4gU2hvdWxkbid0IGl0IGJlIGFsc28gcmVxdWlyZWQ/CgpTZWUgcHJldmlvdXMgZGlzY3Vz
c2lvbi4gU3VyZWx5IHRoZXJlIHNob3VsZCBiZSBfc29tZXRoaW5nXyBjb25uZWN0ZWQgdG8KdGhl
IG91dHB1dCBzaWRlLCBidXQgdGhhdCBzb21ldGhpbmcgbWlnaHQgbm90IGJlIHJlbGV2YW50IGZv
ciB0aGUgc29mdHdhcmUKc2lkZSwgc28gaXQgbWlnaHQgYmUgb21pdHRlZCBmcm9tIHRoZSBkZXZp
Y2UgdHJlZS4KCkluIGZhY3QsIEknbGwgc3VibWl0IHYzIHdpdGggdGhlIFNQRFggY2hhbmdlcyBh
bmQgd2l0aG91dCBleGFjdGx5IHRoaXMKb3V0cHV0IHBvcnQgc3BlYyB3aGljaCBoYWQgY2F1c2Vk
IHRoZSBoZWF0ZWQgZGlzY3Vzc2lvbi4KCglUb3JzdGVuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
