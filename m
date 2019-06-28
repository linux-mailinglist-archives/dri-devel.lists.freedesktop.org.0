Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6175A205
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 19:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F6986E981;
	Fri, 28 Jun 2019 17:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765666E981
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 17:13:48 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 707238061A;
 Fri, 28 Jun 2019 19:13:43 +0200 (CEST)
Date: Fri, 28 Jun 2019 19:13:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 0/7] drm/panel: simple: Add mode support to devicetree
Message-ID: <20190628171342.GA2238@ravnborg.org>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190626130007.GE23428@ravnborg.org>
 <CAD=FV=U4UU8q+CS76uuuGUP=EVnE6+BTUf8U=j7uwfczNgkrZw@mail.gmail.com>
 <CAD=FV=Vi2C7s2oWBDD0n+HK=_SuBYhRM9saMK-y6Qa0+k-g17w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Vi2C7s2oWBDD0n+HK=_SuBYhRM9saMK-y6Qa0+k-g17w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=_iCLzPF4R0rCw2ftHNcA:9 a=CjuIK1q_8ugA:10
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
 Brian Norris <briannorris@chromium.org>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Enric =?iso-8859-1?Q?Balletb=F2?= <enric.balletbo@collabora.com>,
 Klaus Goger <klaus.goger@theobroma-systems.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, Matthias Kaehlcke <mka@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRG91Zy4KCj4gU2FtOiBPaCEgIEkgaGFkbid0IG5vdGljZWQgdGhhdCB5b3UndmUgYmVlbiBh
ZGRlZCBhcyBhIHBhbmVsCj4gbWFpbnRhaW5lciBpbiBjb21taXQgZWYwZGI5NGY5NGEwICgiTUFJ
TlRBSU5FUlM6IEFkZCBTYW0gYXMgcmV2aWV3ZXIKPiBmb3IgZHJtL3BhbmVsIikuICBEb2VzIHRo
YXQgbWVhbiB5b3UgYXJlIGFibGUgdG8gcHJvdmlkZSBzb21lIGFkdmljZQo+IGZvciBob3cgdG8g
bGFuZCB0aGlzIHNlcmllcz8KUmV2aWV3ZXIgb25seSwgbm90IG1haW50YWluZXIuLi4uCgpJdCBp
cyBvbiBteSBUT0RPIGxpc3QgZm9yIHRoZSB3ZWVrZW5kIHRvIGdvIHRocm91Z2ggdGhlIHBhdGNo
IHNldCBpbgpkZXRhaWxzIGFuZCBwcm92aWRlIGZlZWRiYWNrLiBJIGhhdmUgcmVhZCB0aGVtIGJl
Zm9yZSwgYnV0IEkgbWlzcyB0byBkbwphIG1vcmUgZGV0YWlsZWQgcmVhZCB0aHJvdWdoLgoKQnV0
IEkgY2Fubm90IGFwcGx5IHRoaXMgdW5sZXNzIFRoaWVycnkgb3Igb25lIG9mIHRoZSBEUk0gbWFp
bnRhaW5lcnMKYWNrIGl0LgpXZSBzaW1wbHkgbmVlZCBzb21lb25lIHdpdGggYSBiZXR0ZXIgZ2Vu
ZXJhbCBrbm93bGVkZ2Ugb2YgRFJNIHRvIGFjayBpdAp0aGFuIEkgaGF2ZS4KCglTYW0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
