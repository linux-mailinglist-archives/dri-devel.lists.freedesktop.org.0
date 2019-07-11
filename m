Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2200066119
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 23:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DBF6E26F;
	Thu, 11 Jul 2019 21:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CDB6E26F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 21:27:49 +0000 (UTC)
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hlgbR-0006mP-RG; Thu, 11 Jul 2019 23:27:45 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 6/7] ARM: dts: rockchip: Specify
 rk3288-veyron-chromebook's display timings
Date: Thu, 11 Jul 2019 23:27:44 +0200
Message-ID: <4744731.Gbjux09qzx@diego>
In-Reply-To: <20190401171724.215780-7-dianders@chromium.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-7-dianders@chromium.org>
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

QW0gTW9udGFnLCAxLiBBcHJpbCAyMDE5LCAxOToxNzoyMyBDRVNUIHNjaHJpZWIgRG91Z2xhcyBB
bmRlcnNvbjoKPiBMZXQncyBkb2N1bWVudCB0aGUgZGlzcGxheSB0aW1pbmdzIHRoYXQgbW9zdCB2
ZXlyb24gY2hyb21lYm9va3MgKGxpa2UKPiBqYXEsIGplcnJ5LCBtaWdodHksIHNwZWVkeSkgaGF2
ZSBiZWVuIHVzaW5nIG91dCBpbiB0aGUgZmllbGQuICBUaGlzCj4gdXNlcyB0aGUgc3RhbmRhcmQg
YmxhbmtpbmdzIGJ1dCBhIHNsaWdodGx5IHNsb3dlciBjbG9jayByYXRlLCB0aHVzCj4gZ2V0dGlu
ZyBhIHJlZnJlc2ggcmF0ZSA1OC4zIEh6Lgo+IAo+IE5PVEU6IHRoaXMgd29uJ3QgcmVhbGx5IGRv
IGFueXRoaW5nIGV4Y2VwdCBjYXVzZSBEUk0gdG8gcHJvcGVybHkKPiByZXBvcnQgdGhlIHJlZnJl
c2ggcmF0ZSBzaW5jZSB2b3BfY3J0Y19tb2RlX2ZpeHVwKCkgd2FzIHJvdW5kaW5nIHRoZQo+IHBp
eGVsIGNsb2NrIHRvIDc0LjI1IE1IeiBhbnl3YXkuICBBcHBhcmVudGx5IHRoZSBhZGp1c3RlZCBy
YXRlIGlzbid0Cj4gZXhwb3NlZCB0byB1c2Vyc3BhY2Ugc28gaXQncyBpbXBvcnRhbnQgdGhhdCB0
aGUgcmF0ZSB3ZSdyZSB0cnlpbmcgdG8KPiBhY2hpZXZlIGlzIG1vc3RseSByaWdodC4KPiAKPiBG
b3IgdGhlIGRvd25zdHJlYW0ga2VybmVsIGNoYW5nZSByZWxhdGVkIHRvIHRoaXMgc2VlIFNlZQo+
IGh0dHBzOi8vY3JyZXYuY29tL2MvMzI0NTU4Lgo+IAo+IE5PVEU6IG1pbm5pZSB1c2VzIGEgZGlm
ZmVyZW50IHBhbmVsIHdpbGwgYmUgZml4ZWQgdXAgaW4gYSBmdXR1cmUKPiBwYXRjaCwgc28gZm9y
IG5vdyB3ZSdsbCBqdXN0IGRlbGV0ZSB0aGUgcGFuZWwgdGltaW5ncyB0aGVyZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBEb3VnbGFzIEFuZGVyc29uIDxkaWFuZGVyc0BjaHJvbWl1bS5vcmc+CgphcHBs
aWVkIGZvciA1LjMKClRoYW5rcwpIZWlrbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
