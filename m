Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCDF1E8D8
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A6589330;
	Wed, 15 May 2019 07:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Tue, 14 May 2019 16:06:15 UTC
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967778926F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 16:06:15 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 6C0AC68B05; Tue, 14 May 2019 17:59:11 +0200 (CEST)
From: Torsten Duwe <duwe@lst.de>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Archit Taneja <architt@codeaurora.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>
Subject: [PATCH 0/4] Add missing device nodes for Olimex Teres-I
Message-Id: <20190514155911.6C0AC68B05@newverein.lst.de>
Date: Tue, 14 May 2019 17:59:11 +0200 (CEST)
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
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
Cc: devicetree@vger.kernel.org, info@olimex.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKYmFzZWQgb24gTWF4aW1lJ3Mgc3VueGktZHQ2NC1mb3ItNS4yLCBoZXJlIGlzIHdo
YXQgSSBmb3VuZCBzbyBmYXIKc3RpbGwgbWlzc2luZyBpbiB0aGUgZGV2aWNlIHRyZWUuIFRob3Nl
IGJpdHMgYW5kIHBpZWNlcyBoYXZlIGFscmVhZHkKYmVlbiBzdWJtaXR0ZWQgYnV0IHdlcmUgbm90
IHlldCBhcHBsaWVkLiBDdXJyZW50bHkgSSBhbHNvIGhhdmUgdGhlCnVhcnQxIGZvciBibHVldG9v
dGggaGVyZSwgYnV0IEknbSB1bnN1cmUgYWJvdXQgdGhlIGJpbmRpbmdzIGZvciB0aGUKaW4ta2Vy
bmVsIGJ0dWFydC4KCgkgIFRvcnN0ZW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
