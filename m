Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 143C166164
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 23:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4756E265;
	Thu, 11 Jul 2019 21:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7C7C6E265
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 21:53:00 +0000 (UTC)
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hlgzr-0006th-0q; Thu, 11 Jul 2019 23:52:59 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 6/7] ARM: dts: rockchip: Specify
 rk3288-veyron-chromebook's display timings
Date: Thu, 11 Jul 2019 23:52:58 +0200
Message-ID: <3703486.dL69t9P4Cl@diego>
In-Reply-To: <4744731.Gbjux09qzx@diego>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-7-dianders@chromium.org> <4744731.Gbjux09qzx@diego>
MIME-Version: 1.0
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
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric =?ISO-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, mka@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRG9ubmVyc3RhZywgMTEuIEp1bGkgMjAxOSwgMjM6Mjc6NDQgQ0VTVCBzY2hyaWViIEhlaWtv
IFN0w7xibmVyOgo+IEFtIE1vbnRhZywgMS4gQXByaWwgMjAxOSwgMTk6MTc6MjMgQ0VTVCBzY2hy
aWViIERvdWdsYXMgQW5kZXJzb246Cj4gPiBMZXQncyBkb2N1bWVudCB0aGUgZGlzcGxheSB0aW1p
bmdzIHRoYXQgbW9zdCB2ZXlyb24gY2hyb21lYm9va3MgKGxpa2UKPiA+IGphcSwgamVycnksIG1p
Z2h0eSwgc3BlZWR5KSBoYXZlIGJlZW4gdXNpbmcgb3V0IGluIHRoZSBmaWVsZC4gIFRoaXMKPiA+
IHVzZXMgdGhlIHN0YW5kYXJkIGJsYW5raW5ncyBidXQgYSBzbGlnaHRseSBzbG93ZXIgY2xvY2sg
cmF0ZSwgdGh1cwo+ID4gZ2V0dGluZyBhIHJlZnJlc2ggcmF0ZSA1OC4zIEh6Lgo+ID4gCj4gPiBO
T1RFOiB0aGlzIHdvbid0IHJlYWxseSBkbyBhbnl0aGluZyBleGNlcHQgY2F1c2UgRFJNIHRvIHBy
b3Blcmx5Cj4gPiByZXBvcnQgdGhlIHJlZnJlc2ggcmF0ZSBzaW5jZSB2b3BfY3J0Y19tb2RlX2Zp
eHVwKCkgd2FzIHJvdW5kaW5nIHRoZQo+ID4gcGl4ZWwgY2xvY2sgdG8gNzQuMjUgTUh6IGFueXdh
eS4gIEFwcGFyZW50bHkgdGhlIGFkanVzdGVkIHJhdGUgaXNuJ3QKPiA+IGV4cG9zZWQgdG8gdXNl
cnNwYWNlIHNvIGl0J3MgaW1wb3J0YW50IHRoYXQgdGhlIHJhdGUgd2UncmUgdHJ5aW5nIHRvCj4g
PiBhY2hpZXZlIGlzIG1vc3RseSByaWdodC4KPiA+IAo+ID4gRm9yIHRoZSBkb3duc3RyZWFtIGtl
cm5lbCBjaGFuZ2UgcmVsYXRlZCB0byB0aGlzIHNlZSBTZWUKPiA+IGh0dHBzOi8vY3JyZXYuY29t
L2MvMzI0NTU4Lgo+ID4gCj4gPiBOT1RFOiBtaW5uaWUgdXNlcyBhIGRpZmZlcmVudCBwYW5lbCB3
aWxsIGJlIGZpeGVkIHVwIGluIGEgZnV0dXJlCj4gPiBwYXRjaCwgc28gZm9yIG5vdyB3ZSdsbCBq
dXN0IGRlbGV0ZSB0aGUgcGFuZWwgdGltaW5ncyB0aGVyZS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgo+IAo+IGFwcGxpZWQg
Zm9yIDUuMwoKNS40IG9idmlvdXNseQpbanVzdCB0byBub3QgY29uZnVzZSBwZW9wbGUgcmVhZGlu
ZyB0aGF0IGxhdGVyXQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
