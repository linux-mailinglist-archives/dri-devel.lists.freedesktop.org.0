Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1249B3E4
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 18:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCA0891CA;
	Sat, 27 Apr 2019 16:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB5B891CA
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 16:22:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C86AF80407;
 Sat, 27 Apr 2019 18:22:49 +0200 (CEST)
Date: Sat, 27 Apr 2019 18:22:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: David Herrmann <dh.herrmann@gmail.com>
Subject: Re: [PATCH v1 1/1] drm: drop drm_bus from todo
Message-ID: <20190427162248.GA24192@ravnborg.org>
References: <20190126192732.15263-1-sam@ravnborg.org>
 <CANq1E4QLxse-2q1F1Q8t-TOUHWzwuY-G9Je9=MUb-cCr7esjpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANq1E4QLxse-2q1F1Q8t-TOUHWzwuY-G9Je9=MUb-cCr7esjpQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=MJih5OjK-Nfu661UujUA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=d3PnA9EDa4IxuAV0gXij:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBKYW4gMjcsIDIwMTkgYXQgMTI6MDA6MzdQTSArMDEwMCwgRGF2aWQgSGVycm1hbm4g
d3JvdGU6Cj4gSGV5Cj4gCj4gT24gU2F0LCBKYW4gMjYsIDIwMTkgYXQgODoyNyBQTSBTYW0gUmF2
bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+IHdyb3RlOgo+ID4gRGF2aWQgSGVycm1hbm4gcmVtb3Zl
ZCB0aGUgbGFzdCBiaXRzIG9mIGRybV9idXMgaW46Cj4gPiBjNTc4NmZlNWYxYzUwOTQxZGJlMjdm
YzhiNGFhMWFmZWU0NmFlODkzICgiZHJtOiBHb29keSBieWUsIGRybV9idXMhIikKPiA+Cj4gPiBS
ZW1vdmUgdGhlIHRvZG8gaXRlbS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+Cj4gPiBDYzogRGF2aWQgSGVycm1hbm4gPGRoLmhlcnJtYW5uQGdt
YWlsLmNvbT4KPiA+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gPiBDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+ID4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0
IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gPiBDYzogTWF4aW1lIFJpcGFy
ZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KPiA+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9v
cmx5LnJ1bj4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgMTkgLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBkZWxldGlvbnMoLSkKPiAK
PiBJIG1pc3MgZHJtX2J1cyEKPiAKPiBSZXZpZXdlZC1ieTogRGF2aWQgSGVycm1hbm4gPGRoLmhl
cnJtYW5uQGdtYWlsLmNvbT4KCkFwcGxpZWQgYW5kIHB1c2hlZCB0byBkcm0tbWlzYy1uZXh0CgoJ
U2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
