Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26C7214F9
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 09:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02D868984F;
	Fri, 17 May 2019 07:55:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C05689762
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2019 16:06:22 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2005)
 id 239E668B05; Thu, 16 May 2019 17:49:43 +0200 (CEST)
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
Subject: [PATCH v2 0/4] Add missing device nodes for Olimex Teres-I
Message-Id: <20190516154943.239E668B05@newverein.lst.de>
Date: Thu, 16 May 2019 17:49:43 +0200 (CEST)
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
IHlldCBhcHBsaWVkLgoKQ2hhbmdlcyBzaW5jZSB2MToKCiogbGNkLXJnYjY2Ni1waW5zCiAgICAg
ICAgICAgIC0tLS0tCiogZHZkZDEyLXN1cHBseSwgZHZkZDI1LXN1cHBseSBub3cgYXJlIHJlcXVp
cmVkIGJ5IHRoZSBhbng2MzQ1IGJpbmRpbmdzCgoqIHVwZGF0ZWQgSGFyYWxkJ3MgY29tbWl0IG1l
c3NhZ2UsIHJlbW92aW5nIHRoZSByZWYgdG8gdGhlIG5vdy1kZWxldGVkCiAgZGVidWcgcGluIGFu
ZCBhZGRlZCBhICJDVElBIiAoYW5kcm9pZCkgcGlub3V0IG1lbnRpb24uCgoqIHJlbW92ZWQgdGhl
IHJlZnMgdG8gdGhlIG9sZCBwYXRjaHdvcmsKCgoJICBUb3JzdGVuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
