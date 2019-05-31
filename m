Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9873130912
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 08:58:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850C689295;
	Fri, 31 May 2019 06:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653D589294
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 06:58:17 +0000 (UTC)
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 1EA1060004;
 Fri, 31 May 2019 06:58:07 +0000 (UTC)
Date: Fri, 31 May 2019 08:58:06 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v9 0/9] drm/sun4i: Allwinner A64 MIPI-DSI support
Message-ID: <20190531065806.fl4y2kex427qtysz@flea>
References: <20190529105615.14027-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529105615.14027-1-jagan@amarulasolutions.com>
User-Agent: NeoMutt/20180716
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
Cc: devicetree@vger.kernel.org, Ryan Pannell <ryan@osukl.com>,
 bshah@mykolab.com, David Airlie <airlied@linux.ie>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Sergey Suloev <ssuloev@orpaltech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBXZWQsIE1heSAyOSwgMjAxOSBhdCAwNDoyNjowNlBNICswNTMwLCBKYWdhbiBUZWtp
IHdyb3RlOgo+IFRoaXMgaXMgdjkgdmVyc2lvbiBmb3IgQWxsd2lubmVyIEE2NCBNSVBJLURTSSBz
dXBwb3J0Cj4gYW5kIGhlcmUgaXMgdGhlIHByZXZpb3VzIHZlcnNpb24gc2V0WzFdLgo+Cj4gVGhp
cyBkZXBlbmRzIG9uIGRzaSBob3N0IGNvbnRyb2xsZXIgZml4ZXMgd2hpY2ggd2VyZQo+IHN1cHBv
cnRlZCBpbiB0aGlzIHNlcmllc1syXS4KPgo+IEFsbCB0aGVzZSBjaGFuZ2VzIGFyZSB0ZXN0ZWQg
aW4gQWxsd2lubmVyIEE2NCB3aXRoCj4gMiwgNCBsYW5lcyBkZXZpY2VzIGFuZCB3aG9zZSBwaXhl
bCBjbG9ja3MgYXJlIDI3LjUgTUh6LAo+IDMwTUh6LCA1NU1IeiBhbmQgMTQ3TUh6LgoKSSB3YW50
ZWQgdG8gYXBwbHkgdGhpcywgYnV0IGl0IHdvdWxkbid0IGFwcGx5LCBjYW4geW91IHNlbmQgaXQg
d2l0aG91dApkZXBlbmRlbmNpZXM/CgpUaGFua3MhCk1heGltZQoKLS0KTWF4aW1lIFJpcGFyZCwg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9v
dGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
