Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83BF4B978
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 15:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 735F16E3C1;
	Wed, 19 Jun 2019 13:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471C76E3C1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 13:12:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id A46E720023;
 Wed, 19 Jun 2019 15:12:08 +0200 (CEST)
Date: Wed, 19 Jun 2019 15:12:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add support for
 Raydium RM67191 panel
Message-ID: <20190619131207.GA31903@ravnborg.org>
References: <1560864646-1468-1-git-send-email-robert.chiras@nxp.com>
 <1560864646-1468-2-git-send-email-robert.chiras@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560864646-1468-2-git-send-email-robert.chiras@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=8AirrxEcAAAA:8
 a=7gkXJVJtAAAA:8 a=lZts8jThXrmayUhYaWoA:9 a=CjuIK1q_8ugA:10
 a=ST-jHhOKWsTCqRlWije3:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUm9iZXJ0LgoKVGhhbmtzIGZvciB0aGUgY29udHJpYnV0aW9uLgoKT24gVHVlLCBKdW4gMTgs
IDIwMTkgYXQgMDQ6MzA6NDVQTSArMDMwMCwgUm9iZXJ0IENoaXJhcyB3cm90ZToKPiBBZGQgZHQt
YmluZGluZ3MgZG9jdW1lbnRhdGlvbiBmb3IgUmF5ZGl1bSBSTTY3MTkxIERTSSBwYW5lbC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBSb2JlcnQgQ2hpcmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4g
LS0tCj4gIC4uLi9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3JheWRpdW0scm02NzE5MS50eHQgICAg
IHwgNDMgKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0
aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dAo+IAo+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlkaXVt
LHJtNjcxOTEudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvcmF5ZGl1bSxybTY3MTkxLnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMC4uMDk1MjYxMAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yYXlkaXVtLHJtNjcxOTEudHh0Cj4gQEAg
LTAsMCArMSw0MyBAQAo+ICtSYXlkaXVtIFJNNjcxNzEgT0xFRCBMQ0QgcGFuZWwgd2l0aCBNSVBJ
LURTSSBwcm90b2NvbAo+ICsKPiArUmVxdWlyZWQgcHJvcGVydGllczoKPiArLSBjb21wYXRpYmxl
OiAJCSJyYXlkaXVtLHJtNjcxOTEiCj4gKy0gcmVnOgkJCXZpcnR1YWwgY2hhbm5lbCBmb3IgTUlQ
SS1EU0kgcHJvdG9jb2wKPiArCQkJbXVzdCBiZSA8MD4KPiArLSBkc2ktbGFuZXM6CQludW1iZXIg
b2YgRFNJIGxhbmVzIHRvIGJlIHVzZWQKPiArCQkJbXVzdCBiZSA8Mz4gb3IgPDQ+Cj4gKy0gcG9y
dDogCQlpbnB1dCBwb3J0IG5vZGUgd2l0aCBlbmRwb2ludCBkZWZpbml0aW9uIGFzCj4gKwkJCWRl
ZmluZWQgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dDsKPiAr
CQkJdGhlIGlucHV0IHBvcnQgc2hvdWxkIGJlIGNvbm5lY3RlZCB0byBhIE1JUEktRFNJIGRldmlj
ZQo+ICsJCQlkcml2ZXIKPiArCj4gK09wdGlvbmFsIHByb3BlcnRpZXM6Cj4gKy0gcmVzZXQtZ3Bp
b3M6CQlhIEdQSU8gc3BlYyBmb3IgdGhlIFJTVF9CIEdQSU8gcGluCj4gKy0gcGluY3RybC0wCQlw
aGFuZGxlIHRvIHRoZSBwaW4gc2V0dGluZ3MgZm9yIHRoZSByZXNldCBwaW4KcGluY3RybCBpcyBu
b3QgaW5jbHVkZWQgaW4gYmluZGluZ3MsIHRoZXkgYXJlIGltcGxpY2l0LgoKPiArLSB3aWR0aC1t
bToJCXBoeXNpY2FsIHBhbmVsIHdpZHRoIFttbV0KPiArLSBoZWlnaHQtbW06CQlwaHlzaWNhbCBw
YW5lbCBoZWlnaHQgW21tXQpQbGVhc2UgcmVmZXIgdG8gcGFuZWwtY29tbW9uLnR4dCBmb3IgdGhl
IGFib3ZlLgoKPiArLSBkaXNwbGF5LXRpbWluZ3M6CXRpbWluZ3MgZm9yIHRoZSBjb25uZWN0ZWQg
cGFuZWwgYWNjb3JkaW5nIHRvIFsxXQo+ICstIHZpZGVvLW1vZGU6CQkwIC0gYnVyc3QtbW9kZQo+
ICsJCQkxIC0gbm9uLWJ1cnN0IHdpdGggc3luYyBldmVudAo+ICsJCQkyIC0gbm9uLWJ1cnN0IHdp
dGggc3luYyBwdWxzZQo+ICsKPiArWzFdOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9kaXNwbGF5LXRpbWluZy50eHQKPiArCj4gK0V4YW1wbGU6Cj4gKwo+
ICsJcGFuZWxAMCB7Cj4gKwkJY29tcGF0aWJsZSA9ICJyYXlkaXVtLHJtNjcxOTEiOwo+ICsJCXJl
ZyA9IDwwPjsKPiArCQlwaW5jdHJsLTAgPSA8JnBpbmN0cmxfbWlwaV9kc2lfMF8xX2VuPjsKPiAr
CQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOwo+ICsJCXJlc2V0LWdwaW9zID0gPCZncGlvMSA3
IEdQSU9fQUNUSVZFX0xPVz47Cj4gKwkJZHNpLWxhbmVzID0gPDQ+Owo+ICsJCXdpZHRoLW1tID0g
PDY4PjsKPiArCQloZWlnaHQtbW0gPSA8MTIxPjsKPiArCj4gKwkJcG9ydCB7Cj4gKwkJCXBhbmVs
X2luOiBlbmRwb2ludCB7Cj4gKwkJCQlyZW1vdGUtZW5kcG9pbnQgPSA8Jm1pcGlfb3V0PjsKPiAr
CQkJfTsKPiArCQl9Owo+ICsJfTsKCldpdGggdGhlIGFib3ZlIGZpeGVkOgpTaWduZWQtb2ZmLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgpOb3RlOiBZb3UgbmVlZCByLWIgZnJv
bSBEVCBtYWludGFpbmVyIGJlZm9yZSB3ZSBjYW4gYXBwbHkgaXQuCgoJU2FtCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
