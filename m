Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF75265F9
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6306889B67;
	Wed, 22 May 2019 14:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A6789913
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 08:15:08 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 107)
 id 3432E68BFE; Fri, 17 May 2019 10:14:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on verein.lst.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_50
 autolearn=disabled version=3.3.1
Received: from blackhole.lan (p5B33F92B.dip0.t-ipconnect.de [91.51.249.43])
 by newverein.lst.de (Postfix) with ESMTPSA id DBFF067329;
 Fri, 17 May 2019 10:14:19 +0200 (CEST)
Date: Fri, 17 May 2019 10:14:18 +0200
From: Torsten Duwe <duwe@lst.de>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Message-ID: <20190517101353.3e86d696@blackhole.lan>
In-Reply-To: <20190517072738.deohh5fly4jxms7k@flea>
References: <20190514155911.6C0AC68B05@newverein.lst.de>
 <20190514160241.9EAC768C7B@newverein.lst.de>
 <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
 <20190515093141.41016b11@blackhole.lan>
 <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
 <20190516154820.GA10431@lst.de>
 <CA+E=qVe5NkAvHXPvVc7iTbZn5sKeoRm0166zPW_s83c2gk7B+g@mail.gmail.com>
 <20190516164859.GB10431@lst.de>
 <20190517072738.deohh5fly4jxms7k@flea>
Organization: LST e.V.
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:25 +0000
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
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Harald Geyer <harald@ccbib.org>, Sean Paul <seanpaul@chromium.org>,
 arm-linux <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxNyBNYXkgMjAxOSAwOToyNzozOCArMDIwMApNYXhpbWUgUmlwYXJkIDxtYXhpbWUu
cmlwYXJkQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gT24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDY6
NDg6NTlQTSArMDIwMCwgVG9yc3RlbiBEdXdlIHdyb3RlOgo+ID4gT24gVGh1LCBNYXkgMTYsIDIw
MTkgYXQgMDk6MDY6NDFBTSAtMDcwMCwgVmFzaWx5IEtob3J1emhpY2sgd3JvdGU6Cj4gPiA+Cj4g
PiA+IERyaXZlciBjYW4gdGFsayB0byB0aGUgcGFuZWwgb3ZlciBBVVggY2hhbm5lbCBvbmx5IGFm
dGVyIHQxK3QzLAo+ID4gPiB0MSBpcyB1cCB0byAxMG1zLCB0MyBpcyB1cCB0byAyMDBtcy4KPiA+
Cj4gPiBUaGlzIGlzIGFmdGVyIHBvd2VyLW9uLiBUaGUgYm9vdCBsb2FkZXIgbmVlZHMgdG8gZGVh
bCB3aXRoIHRoaXMuCj4gCj4gVGhlIGJvb3Rsb2FkZXIgY2FuIGRlYWwgd2l0aCBpdCwgYnV0IHRo
ZSBrZXJuZWwgd2lsbCBhbHNvIG5lZWQgdG8uIFRoZQo+IGJvb3Rsb2FkZXIgbWlnaHQgbm90IGJl
IGRvaW5nIHRoaXMgYmVjYXVzZSBpdCdzIG5vdCBiZWVuIHVwZGF0ZWQsIHRoZQo+IHJlZ3VsYXRv
ciBtaWdodCBoYXZlIGJlZW4gZGlzYWJsZWQgYmV0d2VlbiB0aGUgdGltZSB0aGUga2VybmVsIHdh
cwo+IHN0YXJ0ZWQgYW5kIHRoZSB0aW1lIHRoZSBicmlkZ2UgZHJpdmVyIHByb2JlcywgZXRjLgoK
Tm8sIHlvdSBjYW5ub3QgcHJhY3RpY2FsbHkgc3dpdGNoIG9mZiB0aGlzIHZvbHRhZ2UuIEl0IHN1
cHBvcnRzIF9hbGxfCnRoZSBkZXZpY2VzIEkgbWVudGlvbmVkLiBJbiBmYWN0LCB0aGUgUE1JQyBu
ZWVkcyB0byBlbmFibGUgaXQgaW5pdGlhbGx5LAphbmQgdGhlbiBpdCB0YWtlcyBzb21lIHRpbWUg
YmVmb3JlIHRoZSBTb0MgY2FuIGFjY2VzcyB0aGUgTU1DIGFuZCByZWFkCnRoZSBTUEwgZnJvbSBp
dCwganVzdCBiZWNhdXNlIG9mIGV4YWN0bHkgdGhlc2UgMy4zVi4gVGhlbiB0aGUgYm9vdApsb2Fk
ZXIgc3RhcnRzLCBhbmQgbGF0ZXIgdGhlIGVEUCBicmlkZ2UgZ2V0cyBpbml0aWFsaXNlZC4KCklu
ICp0aGVvcnkqLCBhbGJlaXQgYSB2ZXJ5IGRhcmluZyBvbmUsIEkgY291bGQgaW1hZ2luZSBhIHZl
cnkgZGVlcApzbGVlcCBtb2RlIHRoYXQgY2FuIG9ubHkgYmUgZW5kZWQgYnkgcHJlc3NpbmcgdGhl
IHBvd2VyIGJ1dHRvbiwgd2hpY2gKc2hvdWxkIHN0aWxsIHdvcmsgd2l0aG91dCBEQ0RDMS4gT25s
eSB0aGVuLCBhIGRlc2NyaXB0aW9uIG9mIHRoZSBwYW5lbAp3b3VsZCBiZSByZXF1aXJlZC4gQnV0
IEkgcHJvYmFibHkgbWlzc2VkIHNvbWV0aGluZyBhbmQgZXZlbiB0aGlzIGRvZXMKbm90IHdvcmsu
CgpTbyBmb3IgYWxsIGN1cnJlbnQgcHJhY3RpY2FsIHB1cnBvc2VzLCB3ZSBjYW4gYXNzdW1lIHRo
ZSBUZXJlcy1JIHBhbmVsCnRvIGJlIHBvd2VyZWQgcHJvcGVybHkgYW5kIHByb3ZpZGluZyB2YWxp
ZCBFRElEOyBub3RoaW5nIHRvIHdvcnJ5IGFib3V0CmluIHNvZnR3YXJlLgoKSFRILAoJVG9yc3Rl
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
