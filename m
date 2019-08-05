Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62982142
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47F66E4C7;
	Mon,  5 Aug 2019 16:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEE66E4C7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 16:07:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: tomeu) with ESMTPSA id 1385528B534
Subject: Re: [PATCH] drm/panfrost: Remove completed features still in TODO
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190802195727.1963-1-robh@kernel.org>
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <30a588f0-ed4f-544c-cf61-21ed5377212c@collabora.com>
Date: Mon, 5 Aug 2019 18:07:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190802195727.1963-1-robh@kernel.org>
Content-Language: en-US
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yLzE5IDk6NTcgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+IFRoZXJlJ3MgYSBmZXcgZmVh
dHVyZXMgdGhlIGRyaXZlciBzdXBwb3J0cyB3aGljaCB3ZSBmb3Jnb3QgdG8gcmVtb3ZlLCBzbwo+
IHJlbW92ZSB0aGVtIG5vdy4KPiAKPiBDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29s
bGFib3JhLmNvbT4KPiBDYzogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFi
b3JhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L1RPRE8gfCA5IC0tLS0tLS0tLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9UT0RPIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L1RPRE8KPiBp
bmRleCBjMmU0NGFkZDM3ZDguLjJhYzk3MmEzNDY5YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvVE9ETwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9UT0RP
Cj4gQEAgLTEsMTUgKzEsOSBAQAo+IC0tIFRoZXJtYWwgc3VwcG9ydC4KCldhcyB0aGlua2luZyB0
aGF0IHRoaXMgaXRlbSByZWZlcnJlZCB0byBjb29saW5nIGRldmljZSBzdXBwb3J0LCB3aGljaCB3
ZSAKZG9uJ3QgeWV0IGhhdmU/CgpDaGVlcnMsCgpUb21ldQoKPiAtCj4gICAtIEJpZnJvc3Qgc3Vw
cG9ydDoKPiAgICAgLSBEVCBiaW5kaW5ncyAoTmVpbCwgV0lQKQo+ICAgICAtIE1NVSBwYWdlIHRh
YmxlIGZvcm1hdCBhbmQgYWRkcmVzcyBzcGFjZSBzZXR1cAo+ICAgICAtIEJpZnJvc3Qgc3BlY2lm
aWMgZmVhdHVyZSBhbmQgaXNzdWUgaGFuZGxpbmcKPiAgICAgLSBDb2hlcmVudCBETUEgc3VwcG9y
dAo+ICAgCj4gLS0gU3VwcG9ydCBmb3IgMk1CIHBhZ2VzLiBUaGUgaW8tcGd0YWJsZSBjb2RlIGFs
cmVhZHkgc3VwcG9ydHMgdGhpcy4gRmluaXNoaW5nCj4gLSAgc3VwcG9ydCBpbnZvbHZlcyBlaXRo
ZXIgY29weWluZyBvciBhZGFwdGluZyB0aGUgaW9tbXUgQVBJIHRvIGhhbmRsZSBwYXNzaW5nCj4g
LSAgYWxpZ25lZCBhZGRyZXNzZXMgYW5kIHNpemVzIHRvIHRoZSBpby1wZ3RhYmxlIGNvZGUuCj4g
LQo+ICAgLSBQZXIgRkQgYWRkcmVzcyBzcGFjZSBzdXBwb3J0LiBUaGUgaC93IHN1cHBvcnRzIG11
bHRpcGxlIGFkZHJlc3NlcyBzcGFjZXMuCj4gICAgIFRoZSBoYXJkIHBhcnQgaXMgaGFuZGxpbmcg
d2hlbiBtb3JlIGFkZHJlc3Mgc3BhY2VzIGFyZSBuZWVkZWQgdGhhbiB3aGF0Cj4gICAgIHRoZSBo
L3cgcHJvdmlkZXMuCj4gQEAgLTIyLDYgKzE2LDMgQEAKPiAgIAo+ICAgLSBDb21wdXRlIGpvYiBz
dXBwb3J0LiBTbyBjYWxsZWQgJ2NvbXB1dGUgb25seScgam9icyBuZWVkIHRvIGJlIHBsdW1iZWQg
dXAgdG8KPiAgICAgdXNlcnNwYWNlLgo+IC0KPiAtLSBQZXJmb3JtYW5jZSBjb3VudGVyIHN1cHBv
cnQuIChCb3JpcykKPiAtCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
