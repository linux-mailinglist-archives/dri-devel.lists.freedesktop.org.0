Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865158017A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 21:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A0E6E855;
	Fri,  2 Aug 2019 19:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322FE6E855
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 19:58:27 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DB2FA28CB09;
 Fri,  2 Aug 2019 20:58:25 +0100 (BST)
Date: Fri, 2 Aug 2019 21:58:22 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] drm/panfrost: Remove completed features still in TODO
Message-ID: <20190802215822.673a03b6@collabora.com>
In-Reply-To: <20190802195727.1963-1-robh@kernel.org>
References: <20190802195727.1963-1-robh@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAgMiBBdWcgMjAxOSAxMzo1NzoyNyAtMDYwMApSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKCj4gVGhlcmUncyBhIGZldyBmZWF0dXJlcyB0aGUgZHJpdmVyIHN1cHBv
cnRzIHdoaWNoIHdlIGZvcmdvdCB0byByZW1vdmUsIHNvCj4gcmVtb3ZlIHRoZW0gbm93Lgo+IAo+
IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+IENjOiBCb3Jp
cyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgoKUmV2aWV3ZWQtYnk6
IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+Cgo+IFNpZ25l
ZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9UT0RPIHwgOSAtLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9U
T0RPIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L1RPRE8KPiBpbmRleCBjMmU0NGFkZDM3ZDgu
LjJhYzk3MmEzNDY5YyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvVE9E
Two+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9UT0RPCj4gQEAgLTEsMTUgKzEsOSBA
QAo+IC0tIFRoZXJtYWwgc3VwcG9ydC4KPiAtCj4gIC0gQmlmcm9zdCBzdXBwb3J0Ogo+ICAgIC0g
RFQgYmluZGluZ3MgKE5laWwsIFdJUCkKPiAgICAtIE1NVSBwYWdlIHRhYmxlIGZvcm1hdCBhbmQg
YWRkcmVzcyBzcGFjZSBzZXR1cAo+ICAgIC0gQmlmcm9zdCBzcGVjaWZpYyBmZWF0dXJlIGFuZCBp
c3N1ZSBoYW5kbGluZwo+ICAgIC0gQ29oZXJlbnQgRE1BIHN1cHBvcnQKPiAgCj4gLS0gU3VwcG9y
dCBmb3IgMk1CIHBhZ2VzLiBUaGUgaW8tcGd0YWJsZSBjb2RlIGFscmVhZHkgc3VwcG9ydHMgdGhp
cy4gRmluaXNoaW5nCj4gLSAgc3VwcG9ydCBpbnZvbHZlcyBlaXRoZXIgY29weWluZyBvciBhZGFw
dGluZyB0aGUgaW9tbXUgQVBJIHRvIGhhbmRsZSBwYXNzaW5nCj4gLSAgYWxpZ25lZCBhZGRyZXNz
ZXMgYW5kIHNpemVzIHRvIHRoZSBpby1wZ3RhYmxlIGNvZGUuCj4gLQo+ICAtIFBlciBGRCBhZGRy
ZXNzIHNwYWNlIHN1cHBvcnQuIFRoZSBoL3cgc3VwcG9ydHMgbXVsdGlwbGUgYWRkcmVzc2VzIHNw
YWNlcy4KPiAgICBUaGUgaGFyZCBwYXJ0IGlzIGhhbmRsaW5nIHdoZW4gbW9yZSBhZGRyZXNzIHNw
YWNlcyBhcmUgbmVlZGVkIHRoYW4gd2hhdAo+ICAgIHRoZSBoL3cgcHJvdmlkZXMuCj4gQEAgLTIy
LDYgKzE2LDMgQEAKPiAgCj4gIC0gQ29tcHV0ZSBqb2Igc3VwcG9ydC4gU28gY2FsbGVkICdjb21w
dXRlIG9ubHknIGpvYnMgbmVlZCB0byBiZSBwbHVtYmVkIHVwIHRvCj4gICAgdXNlcnNwYWNlLgo+
IC0KPiAtLSBQZXJmb3JtYW5jZSBjb3VudGVyIHN1cHBvcnQuIChCb3JpcykKPiAtCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
