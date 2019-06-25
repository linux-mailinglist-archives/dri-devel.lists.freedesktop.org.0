Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C498B52257
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 06:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B2C089ED3;
	Tue, 25 Jun 2019 04:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FC789ED3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 04:59:40 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 20427803EB;
 Tue, 25 Jun 2019 06:59:37 +0200 (CEST)
Date: Tue, 25 Jun 2019 06:59:35 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v4 2/2] drm/exynos: trigger build of all modules
Message-ID: <20190625045935.GA23161@ravnborg.org>
References: <20190622115623.16314-1-sam@ravnborg.org>
 <20190622115623.16314-3-sam@ravnborg.org>
 <CAAQKjZPqunjVctjFJdwJMEmz7DHT8mDgMQ-_a3sw6BGO9K2q2w@mail.gmail.com>
 <CGME20190624152954epcas3p33b627481994f3ce1e57f8664b6f51b30@epcas3p3.samsung.com>
 <20190624152944.GA20945@ravnborg.org>
 <c11d3bf6-0e01-80bb-7d06-9df566389f01@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c11d3bf6-0e01-80bb-7d06-9df566389f01@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8
 a=oxNBwzQzgChPgqqTxbgA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: David Airlie <airlied@linux.ie>, Jingoo Han <jingoohan1@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSW5raS4KCj4gPiBBbHBoYSBvZnRlbiBuZWVkcyBvbmUgdG8gcHVsbCBpbiB2bWFsbG9jLmgg
LSB3aGVyZSBhbGwgb3RoZXIKPiA+IGFyY2hpdGVjdHVyZXMgZ2V0IGl0IGluZGlyZWN0IHZpYSBv
dGhlciBoZWFkZXJzLgo+ID4gSSBoYXZlIG5ldmVyIGJvdGhlcmVkIHRvIGZpbmQgb3V0IHdoeSBh
bHBhIG5lZWRzIG1vcmUgaGVhZGVycyBmaWxlcywKPiA+IGJ1dCBJIGFsd2F5cyBtYWtlIHN1cmUg
dG8gdGVzdCB0aGluZ3MgdXNpbmcgYWxwaGEgc28gMC1kYXkgZG8gbm90IHllbGwgYXQgbWUuCj4g
Cj4gSSBjb3VsZG4ndCBzZWUgYW55IHdhcm5pbmcgbWVzc2FnZSB3aGlsZSBidWlsZGluZyB5b3Vy
IHBhdGNoIGFmdGVyIGRyb3BwaW5nIGFib3ZlIGNoYW5nZS4KPiBDb3VsZCB5b3UgY2hlY2sgaXQg
YWdhaW4gb24gdG9wIG9mIGJlbG93IGdpdCByZXBvLj8KPiAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2RhZWlua2kvZHJtLWV4eW5vcy5naXQgZXh5bm9zLWRy
bS1uZXh0Cj4gCj4gSSdtIGdvaW5nIHRvIHJlcXVlc3QgR0lULVBVTEwgYXMgc29vbiBhcyB5b3Ug
Z2V0IGJhY2sgdG8gbWUuCgpXaXRoIHRoZSBDT01QSUxFX1RFU1QgcGF0Y2gsIGJ1dCB3aXRob3V0
IHRoZSBleHRyYSBmaXggSSBnZXQ6CgogIENDIFtNXSAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9l
eHlub3NfZHJtX2ZiZGV2Lm8KL2hvbWUvc2FtL2tlcm5lbC9kcm0tZXh5bm9zL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jOiBJbiBmdW5jdGlvbiDigJhleHlub3NfZHJt
X2ZiZGV2X3VwZGF0ZeKAmToKL2hvbWUvc2FtL2tlcm5lbC9kcm0tZXh5bm9zL2RyaXZlcnMvZ3B1
L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jOjk0OjQwOiBlcnJvcjogaW1wbGljaXQgZGVj
bGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYdm1hcOKAmTsgZGlkIHlvdSBtZWFuIOKAmGJtYXDigJk/
IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogIGV4eW5vc19nZW0tPmt2
YWRkciA9ICh2b2lkIF9faW9tZW0gKikgdm1hcChleHlub3NfZ2VtLT5wYWdlcywgbnJfcGFnZXMs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+CiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibWFwCi9ob21lL3NhbS9rZXJuZWwvZHJtLWV4
eW5vcy9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYzo5NTo1OiBlcnJv
cjog4oCYVk1fTUFQ4oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsg
ZGlkIHlvdSBtZWFuIOKAmFZNX01QWOKAmT8KICAgICBWTV9NQVAsIHBncHJvdF93cml0ZWNvbWJp
bmUoUEFHRV9LRVJORUwpKTsKICAgICBefn5+fn4KICAgICBWTV9NUFgKL2hvbWUvc2FtL2tlcm5l
bC9kcm0tZXh5bm9zL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jOjk1
OjU6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25j
ZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCi9ob21lL3NhbS9rZXJuZWwvZHJtLWV4
eW5vcy9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZmJkZXYuYzogSW4gZnVuY3Rp
b24g4oCYZXh5bm9zX2RybV9mYmRldl9kZXN0cm954oCZOgovaG9tZS9zYW0va2VybmVsL2RybS1l
eHlub3MvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmM6MjQzOjI6IGVy
cm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJh2dW5tYXDigJk7IGRpZCB5
b3UgbWVhbiDigJhpb3VubWFw4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJh
dGlvbl0KICB2dW5tYXAoZXh5bm9zX2dlbS0+a3ZhZGRyKTsKICBefn5+fn4KICBpb3VubWFwCmNj
MTogc29tZSB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwoKClRoaXMgaXMgd2l0aCBh
IGZyZXNobHkgcHVsbGVkIHRyZWUgZnJvbSBkcm0tZXh5bm9zLmdpdCBleHlub3MtZHJtLW5leHQK
ClRoZSB3YXJuaW5nIG9ubHkgYXBwZWFyIGlmIHlvdSBidWlsZCBmb3IgYWxwaGEuClNvIHRoZSBl
eHRyYSBmaXggaXMgaW5kZWVkIG5lZWRlZC4gQnV0IGFsd2F5cyBnb29kIHRvIGRvdWJsZSBjaGVj
ayAtCnRoYW5rcyBmb3IgYXNraW5nLgoKTm90ZToKTXkgZ2NjIHZlcnNpb24gZm9yIGFscGhhOgok
IGFscGhhLWxpbnV4LWdudS1nY2MgLS12ZXJzaW9uCmFscGhhLWxpbnV4LWdudS1nY2MgKFVidW50
dSA4LjMuMC02dWJ1bnR1MSkgOC4zLjAKCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
