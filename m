Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B0EDF7EB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 00:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AD06E291;
	Mon, 21 Oct 2019 22:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8228E6E1A8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 17:19:49 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 8EBC280CC;
 Mon, 21 Oct 2019 17:20:22 +0000 (UTC)
Date: Mon, 21 Oct 2019 10:19:44 -0700
From: Tony Lindgren <tony@atomide.com>
To: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH V5 3/3] ARM: logicpd-torpedo-37xx-devkit-28: Reference
 new DRM panel
Message-ID: <20191021171944.GA5610@atomide.com>
References: <20191016135147.7743-1-aford173@gmail.com>
 <20191016135147.7743-3-aford173@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016135147.7743-3-aford173@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Mon, 21 Oct 2019 22:21:16 +0000
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
 David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KiBBZGFtIEZvcmQgPGFmb3JkMTczQGdtYWlsLmNvbT4gWzE5MTAxNiAwNjo1M106Cj4gV2l0aCB0
aGUgcmVtb3ZhbCBvZiB0aGUgcGFuZWwtZHBpIGZyb20gdGhlIG9tYXAgZHJpdmVycywgdGhlCj4g
TENEIG5vIGxvbmdlciB3b3Jrcy4gIFRoaXMgcGF0Y2ggcG9pbnRzIHRoZSBkZXZpY2UgdHJlZSB0
bwo+IGEgbmV3bHkgY3JlYXRlZCBwYW5lbCBuYW1lZCAibG9naWNwZCx0eXBlMjgiCj4gCj4gRml4
ZXM6IDhiZjRiMTYyMTE3OCAoImRybS9vbWFwOiBSZW1vdmUgcGFuZWwtZHBpIGRyaXZlciIpCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQWRhbSBGb3JkIDxhZm9yZDE3M0BnbWFpbC5jb20+Cj4gQWNrZWQt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAtLS0KPiBWNTogIE5vIENoYW5n
ZQo+IFY0OiAgTm8gQ2hhbmdlCj4gVjM6ICBObyBjaGFuZ2UKPiBWMjogIFJlbW92ZSBsZWdhY3kg
J2xhYmVsJyBmcm9tIGJpbmRpbmcKCkknbSBwaWNraW5nIHRoaXMgcGF0Y2ggaW50byBvbWFwLWZv
ci12NS41L2R0IHRoYW5rcy4KClJlZ2FyZHMsCgpUb255Cgo+IGRpZmYgLS1naXQgYS9hcmNoL2Fy
bS9ib290L2R0cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZraXQtMjguZHRzIGIvYXJjaC9hcm0v
Ym9vdC9kdHMvbG9naWNwZC10b3JwZWRvLTM3eHgtZGV2a2l0LTI4LmR0cwo+IGluZGV4IDA3YWM5
OWI5Y2RhNi4uY2RiODliM2UyYTliIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL2xv
Z2ljcGQtdG9ycGVkby0zN3h4LWRldmtpdC0yOC5kdHMKPiArKysgYi9hcmNoL2FybS9ib290L2R0
cy9sb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZraXQtMjguZHRzCj4gQEAgLTExLDIyICsxMSw2IEBA
Cj4gICNpbmNsdWRlICJsb2dpY3BkLXRvcnBlZG8tMzd4eC1kZXZraXQuZHRzIgo+ICAKPiAgJmxj
ZDAgewo+IC0KPiAtCWxhYmVsID0gIjI4IjsKPiAtCj4gLQlwYW5lbC10aW1pbmcgewo+IC0JCWNs
b2NrLWZyZXF1ZW5jeSA9IDw5MDAwMDAwPjsKPiAtCQloYWN0aXZlID0gPDQ4MD47Cj4gLQkJdmFj
dGl2ZSA9IDwyNzI+Owo+IC0JCWhmcm9udC1wb3JjaCA9IDwzPjsKPiAtCQloYmFjay1wb3JjaCA9
IDwyPjsKPiAtCQloc3luYy1sZW4gPSA8NDI+Owo+IC0JCXZiYWNrLXBvcmNoID0gPDM+Owo+IC0J
CXZmcm9udC1wb3JjaCA9IDwyPjsKPiAtCQl2c3luYy1sZW4gPSA8MTE+Owo+IC0JCWhzeW5jLWFj
dGl2ZSA9IDwxPjsKPiAtCQl2c3luYy1hY3RpdmUgPSA8MT47Cj4gLQkJZGUtYWN0aXZlID0gPDE+
Owo+IC0JCXBpeGVsY2xrLWFjdGl2ZSA9IDwwPjsKPiAtCX07Cj4gKwkvKiBUbyBtYWtlIGl0IHdv
cmssIHNldCBDT05GSUdfT01BUDJfRFNTX01JTl9GQ0tfUEVSX1BDSz00ICovCj4gKwljb21wYXRp
YmxlID0gImxvZ2ljcGQsdHlwZTI4IjsKPiAgfTsKPiAtLSAKPiAyLjE3LjEKPiAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
