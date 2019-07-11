Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2484C6611D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 23:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1136D6E28A;
	Thu, 11 Jul 2019 21:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBE86E28A
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 21:28:16 +0000 (UTC)
Received: from ip5f5a6320.dynamic.kabel-deutschland.de ([95.90.99.32]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1hlgbu-0006n4-SN; Thu, 11 Jul 2019 23:28:14 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 7/7] ARM: dts: rockchip: Specify rk3288-veyron-minnie's
 display timings
Date: Thu, 11 Jul 2019 23:28:14 +0200
Message-ID: <10427933.3dknIRnSiX@diego>
In-Reply-To: <20190401171724.215780-8-dianders@chromium.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-8-dianders@chromium.org>
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

QW0gTW9udGFnLCAxLiBBcHJpbCAyMDE5LCAxOToxNzoyNCBDRVNUIHNjaHJpZWIgRG91Z2xhcyBB
bmRlcnNvbjoKPiBKdXN0IGxpa2Ugd2UgZGlkIGZvciByazMyODgtdmV5cm9uLWNocm9tZWJvb2ss
IHdlIHdhbnQgdG8gYmUgYWJsZSB0bwo+IHVzZSBvbmUgb2YgdGhlIGZpeGVkIFBMTHMgaW4gdGhl
IHN5c3RlbSB0byBtYWtlIHRoZSBwaXhlbCBjbG9jayBmb3IKPiBtaW5uaWUuCj4gCj4gU3BlY2lm
eWluZyB0aGVzZSB0aW1pbmdzIG1hdGNoZXMgdXMgd2l0aCBob3cgdGhlIGRpc3BsYXkgaXMgdXNl
ZCBvbgo+IHRoZSBkb3duc3RyZWFtIENocm9tZSBPUyBrZXJuZWwuICBTZWUgaHR0cHM6Ly9jcnJl
di5jb20vYy8zMjMyMTEuCj4gCj4gVW5saWtlIHdoYXQgd2UgZGlkIGZvciByazMyODgtdmV5cm9u
LWNocm9tZWJvb2ssIHRoaXMgQ0wgYWN0dWFsbHkKPiBjaGFuZ2VzIHRoZSB0aW1pbmdzICh0aG91
Z2ggbm90IHRoZSBwaXhlbCBjbG9jaykgdGhhdCBpcyB1c2VkIHdoZW4KPiB1c2luZyB0aGUgdXBz
dHJlYW0ga2VybmVsLiAgQm9vdGluZyB1cCBhIG1pbm5pZSBzaG93cyB0aGF0IGl0IGVuZGVkIHVw
Cj4gd2l0aCBhIDY2LjY3IE1IeiBwaXhlbCBjbG9jayBidXQgaXQgd2FzIHN0aWxsIHVzaW5nIHRo
ZQo+IHBvcmNoZXMvYmxhbmtpbmdzIGl0IHdvdWxkIGhhdmUgd2FudGVkIGZvciBhIDcyLjUgTUh6
IHBpeGVsIGNsb2NrLgo+IAo+IE5PVEU6IGNvbXBhcmVkIHRvIHRoZSBkb3duc3RyZWFtIGtlcm5l
bCwgdGhpcyBzZWVtcyB0byBjYXVzZSBhCj4gc2xpZ2h0bHkgZGlmZmVyZW50IHJlc3VsdCByZXBv
cnRlZCBpbiB0aGUgJ21vZGV0ZXN0JyBjb21tYW5kIG9uIGEKPiBDaHJvbWVib29rLiAgVGhlIGRv
d25zdHJlYW0ga2VybmVsIHNob3dzOgo+ICAgMTI4MHg4MDAgNjAgMTI4MCAxMjk4IDEzMzAgMTM1
MSA4MDAgODA0IDgyMiA4MzAgNjY2NjcKPiAKPiBXaXRoIHRoaXMgcGF0Y2ggd2UgaGF2ZToKPiAg
IDEyODB4ODAwIDU5IDEyODAgMTI5OCAxMzMwIDEzNTEgODAwIDgwNCA4MjIgODMwIDY2NjY2Cj4g
Cj4gU3BlY2lmaWNhbGx5IG1vZGV0ZXN0IHdhcyByZXBvcnRpbmcgNjAgSHogb24gdGhlIGRvd25z
dHJlYW0ga2VybmVsIGJ1dAo+IHRoZSB1cHN0cmVhbSBrZXJuZWwgZG9lcyB0aGUgbWF0aCBhbmQg
Y29tZXN1cCB3aXRoIDU5IChiZWNhdXNlIHdlCj4gYWN0dWFsbHkgYWNoaWV2ZSA1OS40NSBIeiku
ICBBbHNvIHVwc3RyZWFtIGRvZXNuJ3Qgcm91bmQgdGhlIEh6IHVwCj4gd2hlbiBjb252ZXJ0aW5n
IHRvIGtIei0taXQgc2VlbXMgdG8gdHJ1bmNhdGUuCj4gCj4gQUxTTyBOT1RFOiB3aGVuIEkgbG9v
ayBhdCB0aGUgRURJRCBmcm9tIHRoZSBkYXRhc2hlZXQsIEkgc2VlOgo+ICAgLWhzeW5jIC12c3lu
Ywo+IC4uLmJ1dCBpdCBzZWVtcyBsaWtlIHdlJ3ZlIG5ldmVyIGFjdHVhbGx5IHJ1biB3aXRoIHRo
YXQgc28gSSd2ZQo+IGNvbnRpbnVlZCBsZWF2aW5nIHRoYXQgb3V0Lgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IERvdWdsYXMgQW5kZXJzb24gPGRpYW5kZXJzQGNocm9taXVtLm9yZz4KCmFwcGxpZWQgZm9y
IDUuNAoKVGhhbmtzCkhlaWtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
