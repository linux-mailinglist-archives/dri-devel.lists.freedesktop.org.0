Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB07F265F0
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB8E89B11;
	Wed, 22 May 2019 14:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941B489875
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 09:47:31 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id D876F68B02; Fri, 17 May 2019 11:47:08 +0200 (CEST)
Date: Fri, 17 May 2019 11:47:08 +0200
From: Torsten Duwe <duwe@lst.de>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 4/4] arm64: DTS: allwinner: a64: enable ANX6345 bridge
 on Teres-I
Message-ID: <20190517094708.GA16858@lst.de>
References: <20190514160241.9EAC768C7B@newverein.lst.de>
 <CA+E=qVfuKBzWK7dpM_eabjU8mLdzOw3zCnYk6Tc1oXdavH7CNA@mail.gmail.com>
 <20190515093141.41016b11@blackhole.lan>
 <CA+E=qVf6K_0T0x2Hsfp6EDqM-ok6xiAzeZPvp6SRg0yt010pKA@mail.gmail.com>
 <20190516154820.GA10431@lst.de>
 <CA+E=qVe5NkAvHXPvVc7iTbZn5sKeoRm0166zPW_s83c2gk7B+g@mail.gmail.com>
 <20190516164859.GB10431@lst.de> <20190517072738.deohh5fly4jxms7k@flea>
 <20190517101353.3e86d696@blackhole.lan>
 <20190517090845.oujs33nplbaxcyun@flea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190517090845.oujs33nplbaxcyun@flea>
User-Agent: Mutt/1.5.17 (2007-11-01)
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

T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTE6MDg6NDVBTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiA+Cj4gPiBTbyBmb3IgYWxsIGN1cnJlbnQgcHJhY3RpY2FsIHB1cnBvc2VzLCB3ZSBj
YW4gYXNzdW1lIHRoZSBUZXJlcy1JIHBhbmVsCj4gPiB0byBiZSBwb3dlcmVkIHByb3Blcmx5IGFu
ZCBwcm92aWRpbmcgdmFsaWQgRURJRDsgbm90aGluZyB0byB3b3JyeSBhYm91dAo+ID4gaW4gc29m
dHdhcmUuCj4gCj4gWW91J3JlIGNyZWF0aW5nIGEgZ2VuZXJpYyBiaW5kaW5nIGZvciBhbGwgdGhl
IHVzZXJzIG9mIHRoYXQgYnJpZGdlLAo+IHdoaWxlIGNvbnNpZGVyaW5nIG9ubHkgdGhlIHNwZWNp
ZmljIGNhc2Ugb2YgdGhlIFRlcmVzLUkuCgpBbGwgSSdtIHNheWluZyBpcyB0aGF0IF90aGlzXyB1
c2FnZSBpcyBhbHNvIHZhbGlkLiBOb3RoaW5nIGtlZXBzIG90aGVyCnVzZXJzIGZyb20gZGVmaW5p
bmcgdGhlIG91dHB1dCBwYW5lbDsgb24gdGhlIGNvbnRyYXJ5OiB0aGUgZHJpdmVyIGF0IGhhbmQK
YWxyZWFkeSBjb25zaWRlcnMgYW4gX29wdGlvbmFsXyBwYW5lbCBhbmQgaGFuZGxlcyBpdCwgY29u
ZGl0aW9uYWxseS4gU28KZHJpdmVyIGFuZCBiaW5kaW5nIHNwZWMgYXJlIDEwMCUgaW4gc3luYyBo
ZXJlLgoKVGhpcyBpcyBtdWNoIG1vcmUgc3RyYWlnaHRmb3J3YXJkIHRoYW4gcmVxdWlyaW5nIGFu
IG91dHB1dCBhbmQgbWFraW5nIHVwCnNvbWUgZHVtbXkgY29kZSBhbmQgcGFyYW1zIGJlY2F1c2Ug
aXQgY2Fubm90IHJlYXNvbmFibHkgYmUgaGFuZGxlZC4KKFJlbWVtYmVyLCBpZiB0aGVyZSBpcyBh
biBvdXRwdXQsIHRoZSBkcml2ZXIgd2lsbCBtYWtlIGNhbGxzIHRvIHRoZQoiYXR0YWNoZWQgZGV2
aWNlIiBkcml2ZXIuKQoKCVRvcnN0ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
