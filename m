Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985812002A
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 09:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A6D8930C;
	Thu, 16 May 2019 07:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F61589598
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 07:32:22 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 107)
 id 0C23668C65; Wed, 15 May 2019 09:32:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on verein.lst.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_50
 autolearn=disabled version=3.3.1
Received: from blackhole.lan (p5B33F92B.dip0.t-ipconnect.de [91.51.249.43])
 by newverein.lst.de (Postfix) with ESMTPSA id A72FF68AFE;
 Wed, 15 May 2019 09:31:33 +0200 (CEST)
Date: Wed, 15 May 2019 09:31:41 +0200
From: Torsten Duwe <duwe@lst.de>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Message-ID: <20190515093141.41016b11@blackhole.lan>
In-Reply-To: <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
References: <20190514155911.6C0AC68B05@newverein.lst.de>
 <20190514160241.9EAC768C7B@newverein.lst.de>
 <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
Organization: LST e.V.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 16 May 2019 07:22:48 +0000
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
 Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>,
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

T24gVHVlLCAxNCBNYXkgMjAxOSAxMDo0ODo0MCAtMDcwMApWYXNpbHkgS2hvcnV6aGljayA8YW5h
cnNvdWxAZ21haWwuY29tPiB3cm90ZToKCj4gPiArICAgICAgIGFueDYzNDU6IGFueDYzNDVAMzgg
ewo+ID4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW5hbG9naXgsYW54NjM0NSI7Cj4g
PiArICAgICAgICAgICAgICAgcmVnID0gPDB4Mzg+Owo+ID4gKyAgICAgICAgICAgICAgIHJlc2V0
LWdwaW9zID0gPCZwaW8gMyAyNCBHUElPX0FDVElWRV9MT1c+OyAvKiBQRDI0Cj4gPiAqLwo+ID4g
KyAgICAgICAgICAgICAgIGR2ZGQyNS1zdXBwbHkgPSA8JnJlZ19kbGRvMj47Cj4gPiArICAgICAg
ICAgICAgICAgZHZkZDEyLXN1cHBseSA9IDwmcmVnX2RsZG8zPjsKPiA+ICsKPiA+ICsgICAgICAg
ICAgICAgICBwb3J0IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGFueDYzNDVfaW46IGVu
ZHBvaW50IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVtb3RlLWVuZHBv
aW50ID0KPiA+IDwmdGNvbjBfb3V0X2FueDYzNDU+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgfTsKPiA+ICsgICAgICAgICAgICAgICB9Owo+IAo+IEl0IGRvZXNuJ3QgY29tcGx5IHdpdGgg
YmluZGluZ3MgZG9jdW1lbnQuIFlvdSBuZWVkIHRvIGFkZCBvdXQgZW5kcG9pbnQKCkl0IGRvZXMg
Y29tcGx5IHdpdGggdGhlIGJpbmRpbmdzLiBUaGUgcG9ydHMgYXJlIGFsbCBvcHRpb25hbC4KQXMg
ZmFyIGFzIERUIGlzIGNvbmNlcm5lZCwgdGhlIHNpZ25hbCBwYXRoIGVuZHMgaGVyZS4gVGhpcyBp
cyBhbHNvIHRoZQpmaW5hbCBjb21wb25lbnQgX3JlcXVpcmVkXyB0byBnZXQgdGhlIExpbnV4IGtl
cm5lbCBEUkkgdXAgYW5kIHJ1bm5pbmcuCgo+IGFzIHdlbGwsIGFuZCB0byBkbyBzbyB5b3UgbmVl
ZCB0byBhZGQgYmluZGluZ3MgZm9yIGVEUCBjb25uZWN0b3IgZmlyc3QKPiBhbmQgdGhlbiBpbXBs
ZW1lbnQgcGFuZWwgZHJpdmVyLgo+IFNlZSBSb2IncyBzdWdnZXN0aW9ucyBoZXJlOiBodHRwOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcGF0Y2gvMTA0MjU5My8KCldlbGwsIG9uZSAqY291bGQqIGV4
dGVuZCB0aGUgaGFyZHdhcmUgZGVzY3JpcHRpb24gZG93biB0byB0aGUgYWN0dWFsCnBhbmVsIGlm
IG5lY2Vzc2FyeSwgYnV0IG9uIHRoZSBUZXJlcy1JIGl0IGlzIG5vdC4gSSBhc3N1bWUgdGhlIHBh
bmVsCnRoZXkgc2hpcCBwcm92aWRlcyBwcm9wZXIgRURJRCB0byB0aGUgYW54NjM0NSwgYmVjYXVz
ZSB0aGUgZGlzcGxheQp3b3JrcyBmaW5lIGhlcmUgd2l0aCB0aGlzIERULgoKRG8gSSB1bmRlcnN0
YW5kIHRoaXMgY29ycmVjdGx5IHRoYXQgdGhlICgzIGRpZmZlcmVudD8pIHBpbmVib29rIHBhbmVs
cwphcmUgbm90IHRoYXQgZWFzeSB0byBoYW5kbGU/IEkgdHJ5IHRvIGluY2x1ZGUgdGhlIHBpbmVi
b29rIHdoZXJldmVyCnBvc3NpYmxlLCBqdXN0IGJlY2F1c2UgaXQncyBzbyBzaW1pbGFyLCBidXQg
aGVyZSBJJ20gYSBiaXQgbG9zdCwgc28gSQpoYWQgdG8gb21pdCB0aGVzZSBwYXJ0cy4KClNob3Vs
ZCBJIGFsc28gaGF2ZSBhZGRlZCBhIFRlc3RlZC1ieTogPyA7LSkKCglUb3JzdGVuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
