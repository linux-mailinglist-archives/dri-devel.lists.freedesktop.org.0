Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C536E3B87E
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 17:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F001189170;
	Mon, 10 Jun 2019 15:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5F689170
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 15:48:58 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id DA7562003D;
 Mon, 10 Jun 2019 17:48:55 +0200 (CEST)
Date: Mon, 10 Jun 2019 17:48:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dingchen Zhang <dingchen.zhang@amd.com>
Subject: Re: [PATCH] drm: remove the newline for CRC source name.
Message-ID: <20190610154849.GA32639@ravnborg.org>
References: <20190610134751.14356-1-dingchen.zhang@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190610134751.14356-1-dingchen.zhang@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=zd2uoN0lAAAA:8
 a=7gkXJVJtAAAA:8 a=R4uLhBiHclk7Ll0bXzIA:9 a=CjuIK1q_8ugA:10
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGluZ2NoZW4uCk9uIE1vbiwgSnVuIDEwLCAyMDE5IGF0IDA5OjQ3OjUxQU0gLTA0MDAsIERp
bmdjaGVuIFpoYW5nIHdyb3RlOgo+IHVzZXJzcGFjZSBtYXkgdHJhbnNmZXIgYSBuZXdsaW5lLCBh
bmQgdGhpcyB0ZXJtaW5hdGluZyBuZXdsaW5lCj4gaXMgcmVwbGFjZWQgYnkgYSAnXDAnIHRvIGF2
b2lkIGZvbGxvd3VwIGlzc3Vlcy4KPiAKPiAnbGVuLTEnIGlzIHRoZSBpbmRleCB0byByZXBsYWNl
IHRoZSBuZXdsaW5lIG9mIENSQyBzb3VyY2UgbmFtZS4KPiAKPiB2MzogdHlwbyBmaXggKFNhbSkK
PiAKPiB2MjogdXBkYXRlIHBhdGNoIHN1YmplY3QsIGJvZHkgYW5kIGZvcm1hdC4gKFNhbSkKPiAK
PiBDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4gQ2M6IEhhcnJ5IFdlbnRsYW5kIDxI
YXJyeS5XZW50bGFuZEBhbWQuY29tPgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5v
cmc+Cj4gU2lnbmVkLW9mZi1ieTogRGluZ2NoZW4gWmhhbmcgPGRpbmdjaGVuLnpoYW5nQGFtZC5j
b20+ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
ZWJ1Z2ZzX2NyYy5jCj4gaW5kZXggNTg1MTY5ZjBkY2M1Li5kYWMyNjdlODQwYWYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCj4gQEAgLTEzMSw4ICsxMzEsOCBAQCBzdGF0aWMgc3Np
emVfdCBjcmNfY29udHJvbF93cml0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwgY29uc3QgY2hhciBfX3Vz
ZXIgKnVidWYsCj4gIAlpZiAoSVNfRVJSKHNvdXJjZSkpCj4gIAkJcmV0dXJuIFBUUl9FUlIoc291
cmNlKTsKPiAgCj4gLQlpZiAoc291cmNlW2xlbl0gPT0gJ1xuJykKPiAtCQlzb3VyY2VbbGVuXSA9
ICdcMCc7Cj4gKwlpZiAoc291cmNlW2xlbiAtIDFdID09ICdcbicpCj4gKwkJc291cmNlW2xlbiAt
IDFdID0gJ1wwJzsKPiAgCj4gIAlyZXQgPSBjcnRjLT5mdW5jcy0+dmVyaWZ5X2NyY19zb3VyY2Uo
Y3J0Yywgc291cmNlLCAmdmFsdWVzX2NudCk7Cj4gIAlpZiAocmV0KQo+IC0tIAo+IDIuMTcuMQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
