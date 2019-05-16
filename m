Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B83214DD
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC36489823;
	Fri, 17 May 2019 07:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 055DF89622
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:49:22 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 17CF168B02; Thu, 16 May 2019 18:49:00 +0200 (CEST)
Date: Thu, 16 May 2019 18:48:59 +0200
From: Torsten Duwe <duwe@lst.de>
To: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Message-ID: <20190516164859.GB10431@lst.de>
References: <20190514155911.6C0AC68B05@newverein.lst.de>
 <20190514160241.9EAC768C7B@newverein.lst.de>
 <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
 <20190515093141.41016b11@blackhole.lan>
 <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
 <20190516154820.GA10431@lst.de>
 <CA+E=qVe5NkAvHXPvVc7iTbZn5sKeoRm0166zPW_s83c2gk7B+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+E=qVe5NkAvHXPvVc7iTbZn5sKeoRm0166zPW_s83c2gk7B+g@mail.gmail.com>
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

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDk6MDY6NDFBTSAtMDcwMCwgVmFzaWx5IEtob3J1emhp
Y2sgd3JvdGU6Cj4gCj4gRHJpdmVyIGNhbiB0YWxrIHRvIHRoZSBwYW5lbCBvdmVyIEFVWCBjaGFu
bmVsIG9ubHkgYWZ0ZXIgdDErdDMsIHQxIGlzCj4gdXAgdG8gMTBtcywgdDMgaXMgdXAgdG8gMjAw
bXMuCgpUaGlzIGlzIGFmdGVyIHBvd2VyLW9uLiBUaGUgYm9vdCBsb2FkZXIgbmVlZHMgdG8gZGVh
bCB3aXRoIHRoaXMuCgo+IEl0IHdvcmtzIHdpdGggb2xkZXIgdmVyc2lvbiBvZiBkcml2ZXIKPiB0
aGF0IGtlZXBzIHBhbmVsIGFsd2F5cyBvbiBiZWNhdXNlIGl0IHRha2VzIGEgd2hpbGUgYmV0d2Vl
biBkcml2ZXIKPiBwcm9iZSBhbmQgcGlwZWxpbmUgc3RhcnQuCgpObyBsaWQgc3dpdGNoLCBubyBV
U0IsIG5vIFdpRmksIG5vIE1NQy4gSWYgeW91IGRpc2FibGUgRENEQzEgeW91J2xsCnJ1biBvdXQg
b2Ygd2FrZXVwLXNvdXJjZXMgOy0pIElPVzogSSBzZWUgbm8gcHJhY3RpY2FsIHdheSBhbnkgT1MK
ZHJpdmVyIGNhbiBzd2l0Y2ggdGhpcyBwYW5lbCB2b2x0YWdlIG9mZiBhbmQgc3Vydml2ZS4uLgoK
PiBBbGwgaW4gYWxsIC0geW91IGRvbid0IG5lZWQgcGFuZWwgdGltaW5ncyBzaW5jZSB0aGVyZSdz
IEVESUQgYnV0IHlvdQo+IHN0aWxsIG5lZWQgcGFuZWwgZGVsYXlzLiBBbnl3YXksIGl0J3MgdXAg
dG8geW91IGFuZCBtYWludGFpbmVycy4KCkxldCdzIGdpdmUgaXQgYSB0cnkuCgoJVG9yc3RlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
