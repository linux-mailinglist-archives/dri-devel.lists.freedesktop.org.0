Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B28BB94B3E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 19:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFEFD6E23B;
	Mon, 19 Aug 2019 17:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36376E23B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 17:06:59 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 40225803D0;
 Mon, 19 Aug 2019 19:06:57 +0200 (CEST)
Date: Mon, 19 Aug 2019 19:06:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] drm/drv: Use // for comments in example code
Message-ID: <20190819170655.GA27109@ravnborg.org>
References: <20190808163629.14280-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190808163629.14280-1-j.neuschaefer@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=VVlED5B4AAAA:8
 a=FVAixOh6KRUHZqgu9kwA:9 a=wPNLvfGTeEIA:10 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSm9uYXRoYW4uCgpUaGFua3MgZm9yIG1ha2luZyB0aGlzIG1vcmUgcmVhZGFibGUgaW4gdGhl
IGh0bWwgb3V0cHV0LgoKT24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDY6MzY6MjhQTSArMDIwMCwg
Sm9uYXRoYW4gTmV1c2Now6RmZXIgd3JvdGU6Cj4gVGhpcyBpbXByb3ZlcyBTcGhpbnggb3V0cHV0
IGluIHR3byB3YXlzOgo+IAo+IC0gSXQgYXZvaWRzIGFuIHVubWF0Y2hlZCBzaW5nbGUtcXVvdGUg
KCcpLCBhYm91dCB3aGljaCBTcGhpbnggY29tcGxhaW5lZDoKPiAKPiAgIC8uLi4vRG9jdW1lbnRh
dGlvbi9ncHUvZHJtLWludGVybmFscy5yc3Q6Mjk4Ogo+ICAgICBXQVJOSU5HOiBDb3VsZCBub3Qg
bGV4IGxpdGVyYWxfYmxvY2sgYXMgImMiLiBIaWdobGlnaHRpbmcgc2tpcHBlZC4KPiAKPiAgIEFu
IGFsdGVybmF0aXZlIGFwcHJvYWNoIHdvdWxkIGJlIHRvIHJlcGxhY2UgImNhbid0IiB3aXRoIGEg
d29yZCB0aGF0Cj4gICBkb2Vzbid0IGhhdmUgYSBzaW5nbGUtcXVvdGUuCj4gCj4gLSBJdCBsZXRz
IFNwaGlueCBmb3JtYXQgdGhlIGNvbW1lbnRzIGluIGl0YWxpY3MgYW5kIGdyZXksIG1ha2luZyB0
aGUKPiAgIGNvZGUgc2xpZ2h0bHkgZWFzaWVyIHRvIHJlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Sm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCkkgZ290IEFja2Vk
LWJ5IGZyb20gRGFuaWVsIFZldHRlciBhbmQgaGFzIG5vdyBhcHBsaWVkIHRoaXMgcGF0Y2gKdG8g
ZHJtLW1pc2MtbmV4dC4KSXQgd2lsbCBzaG93IHVwIGluIGxpbnV4LW5leHQgYWZ0ZXIgdGhlIG1l
cmdlIHdpbmRvdy4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
