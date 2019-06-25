Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4341755953
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 22:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5767989F6D;
	Tue, 25 Jun 2019 20:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A72CF89F6D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 20:47:13 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1B3B020030;
 Tue, 25 Jun 2019 22:47:11 +0200 (CEST)
Date: Tue, 25 Jun 2019 22:47:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/doc: Document kapi doc expectations
Message-ID: <20190625204709.GA19279@ravnborg.org>
References: <20190625203644.4423-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625203644.4423-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=P1BnusSwAAAA:8 a=P-IC7800AAAA:8 a=7gkXJVJtAAAA:8 a=Ci_nQoNnDGtBwG8qRK4A:9
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTA6MzY6NDRQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBXZSd2ZSBoYWQgdGhpcyBhbHJlYWR5IGZvciBhbnl0aGluZyBuZXcuIFdpdGggbXkg
ZHJtX3ByaW1lLmMgY2xlYW51cCBJCj4gYWxzbyB0aGluayBkb2N1bWVudGF0aW9ucyBmb3IgZXZl
cnl0aGluZyBhbHJlYWR5IGV4aXN0aW5nIGlzIGNvbXBsZXRlLApzL2RvY3VtZW50YXRpb25zL2Rv
Y3VtZW50YXRpb24/Cgo+IGFuZCB3ZSBjYW4gYmFrZSB0aGlzIGluIGFzIGEgcmVxdWlyZW1lbnRz
IHN1YnN5c3RlbSB3aWRlLgo+IAo+IEFja2VkLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFA
aW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
aW50ZWwuY29tPgo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Cj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5j
b20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPgo+IENjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KPiAtLS0K
Rm9yIHdoYXQgaXQgaXMgd29ydGguLi4KQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5i
b3JnLm9yZz4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
