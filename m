Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 867764B83E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 14:28:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712196E394;
	Wed, 19 Jun 2019 12:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681C96E394
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 12:28:53 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 9517A20026;
 Wed, 19 Jun 2019 14:28:51 +0200 (CEST)
Date: Wed, 19 Jun 2019 14:28:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add King Display
 KD035G6-54NT panel documentation
Message-ID: <20190619122850.GC29084@ravnborg.org>
References: <20190603152555.23527-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603152555.23527-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=7gkXJVJtAAAA:8 a=4-pPdtRa6f10XkIaLb0A:9 a=CjuIK1q_8ugA:10
 a=9LHmKk7ezEChjTCyhBa9:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDU6MjU6NTRQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3
cm90ZToKPiBUaGUgS0QwMzVHNi01NE5UIGlzIGEgMy41IiAzMjB4MjQwIDI0LWJpdCBURlQgTENE
IHBhbmVsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxs
b3UubmV0PgpSZXZpZXdlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKUm9i
IC0gcGluZyBmb3IgcmV2aWV3LgoKCVNhbQoKPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjI6IC0g
QWRkIGFuIGFkZHJlc3MgdG8gdGhlIHBhbmVsIG5vZGUKPiAgICAgCS0gQWRkIGluZm9ybWF0aW9u
IGFib3V0IFNQSSBwcm9wZXJ0aWVzCj4gICAgIAktIEFkZCBpbmZvcm1hdGlvbiBhYm91dCB0aGUg
J3BvcnQnIHN1Yi1ub2RlCj4gCj4gIC4uLi9wYW5lbC9raW5nZGlzcGxheSxrZDAzNWc2LTU0bnQu
dHh0ICAgICAgICB8IDQyICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQy
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2tpbmdkaXNwbGF5LGtkMDM1ZzYtNTRudC50eHQK
PiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwva2luZ2Rpc3BsYXksa2QwMzVnNi01NG50LnR4dCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2tpbmdkaXNwbGF5LGtkMDM1ZzYtNTRudC50
eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZmE5NTk2MDgy
ZTQ0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2tpbmdkaXNwbGF5LGtkMDM1ZzYtNTRudC50eHQKPiBAQCAtMCww
ICsxLDQyIEBACj4gK0tpbmcgRGlzcGxheSBLRDAzNUc2LTU0TlQgMy41IiAoMzIweDI0MCBwaXhl
bHMpIDI0LWJpdCBURlQgTENEIHBhbmVsCj4gKwo+ICtSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ICst
IGNvbXBhdGlibGU6IHNob3VsZCBiZSAia2luZ2Rpc3BsYXksa2QwMzVnNi01NG50Igo+ICstIHBv
d2VyLXN1cHBseTogU2VlIHBhbmVsLWNvbW1vbi50eHQKPiArLSByZXNldC1ncGlvczogU2VlIHBh
bmVsLWNvbW1vbi50eHQKPiArCj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gKy0gYmFja2xpZ2h0
OiBzZWUgcGFuZWwtY29tbW9uLnR4dAo+ICsKPiArVGhlIGdlbmVyaWMgYmluZGluZ3MgZm9yIHRo
ZSBTUEkgc2xhdmVzIGRvY3VtZW50ZWQgaW4gWzFdIGFsc28gYXBwbHkuCj4gKwo+ICtUaGUgZGV2
aWNlIG5vZGUgY2FuIGNvbnRhaW4gb25lICdwb3J0JyBjaGlsZCBub2RlIHdpdGggb25lIGNoaWxk
Cj4gKydlbmRwb2ludCcgbm9kZSwgYWNjb3JkaW5nIHRvIHRoZSBiaW5kaW5ncyBkZWZpbmVkIGlu
IFsyXS4gVGhpcwo+ICtub2RlIHNob3VsZCBkZXNjcmliZSBwYW5lbCdzIHZpZGVvIGJ1cy4KPiAr
Cj4gK1sxXTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NwaS9zcGktYnVzLnR4
dAo+ICtbMl06IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncmFwaC50eHQKPiAr
Cj4gK0V4YW1wbGU6Cj4gKwo+ICsmc3BpIHsKPiArCXBhbmVsQDAgewo+ICsJCWNvbXBhdGlibGUg
PSAia2luZ2Rpc3BsYXksa2QwMzVnNi01NG50IjsKPiArCQlyZWcgPSA8MD47Cj4gKwo+ICsJCXNw
aS1tYXgtZnJlcXVlbmN5ID0gPDMxMjUwMDA+Owo+ICsJCXNwaS0zd2lyZTsKPiArCQlzcGktY3Mt
aGlnaDsKPiArCj4gKwkJcmVzZXQtZ3Bpb3MgPSA8JmdwZSAyIEdQSU9fQUNUSVZFX0xPVz47Cj4g
Kwo+ICsJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0PjsKPiArCQlwb3dlci1zdXBwbHkgPSA8Jmxk
bzY+Owo+ICsKPiArCQlwb3J0IHsKPiArCQkJcGFuZWxfaW5wdXQ6IGVuZHBvaW50IHsKPiArCQkJ
CXJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxfb3V0cHV0PjsKPiArCQkJfTsKPiArCQl9Owo+ICsJ
fTsKPiArfTsKPiAtLSAKPiAyLjIxLjAuNTkzLmc1MTFlYzM0NWUxOApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
